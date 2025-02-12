BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0

IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name = N'[Uncategorized (Local)]' AND category_class = 1)
BEGIN
    EXEC @ReturnCode = msdb.dbo.sp_add_category @class = N'JOB', @type = N'LOCAL', @name = N'[Uncategorized (Local)]'
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
END

DECLARE @jobId BINARY(16)

EXEC @ReturnCode = msdb.dbo.sp_add_job @job_name = N'BlockExpiredShoppingCarts', 
    @enabled = 1, 
    @notify_level_eventlog = 0, 
    @notify_level_email = 0, 
    @notify_level_netsend = 0, 
    @notify_level_page = 0, 
    @delete_level = 0, 
    @description = N'Job to block shopping carts after 3 minutes if transaction is not successful.', 
    @category_name = N'[Uncategorized (Local)]', 
    @owner_login_name = N'Rhaenyra\fdama', 
    @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback


EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @jobId, 
                                          @step_name = N'BlockExpiredShoppingCartStep', 
                                          @step_id = 1, 
                                          @cmdexec_success_code = 0, 
                                          @on_success_action = 1, 
                                          @on_success_step_id = 2,  -- Step بعدی پس از بلاک شدن سبد خرید
                                          @on_fail_action = 2, 
                                          @on_fail_step_id = 0, 
                                          @retry_attempts = 0, 
                                          @retry_interval = 0, 
                                          @os_run_priority = 0, 
                                          @subsystem = N'TSQL', 
                                          @command = N'
                                        UPDATE sc
SET sc.status = ''Blocked''
FROM shopping_cart sc
INNER JOIN locked_shopping_cart lsc 
    ON sc.number = lsc.cart_number
LEFT JOIN issued_for iss 
    ON sc.number = iss.cart_number
WHERE DATEDIFF(SECOND, (SELECT TOP 1 locked_time 
                        FROM locked_shopping_cart 
                        WHERE cart_number = sc.number 
                        ORDER BY locked_time DESC), GETDATE()) >= 180
  AND sc.status = ''Locked''
  AND (
        iss.cart_number IS NULL 
        OR (SELECT t.status
             FROM transactions t
             INNER JOIN issued_for iss2 
                 ON t.tracking_code = iss2.tracking_code
             WHERE iss2.cart_number = sc.number) <> ''Successful''
      );
                                          ', 
                                          @database_name = N'payga', 
                                          @flags = 0;
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

-- ایجاد Step برای به‌روزرسانی موجودی محصولات
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @jobId, 
                                          @step_name = N'UpdateProductStock', 
                                          @step_id = 2,  
                                          @cmdexec_success_code = 0, 
                                          @on_success_action = 1, 
                                          @on_success_step_id = 0, 
                                          @on_fail_action = 2, 
                                          @on_fail_step_id = 0, 
                                          @retry_attempts = 0, 
                                          @retry_interval = 0, 
                                          @os_run_priority = 0, 
                                          @subsystem = N'TSQL', 
                                          @command = N'
-- افزایش موجودی محصولات در جدول product بر اساس اطلاعات موجود در added_to_cart
UPDATE p
SET p.stock_count = p.stock_count + atc.quantity
FROM product p
INNER JOIN added_to_cart atc 
    ON p.id = atc.id_product
INNER JOIN shopping_cart sc 
    ON sc.number = atc.cart_number
WHERE sc.status = ''Blocked''
                                          ', 
                                          @database_name = N'payga', 
                                          @flags = 0;
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

-- ایجاد زمان‌بندی برای Job (اجرای هر دقیقه)
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @jobId, 
                                              @name = N'RunEveryMinute', 
                                              @enabled = 1, 
                                              @freq_type = 4, 
                                              @freq_interval = 1, 
                                              @freq_subday_type = 4, 
                                              @freq_subday_interval = 1, 
                                              @freq_relative_interval = 0, 
                                              @freq_recurrence_factor = 0, 
                                              @active_start_date = 20250211, 
                                              @active_end_date = 99991231, 
                                              @active_start_time = 0, 
                                              @active_end_time = 235959, 
                                              @schedule_uid = N'789b4ce0-3667-4447-a0b1-132445ef2e73'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

-- اختصاص Job به سرور
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, 
                                            @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

-- Commit کردن تراکنش
COMMIT TRANSACTION
GOTO EndSave

QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION

EndSave:
GO

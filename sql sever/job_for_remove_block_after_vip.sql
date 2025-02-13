BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0

-- ????? ????????? ???? Job (?? ???? ??? ????)
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
    EXEC @ReturnCode = msdb.dbo.sp_add_category 
        @class=N'JOB', 
        @type=N'LOCAL', 
        @name=N'[Uncategorized (Local)]'
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
END

-- ????? Job ????
DECLARE @jobId BINARY(16)
EXEC @ReturnCode = msdb.dbo.sp_add_job 
    @job_name=N'DeleteInvalidBlockedCarts', 
    @enabled=1, 
    @notify_level_eventlog=0, 
    @notify_level_email=0, 
    @notify_level_netsend=0, 
    @notify_level_page=0, 
    @delete_level=0, 
    @description=N'Job to delete blocked shopping carts that belong to non-existent VIP clients.', 
    @category_name=N'[Uncategorized (Local)]', 
    @owner_login_name=N'SA', -- ?? ???? ???????
    @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

-- ????? ?? ????? ???? ??? ?????? ???? ???????
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep 
    @job_id=@jobId, 
    @step_name=N'DeleteInvalidBlockedCartsStep', 
    @step_id=1, 
    @cmdexec_success_code=0, 
    @on_success_action=1, 
    @on_success_step_id=0, 
    @on_fail_action=2, 
    @on_fail_step_id=0, 
    @retry_attempts=0, 
    @retry_interval=0, 
    @os_run_priority=0, 
    @subsystem=N'TSQL', 
    @command=N'
        DELETE FROM shopping_cart
        WHERE status = ''Blocked''
        AND (
     
            (LEN(CAST(number AS VARCHAR)) = 1 AND number BETWEEN (number / 100) * 100 + 2 AND (number / 100) * 100 + 5)
            OR
      
            (LEN(CAST(number AS VARCHAR)) > 1 AND number BETWEEN (number / 10) * 10 + 2 AND (number / 10) * 10 + 5)
        )
        AND NOT EXISTS (
            SELECT 1
            FROM vip_client vc
            WHERE vc.id = (number / 100) 
        );
    ', 
    @database_name=N'payga', 
    @flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

-- ????????? ????? Job (?? 1 ?????)
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule 
    @job_id=@jobId, 
    @name=N'RunEveryMinute', 
    @enabled=1, 
    @freq_type=4,  -- ??????
    @freq_interval=1, 
    @freq_subday_type=4,  -- ?? ??? ?????
    @freq_subday_interval=1,  -- ?? 1 ?????
    @freq_relative_interval=0, 
    @freq_recurrence_factor=0, 
    @active_start_date=20250213,  -- ????? ???? (YYYYMMDD)
    @active_end_date=99991231, 
    @active_start_time=0, 
    @active_end_time=235959
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

-- ????? ???? Job ?? ????
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver 
    @job_id = @jobId, 
    @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

COMMIT TRANSACTION
GOTO EndSave

QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

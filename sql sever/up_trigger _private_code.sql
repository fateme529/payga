
CREATE TRIGGER trg_private_code_client_update
ON client
FOR UPDATE
AS
BEGIN
    UPDATE pc
    SET pc.id = i.id
    FROM private_code pc
    INNER JOIN inserted i ON pc.id = i.id;
END;
GO


CREATE TRIGGER trg_private_code_discount_code_update
ON discount_code
FOR UPDATE
AS
BEGIN
    UPDATE pc
    SET pc.pri_code = i.dis_code
    FROM private_code pc
    INNER JOIN inserted i ON pc.pri_code = i.dis_code;
END;
GO

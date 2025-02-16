CREATE TRIGGER trg_HashPassword
ON client
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE client
    SET password = CONVERT(VARCHAR(100), HASHBYTES('SHA2_256', password), 2)
    WHERE id IN (SELECT id FROM inserted)
    AND password NOT LIKE '0x%';
END;

CREATE TRIGGER trg_Delete_Refers
ON client
INSTEAD OF DELETE
AS
BEGIN

    DELETE FROM refers WHERE referee IN (SELECT id FROM deleted);
    DELETE FROM refers WHERE referrer IN (SELECT id FROM deleted);
    
    DELETE FROM client WHERE id IN (SELECT id FROM deleted);
END;
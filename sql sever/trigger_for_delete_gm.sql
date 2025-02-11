CREATE TRIGGER trg_delete_gm_slot_compatible_with
ON gm_slot_compatible_with
AFTER DELETE
AS
BEGIN
    DELETE FROM gm_slot_compatible_with
    WHERE motherboard_id_gm IN (SELECT motherboard_id_gm FROM deleted)
    OR gpu_id_gm IN (SELECT gpu_id_gm FROM deleted);
END;

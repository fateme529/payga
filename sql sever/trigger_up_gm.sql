CREATE TRIGGER trg_update_gm_slot_compatible_with
ON gm_slot_compatible_with
AFTER UPDATE
AS
BEGIN

    UPDATE gm_slot_compatible_with
    SET gpu_id_gm = i.gpu_id_gm,  
        motherboard_id_gm = i.motherboard_id_gm 
    FROM gm_slot_compatible_with g
    INNER JOIN inserted i  
    ON g.motherboard_id_gm = i.motherboard_id_gm
    AND g.gpu_id_gm = i.gpu_id_gm;
END;

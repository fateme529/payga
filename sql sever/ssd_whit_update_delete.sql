USE payga;

CREATE TABLE sm_slot_compatible_with (
    motherboard_id_sm INT NOT NULL,
    ssd_id_sm INT NOT NULL,
    PRIMARY KEY (motherboard_id_sm, ssd_id_sm)
);


ALTER TABLE sm_slot_compatible_with
ADD CONSTRAINT fk_motherboard_id_sm FOREIGN KEY (motherboard_id_sm)
    REFERENCES motherboard (id);

ALTER TABLE sm_slot_compatible_with
ADD CONSTRAINT fk_ssd_id_sm FOREIGN KEY (ssd_id_sm)
    REFERENCES ssd (id);

	ALTER TABLE sm_slot_compatible_with
ADD CONSTRAINT fk_motherboard_id_sm FOREIGN KEY (motherboard_id_sm) 
    REFERENCES motherboard (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

CREATE TRIGGER trg_Delete_ssd_in_sm_slot
ON ssd
FOR DELETE
AS
BEGIN
    DELETE FROM sm_slot_compatible_with
    WHERE ssd_id_sm IN (SELECT id FROM deleted)
END;

CREATE TRIGGER trg_Update_ssd_in_sm_slot
ON ssd
FOR UPDATE
AS
BEGIN
    UPDATE sm_slot_compatible_with
    SET ssd_id_sm = i.id
    FROM sm_slot_compatible_with s
    INNER JOIN inserted i ON s.ssd_id_sm = i.id
    WHERE s.ssd_id_sm IN (SELECT id FROM deleted)
END;



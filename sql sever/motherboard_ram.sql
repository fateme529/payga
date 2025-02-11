CREATE TABLE rm_slot_compatible_with (
    motherboard_id_fk INT NOT NULL,
    ram_id INT NOT NULL,
    PRIMARY KEY (motherboard_id_fk, ram_id),
    CONSTRAINT fk_motherboard_id_rm FOREIGN KEY (motherboard_id_fk) 
        REFERENCES motherboard (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_ram_id FOREIGN KEY (ram_id) 
        REFERENCES ram_stick (id)

);

CREATE TRIGGER trg_rm_slot_delete_ram
ON ram_stick
FOR DELETE
AS
BEGIN
    DELETE FROM rm_slot_compatible_with
    WHERE ram_id IN (SELECT id FROM deleted);
END;

CREATE TRIGGER trg_rm_slot_update_ram
ON ram_stick
FOR UPDATE
AS
BEGIN
    UPDATE rm_slot_compatible_with
    SET ram_id = i.id
    FROM rm_slot_compatible_with r
    INNER JOIN inserted i ON r.ram_id = i.id;
END;

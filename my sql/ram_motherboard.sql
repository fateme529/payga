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
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE sm_slot_compatible_with (
    motherboard_id_sm INT NOT NULL,
    ssd_id_sm INT NOT NULL,
    PRIMARY KEY (motherboard_id_sm, ssd_id_sm),
    CONSTRAINT fk_motherboard_id_sm FOREIGN KEY (motherboard_id_sm) 
        REFERENCES motherboard (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_ssd_id_sm FOREIGN KEY (ssd_id_sm) 
        REFERENCES ssd (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

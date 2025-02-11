USE payga;
CREATE TABLE gm_slot_compatible_with (
    motherboard_id_gm INT NOT NULL,
    gpu_id_gm INT NOT NULL,
    PRIMARY KEY (motherboard_id_gm, gpu_id_gm),
    CONSTRAINT fk_motherboard_id_gm FOREIGN KEY (motherboard_id_gm) 
        REFERENCES motherboard (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_gpu_id_gm FOREIGN KEY (gpu_id_gm) 
        REFERENCES gpu (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


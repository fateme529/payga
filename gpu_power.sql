USE payga;

CREATE TABLE gp_connector_compatible_with (
    gpu_id_connector INT NOT NULL,
    power_id INT NOT NULL,
    PRIMARY KEY (gpu_id_connector, power_id),
    CONSTRAINT fk_gpu_id_connector FOREIGN KEY (gpu_id_connector) 
        REFERENCES gpu (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_power_id FOREIGN KEY (power_id) 
        REFERENCES power_supply (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

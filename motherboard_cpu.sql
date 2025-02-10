CREATE TABLE ms_socket_compatible_with (
    cpu_id INT NOT NULL,
    motherboard_id INT NOT NULL,
    PRIMARY KEY (cpu_id, motherboard_id),
    CONSTRAINT fk_cpu_id FOREIGN KEY (cpu_id) 
        REFERENCES cpu (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_motherboard_id FOREIGN KEY (motherboard_id) 
        REFERENCES motherboard (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

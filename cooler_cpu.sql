USE payga;

CREATE TABLE cc_socket_compatible_with (
    cooler_id INT NOT NULL,
    cpu_id INT NOT NULL,
    PRIMARY KEY (cooler_id, cpu_id),
    CONSTRAINT fk_cooler FOREIGN KEY (cooler_id) 
        REFERENCES cooler (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_cpu FOREIGN KEY (cpu_id) 
        REFERENCES cpu (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE vip_client (
     code VARCHAR(50) NOT NULL,
    id INT NOT NULL,
	vip_time DATETIME NOT NULL,
    PRIMARY KEY (code),
     CONSTRAINT fk_vip_client FOREIGN KEY (id)
        REFERENCES client (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_code FOREIGN KEY (code)
        REFERENCES discount_code (dis_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

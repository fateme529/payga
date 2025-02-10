CREATE TABLE address (
    id INT NOT NULL,
    province VARCHAR(255) NOT NULL,
    remainder VARCHAR(255) NOT NULL,
    PRIMARY KEY (id,province,remainder),
	CONSTRAINT fk_address FOREIGN KEY (id)
	REFERENCES client (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

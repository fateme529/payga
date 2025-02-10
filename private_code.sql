CREATE TABLE private_code (
    pri_code VARCHAR(50) NOT NULL,
    id INT NOT NULL,
    timestamp DATETIME NULL,
    PRIMARY KEY (Pri_code),
    CONSTRAINT fk_private_code_client FOREIGN KEY (id) 
        REFERENCES client (id)ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_private_code_discount_code FOREIGN KEY (pri_code) 
        REFERENCES discount_code (dis_code)ON UPDATE CASCADE ON DELETE CASCADE
);

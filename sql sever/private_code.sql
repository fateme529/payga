IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'private_code')
BEGIN
    CREATE TABLE private_code (
        pri_code VARCHAR(50) NOT NULL,
        id INT NOT NULL,
        pri_time DATETIME NOT NULL,
        PRIMARY KEY (pri_code),
        CONSTRAINT fk_private_code_client FOREIGN KEY (id)
            REFERENCES client (id) ON DELETE CASCADE,
        CONSTRAINT fk_private_code_discount_code FOREIGN KEY (pri_code)
            REFERENCES discount_code (dis_code) ON DELETE CASCADE
    );
END;
GO

USE payga;
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'address')
BEGIN
    CREATE TABLE address (
        id INT NOT NULL,
        province VARCHAR(255) NOT NULL,
        remainder VARCHAR(255) NOT NULL,
        PRIMARY KEY (id, province, remainder),
        CONSTRAINT fk_address FOREIGN KEY (id)
            REFERENCES client (id)
            ON DELETE CASCADE
    );
END;
GO


CREATE TRIGGER trg_Address_Update
ON client
FOR UPDATE
AS
BEGIN
    UPDATE address
    SET address.id = i.id
    FROM address
    INNER JOIN inserted i ON address.id = i.id;
END;
GO

USE payga;
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'cpu')
BEGIN
    CREATE TABLE cpu (
        id INT NOT NULL,
        maximum_addressable_memory_limit INT NOT NULL,
        boost_frequency DECIMAL(8, 4) NOT NULL, 
        base_frequency DECIMAL(8, 4) NOT NULL,
        number_of_cores INT NOT NULL, 
        number_of_Threads INT NOT NULL, 
        microarchitecture VARCHAR(100) NOT NULL,  
        generation VARCHAR(50) NOT NULL, 
        wattage DECIMAL(8, 2) NOT NULL, 
        PRIMARY KEY (id),
        CONSTRAINT FK_CPU_PRODUCT FOREIGN KEY (id)
            REFERENCES product (id)
            ON DELETE CASCADE
    );
END;
GO

CREATE TRIGGER trg_CPU_update
ON product
FOR UPDATE
AS
BEGIN
    UPDATE cpu
    SET cpu.id = i.id
    FROM cpu
    INNER JOIN inserted i ON cpu.id = i.id;
END;
GO


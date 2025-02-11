USE payga;
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'gpu')
BEGIN
    CREATE TABLE gpu (
        id INT NOT NULL,
        clock_speed DECIMAL(8, 2) NOT NULL,
        ram_size INT NOT NULL,  
        number_of_fans INT NOT NULL, 
        wattage DECIMAL(8, 2) NOT NULL,  
        height DECIMAL(10, 2) NULL,
        width DECIMAL(10, 2) NOT NULL, 
        depth DECIMAL(10, 2) NOT NULL, 
        PRIMARY KEY (id),
        CONSTRAINT FK_GPU_PRODUCT FOREIGN KEY (id)
            REFERENCES product (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    );
END;
GO

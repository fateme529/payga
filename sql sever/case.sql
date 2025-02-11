USE payga;
GO


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'p_case')
BEGIN
    CREATE TABLE p_case (
        id INT NOT NULL,
        number_of_fans INT NOT NULL,
        fan_size DECIMAL(5, 2) NOT NULL,  
        wattage DECIMAL(8, 2) NOT NULL, 
        case_type VARCHAR(100) NOT NULL,
        material VARCHAR(100) NOT NULL,
        color VARCHAR(100) NOT NULL,
        height DECIMAL(10, 2) NULL, 
        width DECIMAL(10, 2) NOT NULL, 
        depth DECIMAL(10, 2) NOT NULL,  
        PRIMARY KEY (id),
        CONSTRAINT FK_CASE_PRODUCT FOREIGN KEY (id)
            REFERENCES product (id)
            ON DELETE CASCADE
    );
END;
GO

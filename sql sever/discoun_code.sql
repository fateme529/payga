IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'discount_code')
BEGIN
    CREATE TABLE discount_code (
        dis_code VARCHAR(50) NOT NULL,
        amount DECIMAL(15, 2) NOT NULL,
        dis_limit DECIMAL(15, 2) NULL,
        usage_count INT DEFAULT 1,
        expiration_date DATE NULL,
        PRIMARY KEY (dis_code)
    );
END;


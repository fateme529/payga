
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'product')
CREATE TABLE product (
    id INT IDENTITY(1,1) NOT NULL,
    category VARCHAR(45) NOT NULL,
    image VARBINARY(MAX) NOT NULL,
    current_price DECIMAL(25, 2) NOT NULL CHECK (current_price >= 0), 
    stock_count INT NOT NULL CHECK (stock_count >= 0),
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    PRIMARY KEY (id) 
);


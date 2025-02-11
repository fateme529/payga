
CREATE TABLE client (
    id INT IDENTITY(1,1) NOT NULL,
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    wallet_balance DECIMAL(18, 2) DEFAULT 0.00 CHECK (wallet_balance >= 0),
    timestamp DATETIME DEFAULT GETDATE(),
    referal_code INT,
    PRIMARY KEY (id)
);

CREATE INDEX idx_phone_number ON client(phone_number);

CREATE DATABASE pisaz;
USE payga;

CREATE TABLE client (
    id INT AUTO_INCREMENT NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    wallet_balance DECIMAL(18, 2) DEFAULT 0.00, 
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    referal_code VARCHAR(20),
    PRIMARY KEY (id),
    UNIQUE KEY Unique_Phone (phone_number),
    CHECK (wallet_balance >= 0) 
);


CREATE INDEX idx_phone_number ON client(phone_number);

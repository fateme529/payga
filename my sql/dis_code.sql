
CREATE DATABASE IF NOT EXISTS payga;
USE payga;

CREATE TABLE IF NOT EXISTS discount_code (
    dis_code VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    dis_limit DECIMAL(10, 2) NULL,
    usage_count INT DEFAULT 1, 
    expiration_date DATE DEFAULT NULL,
    PRIMARY KEY (dis_code)
) ENGINE=InnoDB;

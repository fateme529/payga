CREATE DATABASE IF NOT EXISTS payga;
USE payga;

CREATE TABLE IF NOT EXISTS transactions (
    tracking_code INT NOT NULL AUTO_INCREMENT,
    status VARCHAR(20) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (tracking_code) 
) ENGINE=InnoDB;

ALTER TABLE transactions
ADD CONSTRAINT chk_status CHECK (status IN ('partially_successful', 'failed', 'successful'));

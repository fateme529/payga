CREATE DATABASE IF NOT EXISTS pisaz;
USE payga;

CREATE TABLE IF NOT EXISTS refers (
    referee INT NOT NULL,
    referrer INT NULL, 
    PRIMARY KEY (referee), 
    CONSTRAINT fk_refers_referee FOREIGN KEY (referee) REFERENCES client (id),
    CONSTRAINT fk_refers_referrer FOREIGN KEY (referrer) REFERENCES client (id)
) ENGINE=InnoDB; 

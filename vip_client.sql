CREATE DATABASE IF NOT EXISTS payga;
USE payga;

CREATE TABLE IF NOT EXISTS vip_clients (
    id INT  NOT NULL AUTO_INCREMENT,
    subscription_expiration_time DATETIME NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_vip_clients FOREIGN KEY (id) REFERENCES client (id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE DATABASE IF NOT EXISTS payga;
USE payga;

CREATE TABLE cpu (
    id INT NOT NULL,
    Maximum_addressable_memory_limit INT NOT NULL,
    boost_frequency DECIMAL(8, 4) NOT NULL, 
    base_frequency DECIMAL(8, 4) NOT NULL,   
    number_of_cores INT NOT NULL,
    number_of_Threads INT NOT NULL,
    microarchitecture VARCHAR(100) NOT NULL,  
    generation VARCHAR(50) NOT NULL,         
    wattage DECIMAL(8, 2) NOT NULL,         
    PRIMARY KEY (id),
    CONSTRAINT FK_CPU_PRODUCT FOREIGN KEY (id)
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




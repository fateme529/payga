CREATE DATABASE IF NOT EXISTS payga;
USE payga;

CREATE TABLE cpu (
    id INT NOT NULL,
    maximum_addressable_memory_limit INT NOT NULL COMMENT'Maximum addressable memory limit in GB',
    boost_frequency DECIMAL(8, 4) NOT NULL COMMENT 'Boost frequency in GHz', 
    base_frequency DECIMAL(8, 4) NOT NULL COMMENT 'Base frequency in GHz',   
    number_of_cores INT NOT NULL COMMENT 'Number of cores',
    number_of_Threads INT NOT NULL COMMENT 'Number of threads',
    microarchitecture VARCHAR(100) NOT NULL COMMENT 'Microarchitecture of the CPU',  
    generation VARCHAR(50) NOT NULL COMMENT 'Generation of the CPU',         
	wattage DECIMAL(8, 2) NOT NULL COMMENT 'Power consumption in watts (W)',         
    PRIMARY KEY (id),
    CONSTRAINT FK_CPU_PRODUCT FOREIGN KEY (id)
        REFERENCES product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




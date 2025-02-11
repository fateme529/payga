CREATE TABLE IF NOT EXISTS refers (
    referee INT NOT NULL,
    referrer INT NOT NULL,
    PRIMARY KEY (referee),
    CONSTRAINT fk_refers_referee FOREIGN KEY (referee) REFERENCES client (id) ON DELETE CASCADE,
    CONSTRAINT fk_refers_referrer FOREIGN KEY (referrer) REFERENCES client (id) ON DELETE CASCADE
) ENGINE=InnoDB;

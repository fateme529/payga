USE payga;

CREATE TABLE gp_connector_compatible_with (
    gpu_id_connector INT NOT NULL,
    power_id INT NOT NULL,
    PRIMARY KEY (gpu_id_connector, power_id),
    CONSTRAINT fk_gpu_id_connector FOREIGN KEY (gpu_id_connector) 
        REFERENCES gpu (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_power_id FOREIGN KEY (power_id) 
        REFERENCES power_supply (id)
   
);
CREATE TRIGGER trg_gp_connector_delete
ON power_supply
FOR DELETE
AS
BEGIN
    DELETE FROM gp_connector_compatible_with
    WHERE power_id IN (SELECT power_id FROM deleted);
END;

CREATE TRIGGER trg_gp_connector_update
ON power_supply
FOR UPDATE
AS
BEGIN
    UPDATE gp_connector_compatible_with
    SET power_id = i.id
    FROM gp_connector_compatible_with g
    INNER JOIN inserted i ON g.power_id = i.id;
END;



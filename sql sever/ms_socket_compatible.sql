CREATE TABLE ms_socket_compatible_with (
    cpu_id INT NOT NULL,
    motherboard_id INT NOT NULL,
    PRIMARY KEY (cpu_id, motherboard_id),
    CONSTRAINT fk_cpu_id FOREIGN KEY (cpu_id) 
        REFERENCES cpu (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_motherboard_id FOREIGN KEY (motherboard_id) 
        REFERENCES motherboard (id)

);

CREATE TRIGGER trg_ms_socket_delete_motherboard
ON motherboard
FOR DELETE
AS
BEGIN
    DELETE FROM ms_socket_compatible_with
    WHERE motherboard_id IN (SELECT id FROM deleted);
END;

CREATE TRIGGER trg_ms_socket_update_motherboard
ON motherboard
FOR UPDATE
AS
BEGIN
    UPDATE ms_socket_compatible_with
    SET motherboard_id = i.id
    FROM ms_socket_compatible_with m
    INNER JOIN inserted i ON m.motherboard_id = i.id;
END;



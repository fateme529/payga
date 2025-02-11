USE payga;

CREATE TABLE cc_socket_compatible_with (
    cooler_id INT NOT NULL,
    cpu_id INT NOT NULL,
    PRIMARY KEY (cooler_id, cpu_id),
    CONSTRAINT fk_cooler FOREIGN KEY (cooler_id) 
        REFERENCES cooler (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_cpu FOREIGN KEY (cpu_id) 
        REFERENCES cpu (id)
 
) ;


CREATE TRIGGER trg_cc_socket_delete_cpu
ON cpu
FOR DELETE
AS
BEGIN
    DELETE FROM cc_socket_compatible_with
    WHERE cpu_id IN (SELECT id FROM deleted);
END;

CREATE TRIGGER trg_cc_socket_update_cpu
ON cpu
FOR UPDATE
AS
BEGIN
    UPDATE cc_socket_compatible_with
    SET cpu_id = i.id
    FROM cc_socket_compatible_with c
    INNER JOIN inserted i ON c.cpu_id = i.id;
END;




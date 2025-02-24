CREATE TRIGGER insert_compatibility
ON cpu
AFTER INSERT
AS
BEGIN
   
    DECLARE @cpu_id INT;
    SELECT @cpu_id = id FROM inserted;



    INSERT INTO cc_socket_compatible_with(cpu_id, cooler_id)
    SELECT @cpu_id, id
    FROM cooler
    
END;

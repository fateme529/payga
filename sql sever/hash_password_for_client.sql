DELETE FROM client;

ALTER TABLE client 
ADD user_name NVARCHAR(50) NOT NULL UNIQUE,  
    [password] NVARCHAR(255) NOT NULL;



	INSERT INTO client (phone_number,first_name,last_name,user_name, [password]) 
VALUES (09053040785,'fateme','dama','testUser', 'sewdna');

select* from client

SELECT user_name, password FROM client WHERE user_name = 'testUser';

UPDATE client
SET password = CONVERT(VARCHAR(100), HASHBYTES('SHA2_256', password), 2)
WHERE password NOT LIKE '0x%';


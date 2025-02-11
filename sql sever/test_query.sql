insert into client(phone_number,first_name,last_name,referal_code)
values(09109087,'fateme','dama',8)

insert into vip_client(id,Subscription_expiration_time)
values(8,2)
select* from refers

select* from client
select*from vip_client
select* from private_code
select*from discount_code
select*from shopping_cart
select*from product

INSERT INTO product(category, image, current_price, stock_count, brand, model)
VALUES (
    'laptop', 
    (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\fdama\Pictures\smail.PNG', SINGLE_BLOB) AS img), 
    100000, 
    1, 
    'dell', 
    1205
);


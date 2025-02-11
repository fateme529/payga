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
select*from locked_shopping_cart

INSERT INTO locked_shopping_cart(id,cart_number)
VALUES (8,802)
INSERT INTO product(category, image, current_price, stock_count, brand, model)
VALUES (
    'laptop', 
    (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\fdama\Pictures\smail.PNG', SINGLE_BLOB) AS img), 
    100000, 
    5, 
    'dell', 
    1205
);

INSERT INTO added_to(client_id,cart_number,locked_number,product_id)
values(8,802,3,3)

INSERT INTO applied_to(client_id,cart_number,locked_number,app_code)
VALUES(8,802,DISCOUNT_3_1,10)
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
select*from added_to
select*from applied_to
select*from transactions
select*from subscribes

INSERT INTO discount_code(dis_code,amount,dis_limit,usage_count,expiration_date)
VALUES ('all_free_0',50,1000000,1,'2001/10/9')

INSERT INTO vip_client(id,Subscription_expiration_time)
VALUES(4,'2027-10-07')
INSERT INTO locked_shopping_cart(id,cart_number)
VALUES (8,802)
INSERT INTO public_code (pub_code)
values('all_free')

VALUES (8,802)
INSERT INTO product(category, image, current_price, stock_count, brand, model)
VALUES (
    'laptop', 
    (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\fdama\Pictures\smail.PNG', SINGLE_BLOB) AS img), 
    300, 
    5, 
    'dell', 
    1205
);

INSERT INTO added_to(client_id,cart_number,locked_number,product_id,quantity)
values(8,802,3,8,6)

INSERT INTO applied_to(client_id,cart_number,locked_number,app_code)
VALUES(8,802,3,'DISCOUNT_8_1')

INSERT INTO transactions(status)
VALUES('')

INSERT INTO subscribes(tracking_code,id)
VALUES(1,8)

INSERT INTO vip_client(id, Subscription_expiration_time)
VALUES (6, CONVERT(DATE, '2004-10-07', 120));

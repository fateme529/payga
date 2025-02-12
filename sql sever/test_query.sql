insert into client(phone_number,first_name,last_name,referal_code)
values(09109087,'fateme','dama',8)

insert into vip_client(id,Subscription_expiration_time)
values(8,2)
select* from refers


select*from vip_client
select* from client

select*from discount_code
select*from shopping_cart

select*from locked_shopping_cart
select*from added_to
select*from applied_to
select*from transactions
select*from subscribes
select* from private_code
select*from Cart_Total_Discount
select*from added_to
select*from product
select*from issued_for

INSERT INTO discount_code(dis_code,amount,dis_limit,usage_count,expiration_date)
VALUES ('all_free_0',50,1000000,1,'2001/10/9')

INSERT INTO vip_client(id,Subscription_expiration_time)
VALUES(4,'2027-10-07')
INSERT INTO locked_shopping_cart(id,cart_number)
VALUES (9,903)
INSERT INTO public_code (pub_code)
values('all_free')


INSERT INTO product(category, image, current_price, stock_count, brand, model)
VALUES (
    'laptop', 
    (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\fdama\Pictures\smail.PNG', SINGLE_BLOB) AS img), 
    10000000, 
    5, 
    'dell', 
    1205
);

INSERT INTO added_to(client_id,cart_number,locked_number,product_id,quantity)
values(4,402,9,9,5)

INSERT INTO applied_to(client_id,cart_number,locked_number,app_code)
VALUES(4,402,9,'id_discount_4_178ACED1')

INSERT INTO transactions(status)
VALUES('successful')

INSERT INTO subscribes(tracking_code,id)
VALUES(1,8)

INSERT INTO vip_client(id, Subscription_expiration_time)
VALUES (6, CONVERT(DATE, '2004-10-07', 120));

INSERT INTO client(phone_number,first_name,last_name,referal_code)
VALUES(90099979000,'hale','samavat',4)


INSERT INTO issued_for(tracking_code,id_client,cart_number,locked_number)
VALUES(5,9,903,6)

DELETE FROM applied_to;
DELETE FROM private_code;
DELETE FROM discount_code;


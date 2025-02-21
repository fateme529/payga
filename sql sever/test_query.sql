insert into client(phone_number,first_name,last_name,referal_code)
values(09109087,'fateme','dama',8)

insert into vip_client(id,Subscription_expiration_time)
values(8,2)
select* from refers


select*from vip_client

select* from product
select* from public_code

select*from discount_code
select*from shopping_cart

select*from locked_shopping_cart
select*from added_to
select*from applied_to

select*from subscribes
select* from private_code
select*from Cart_Total_Discount
select* from client

select*from product

select*from transactions
select*from added_to
select*from issued_for
select* from wallet_transaction
select* from bank_transaction
select* from deposits_into_wallet
select* from vw_TransactionDetails
select* from vw_CartTotalAfterIssuedFor



INSERT INTO discount_code(dis_code,amount,dis_limit,usage_count,expiration_date)
VALUES ('all_free_0',50,1000000,1,'2001/10/9')

INSERT INTO vip_client(id,Subscription_expiration_time)
VALUES(4,'2027-10-07')

INSERT INTO public_code (pub_code)
values('all_free')


INSERT INTO product(category, image, current_price, stock_count, brand, model)
VALUES (
    'laptop', 
    (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\fdama\Pictures\smail.PNG', SINGLE_BLOB) AS img), 
   100, 
    15, 
    'dell', 
    1205
);

INSERT INTO added_to(client_id,cart_number,locked_number,product_id,quantity)
values(101,10103,57,29,1)

INSERT INTO applied_to(client_id,cart_number,locked_number,app_code)
VALUES(44,4402,42,'id_discount_44_7828F2CB')



INSERT INTO subscribes(tracking_code,id)
VALUES(10,44)


INSERT INTO deposits_into_wallet(tracking_code,id,amount)
VALUES(19,44,1000000000000)
INSERT INTO shopping_cart(id,number,status)
VALUES(42,4203,'blocked')

INSERT INTO vip_client(id, Subscription_expiration_time)
VALUES (42, CONVERT(DATE, '2028-10-07 ', 120));

INSERT INTO locked_shopping_cart(id,cart_number)
VALUES (53,5301)

INSERT INTO client(phone_number,first_name,last_name,referal_code)
VALUES(900889088,'hale','samavat',44)


INSERT INTO issued_for(tracking_code,id_client,cart_number,locked_number)
VALUES(46,101,10103,57)


INSERT INTO transactions(status)
VALUES('successful')

INSERT bank_transaction (tracking_code,card_number)
VALUES(39,63040337398644310)

INSERT deposits_into_wallet(tracking_code,id,amount)
VALUES(39,53,5000)

INSERT wallet_transaction (tracking_code)
VALUES(44)

INSERT issued_for(tracking_code,id_client,cart_number,locked_number)
values(27,53,5301,49)


DELETE FROM applied_to;
DELETE FROM private_code;
DELETE FROM discount_code;


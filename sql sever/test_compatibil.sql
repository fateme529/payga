select* from client
select* from vw_ClientTransactionPercentage
select* from cpu
select* from cooler
select* from product
select* from cc_socket_compatible_with



insert into product(category, image, current_price, stock_count, brand, model)
values ('CPU',  (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\fdama\Desktop\payga\pic\Intel-Core-i7-CPU.jpg', SINGLE_BLOB) AS img) , 350.00, 10, 'Intel', 'Core i5-12700K');

insert into cpu(id, maximum_addressable_memory_limit, boost_frequency, base_frequency, number_of_cores, number_of_threads, microarchitecture, generation, wattage)
values (39, 128, 4.9, 3.6, 8, 16, 'Alder Lake', 12, 125);

insert into product(category, image, current_price, stock_count, brand, model)
values ('Cooler', (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\fdama\Desktop\payga\pic\images.jpg', SINGLE_BLOB) AS img), 50.00, 200, 'Cooler Master', 'Hyper 212 EVO');


insert into cooler(id, maximum_rotational_speed, wattage, fan_size, cooling_method, height, width, depth)
values (38, 5000, 15, 80, 'Air', 2.5, 10, 10);


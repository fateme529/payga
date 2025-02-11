CREATE TABLE locked_shopping_cart (
  id int NOT NULL,
  cart_number int NOT NULL,
  number_lock  int NOT NULL AUTO_INCREMENT,
  locked_time  datetime NOT NULL,
  PRIMARY KEY (id,cart_number,number_lock),
  UNIQUE KEY uq_locked_shopping_cart_number (number_lock),
  CONSTRAINT locked_shopping_cart_ibfk_1 FOREIGN KEY (id,cart_number) REFERENCES shopping_cart (id, number) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
CREATE TABLE  public_code(
pub_code VARCHAR(50) NOT NULL,
PRIMARY KEY(pub_code),
CONSTRAINT fk_public FOREIGN KEY(pub_code) REFERENCES discount_code(dis_code)
ON UPDATE CASCADE
ON DELETE CASCADE);




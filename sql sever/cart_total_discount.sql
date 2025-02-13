CREATE TABLE dbo.cart_total_discount (
    cart_number INT,
    locked_number INT,
    cart_total DECIMAL(25, 2),
    discount_codes VARCHAR(MAX),
    total_discount_amount DECIMAL(18, 2),
    final_total DECIMAL(18, 2)
);

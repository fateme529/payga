ALTER TABLE client
ADD CONSTRAINT CK__client__wallet_b__267ABA7A CHECK (wallet_balance >= 0);
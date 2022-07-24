CREATE TABLE accounts (
accId INTEGER NOT NULL PRIMARY KEY,
balance DECIMAL(11,2) NOT NULL,
CONSTRAINT empty_account CHECK (balance >= 0.00)
);



insert into accounts (accId, balance) values (1, 950.00);
insert into accounts (accId, balance) values (2, 3000.55);
insert into accounts (accId, balance) values (3, 1743.27);
insert into accounts (accId, balance) values (4, 256.47);

COMMIT;
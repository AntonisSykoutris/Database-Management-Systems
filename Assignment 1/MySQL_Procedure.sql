CREATE DEFINER=`root`@`localhost` PROCEDURE `ACC_TR`(IN P_ACID1 int, IN P_ACID2 int)
BEGIN

start transaction;

IF (SELECT accId FROM ACCOUNTS WHERE accId = P_ACID1) IS NULL THEN
SELECT 'First Parameter Does not Exist in Table Exception OCCURED';
rollback;

ELSEIF (SELECT accId FROM ACCOUNTS WHERE accId = P_ACID2) IS NULL THEN
SELECT 'Second Parameter Does not Exist in Table Exception OCCURED';
rollback;


ELSEIF P_ACID1 = P_ACID2 THEN
SELECT 'Same Parameter Exception OCCURED';
rollback;


ELSEIF (SELECT balance FROM ACCOUNTS WHERE accId = P_ACID1) < 300 THEN
SELECT 'First Parameter Does not Have Enough Balance';
rollback;

ELSE 
UPDATE ACCOUNTS SET balance = balance - 300 WHERE accId = P_ACID1;
UPDATE ACCOUNTS SET balance = balance + 300 WHERE accId = P_ACID2;
commit;
END IF;
END
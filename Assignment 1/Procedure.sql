create or replace NONEDITIONABLE PROCEDURE ACC_TR 
(
  P_ACID1  NUMBER 
, P_ACID2  NUMBER 
) AS  
        acc_check INTEGER; 
        bal_check INTEGER;
        e_invalid_bal EXCEPTION;
        e_acc_same    EXCEPTION;
BEGIN
--CHECKING FOR POTENSIAL WRONG ACCOUNTS
   SELECT accId INTO acc_check FROM SYSTEM.accounts WHERE accId = P_ACID1;
   SELECT accId INTO acc_check FROM SYSTEM.accounts WHERE accId = P_ACID2;
   
--CHECKING FOR THE SAME ACCOUNTS    
    IF P_ACID1 = P_ACID2 THEN
        RAISE e_acc_same;
    END IF;

--CHECK IF THE BALANCE OF THE GIVER IS APPROPRIATE    
    SELECT balance INTO bal_check FROM SYSTEM.accounts WHERE accId = P_ACID1;
--IF IT IS NOT RAISE THE EXCEPTION FLAGS     
    IF bal_check < 300 THEN
        RAISE e_invalid_bal;
    END IF;

--IF EVERYTHING IS OKEY THEN PROCCED WITH THE TRANSACTION      
    UPDATE SYSTEM.accounts SET balance = balance - 300 WHERE accId = P_ACID1;
    UPDATE SYSTEM.accounts SET balance = balance + 300 WHERE accId = P_ACID2;
    COMMIT;

EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: NO RECORDS');
        ROLLBACK;
    WHEN TOO_MANY_ROWS THEN --THIS IS NOT NESSESARY BUT I DO IT FOR CHECKING PERPUSES OF THE DATABASE
        DBMS_OUTPUT.PUT_LINE('ERROR: More than 1 Records found');
        ROLLBACK;
    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Invalid Number.YOU HAD ONE JOB');
        ROLLBACK;
    WHEN e_invalid_bal THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Balance is less than 300');
        ROLLBACK;
    WHEN e_acc_same THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Try a transaction with a different account');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('ERROR: Unexpected error');
        ROLLBACK;

END ACC_TR;
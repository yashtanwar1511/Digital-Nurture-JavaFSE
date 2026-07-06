-- Exercise 1 : Control Structures

----------------------------------------------------
-- Scenario 1 : Apply 1% discount for customers above 60 years
----------------------------------------------------

BEGIN
FOR cust IN (
        SELECT CustomerID, Age
        FROM Customers
        WHERE Age > 60
    )
    LOOP
UPDATE Loans
SET InterestRate = InterestRate - 1
WHERE CustomerID = cust.CustomerID;
END LOOP;

COMMIT;
END;
/

----------------------------------------------------
-- Scenario 2 : Promote customers to VIP
----------------------------------------------------

BEGIN
FOR cust IN (
        SELECT CustomerID, Balance
        FROM Customers
        WHERE Balance > 10000
    )
    LOOP
UPDATE Customers
SET IsVIP = 'TRUE'
WHERE CustomerID = cust.CustomerID;
END LOOP;

COMMIT;
END;
/

----------------------------------------------------
-- Scenario 3 : Loan reminders within next 30 days
----------------------------------------------------

BEGIN
FOR loan IN (
        SELECT CustomerID, LoanID, DueDate
        FROM Loans
        WHERE DueDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan '
            || loan.LoanID
            || ' for Customer '
            || loan.CustomerID
            || ' is due on '
            || loan.DueDate
        );
END LOOP;
END;
/
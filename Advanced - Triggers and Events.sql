-- Triggers

-- a Trigger is a block of code that executes automatically executes when an event takes place in a table.

-- for example we have these 2 tables, invoice and payments - when a client makes a payment we want it to update the invoice field "total paid"
-- to reflect that the client has indeed paid their invoice


SELECT * FROM employee_salary;

SELECT * FROM employee_demographics;

-- so really when we get a new row or data is inserted into the payments table we want a trigger to update the correct invoice 
-- with the amount that was paid
-- so let's write this out
USE parks_and_recreation;
DELIMITER $$

CREATE TRIGGER employee_insert2
    -- we can also do BEFORE, but for this lesson we have to do after
	AFTER INSERT ON employee_salary
    -- now this means this trigger gets activated for each row that is inserted. Some sql databses like MSSQL have batch triggers or table level triggers that
    -- only trigger once, but MySQL doesn't have this functionality unfortunately
    FOR EACH ROW
    
    -- now we can write our block of code that we want to run when this is triggered
BEGIN
-- we want to update our client invoices table
-- and set the total paid = total_paid (if they had already made some payments) + NEW.amount_paid
-- NEW says only from the new rows that were inserted. There is also OLD which is rows that were deleted or updated, but for us we want NEW
    INSERT INTO employee_demographics (employee_id, first_name, last_name) VALUES (NEW.employee_id,NEW.first_name,NEW.last_name);
END $$

DELIMITER ; 

-- Now let's run it and create it


-- Now that it's created let's test it out.

-- Let's insert a payment into the payments table and see if it updates in the Invoice table.

-- so let's put the values that we want to insert - let's pay off this invoice 3 in full
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);
-- now it was updated in the payments table and the trigger was triggered and update the corresponding values in the invoice table

DELETE FROM employee_salary
WHERE employee_id = 13;



-- -------------------------------------------------------------------------

-- now let's look at Events

-- Now I usually call these "Jobs" because I called them that for years in MSSQL, but in MySQL they're called Events

-- Events are task or block of code that gets executed according to a schedule. These are fantastic for so many reasons. Importing data on a schedule. 
-- Scheduling reports to be exported to files and so many other things
-- you can schedule all of this to happen every day, every monday, every first of the month at 10am. Really whenever you want

-- This really helps with automation in MySQL

-- let's say Parks and Rec has a policy that anyone over the age of 60 is immediately retired with lifetime pay
-- All we have to do is delete them from the demographics table

SELECT * 
FROM parks_and_recreation.employee_demographics;

SHOW EVENTS;

-- we can drop or alter these events like this:
DROP EVENT IF EXISTS delete_retirees;
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO BEGIN
	DELETE
	FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$


-- if we run it again you can see Jerry is now fired -- or I mean retired
SELECT * 
FROM parks_and_recreation.employee_demographics;








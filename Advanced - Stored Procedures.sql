-- So let's look at how we can create a stored procedure

-- First let's just write a super simple query
SELECT *
FROM employee_salary
WHERE salary >= 60000;

-- Now let's put this into a stored procedure.
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 60000;

-- Now if we run this it will work and create the stored procedure
-- we can click refresh and see that it is there

-- notice it did not give us an output, that's because we 

-- If we want to call it and use it we can call it by saying:
CALL large_salaries();

-- as you can see it ran the query inside the stored procedure we created


-- Now how we have written is not actually best practice.alter
-- Usually when writing a stored procedure you don't have a simple query like that. It's usually more complex

-- if we tried to add another query to this stored procedure it wouldn't work. It's a separate query:
CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 60000;
SELECT *
FROM employee_salary
WHERE salary >= 50000;


-- Best practice is to use a delimiter and a Begin and End to really control what's in the stored procedure
-- let's see how we can do this.
-- the delimiter is what separates the queries by default, we can change this to something like two $$
-- in my career this is what I've seen a lot of people who work in SQL use so I've picked it up as well

-- When we change this delimiter it now reads in everything as one whole unit or query instead of stopping
-- after the first semi colon
DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$

-- now we change the delimiter back after we use it to make it default again
DELIMITER ;

-- let's refresh to see the SP
-- now we can run this stored procedure
CALL large_salaries2();

-- as you can see we have 2 outputs which are the 2 queries we had in our stored procedure



-- we can also create a stored procedure by right clicking on Stored Procedures and creating one:

-- it's going to drop the procedure if it already exists.
USE `parks_and_recreation`;
DROP procedure IF EXISTS `large_salaries3`;
-- it automatically adds the dilimiter for us
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$

DELIMITER ;

-- and changes it back at the end

-- this can be a genuinely good option to help you write your Stored Procedures faster, although either way
-- works

-- if we click finish you can see it is created the same and if we run it

CALL large_order_totals3();

-- we get our results



-- -------------------------------------------------------------------------

-- we can also add parameters
USE `parks_and_recreation`;
DROP procedure IF EXISTS `large_salaries3`;
-- it automatically adds the dilimiter for us
DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_param INT)
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000
    AND employee_id_param = employee_id;
END $$

DELIMITER ;



CALL large_salaries3(1);

































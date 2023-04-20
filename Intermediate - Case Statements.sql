-- Case Statements

-- A Case Statement allows you to add logic to your Select Statement, sort of like an if else statement in other programming languages or even things like Excel



SELECT * 
FROM employee_demographics;


SELECT first_name, 
last_name, 
CASE
	WHEN age <= 30 THEN 'Young'
END
FROM employee_demographics;


--

SELECT first_name, 
last_name, 
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN "On Death's Door"
END
FROM employee_demographics;

-- Poor Jerry

-- Now we don't just have to do simple labels like we did, we can also perform calculations

-- Let's look at giving bonuses to employees

SELECT * 
FROM employee_salary;

-- Pawnee Council sent out a memo of their bonus and pay increase structure so we need to follow it
-- Basically if they make less than 45k then they get a 5% raise - very generous
-- if they make more than 45k they get a 7% raise
-- they get a bonus of 10% if they work for the Finance Department

SELECT first_name, last_name, salary,
CASE
	WHEN salary > 45000 THEN salary + (salary * 0.05)
    WHEN salary < 45000 THEN salary + (salary * 0.07)
END AS new_salary
FROM employee_salary;

-- Unfortunately Pawnee Council was extremely specific in their wording and Jerry was not included in the pay increases. Maybe Next Year.

-- Now we need to also account for Bonuses, let's make a new column
SELECT first_name, last_name, salary,
CASE
	WHEN salary > 45000 THEN salary + (salary * 0.05)
    WHEN salary < 45000 THEN salary + (salary * 0.07)
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary;

-- as you can see Ben is the only one who get's a bonus














































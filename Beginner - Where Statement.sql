#WHERE Clause:
#-------------
#The WHERE clause is used to filter records (rows of data)

#It's going to extract only those records that fulfill a specified condition.

# So basically if we say "Where name is = 'Alex' - only rows were the name = 'Alex' will return
# So this is only effecting the rows, not the columns


#Let's take a look at how this looks
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM employee_demographics
WHERE gender = 'Female';


#We can also return rows that do have not "Scranton"
SELECT *
FROM employee_demographics
WHERE gender != 'Female';


#We can use WHERE clause with date value also
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

-- Here '1990-01-01' is the default data formate in MySQL.
-- There are other date formats as well that we will talk about in a later lesson.


# LIKE STATEMENT

-- two special characters a % and a _

-- % means anything
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

-- _ means a specific value
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';














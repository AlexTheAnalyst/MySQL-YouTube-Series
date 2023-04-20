-- Group By
-- When you use the GROUP BY clause in a MySQL query, it groups together rows that have the same values in the specified column or columns.
-- GROUP BY is going to allow us to group rows that have the same data and run aggregate functions on them

SELECT *
FROM employee_demographics;

-- when you use group by  you have to have the same columns you're grouping on in the group by statement
SELECT gender
FROM employee_demographics
GROUP BY gender
;


SELECT first_name
FROM employee_demographics
GROUP BY gender
;





SELECT occupation
FROM employee_salary
GROUP BY occupation
;

-- notice there is only one office manager row

-- when we group by 2 columns we now have a row for both occupation and salary because salary is different
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

-- now the most useful reason we use group by is so we can perform out aggregate functions on them
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender
;



#10 - The ORDER BY clause:
-------------------------
#The ORDER BY keyword is used to sort the result-set in ascending or descending order.

#The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.


#So let's try it out with our customer table
#First let's start simple with just ordering by one column
SELECT *
FROM customers
ORDER BY first_name;

#You can see that first name is ordered from a - z or Ascending.

#We can change that by specifying DESC after it
SELECT *
FROM employee_demographics;

-- if we use order by it goes a to z by default (ascending order)
SELECT *
FROM employee_demographics
ORDER BY first_name;

-- we can manually change the order by saying desc
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

#Now we can also do multiple columns like this:

SELECT *
FROM employee_demographics
ORDER BY gender, age;

SELECT *
FROM employee_demographics
ORDER BY gender DESC, age DESC;



#now we don't actually have to spell out the column names. We can actually just use their column position

#State is in position 8 and money is in 9, we can use those as well.
SELECT *
FROM employee_demographics
ORDER BY 5 DESC, 4 DESC;

#Now best practice is to use the column names as it's more overt and if columns are added or replaced or something in this table it will still use the right columns to order on.

#So that's all there is to order by - fairly straight forward, but something I use for most queries I use in SQL











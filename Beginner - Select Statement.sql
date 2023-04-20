-- SELECT STATEMENET

-- the SELECT statement is used to work with columns and specify what columns you want to work see in your output. There are a few other things as well that
-- we will discuss throughout this video

#We can also select a specefic number of column based on our requirement. 

#Now remember we can just select everything by saying:
SELECT * 
FROM parks_and_recreation.employee_demographics;


#Let's try selecting a specific column
SELECT first_name
FROM employee_demographics;

#As you can see from the output, we only have the one column here now and don't see the others

#Now let's add some more columns, we just need to separate the columns with columns
SELECT first_name, last_name
FROM employee_demographics;

#Now the order doesn't normall matter when selecting your columns.
#There are some use cases we will look at in later modules where the order of the column
#Names in the select statement will matter, but for this you can put them in any order

SELECT last_name, first_name, gender, age
FROM employee_demographics;

#You'll also often see SQL queries formatted like this.
SELECT last_name, 
first_name, 
gender, 
age
FROM employee_demographics;

#The query still runs the exact same, but it is easier to read and pick out the columns
#being selected and what you're doing with them.

#For example let's take a look at using a calculation in the select statement

#You can see here we have the total_money_spent - we can perform calculations on this
SELECT first_name,
 last_name,
 total_money_spent,
 total_money_spent + 100
FROM customers;

#See how it's pretty easy to read and to see which columns we are using.

#Math in SQL does follow PEMDAS which stands for Parenthesis, Exponent, Multiplication,
#Division, Addition, subtraction - it's the order of operation for math

#For example - What will the output be?:
SELECT first_name, 
last_name,
salary,
salary + 100
FROM employee_salary;
#This is going to do 10* 100 which is 1000 and then adds the original 540

#Now what will the output be when we do this?
SELECT first_name, 
last_name,
salary,
(salary + 100) * 10
FROM employee_salary;


# Pemdas

#One thing I wanted to show you about the select statement in this lesson is the DISTINCT Statement - this will return only unique values in
#The output - and you won't have any duplicates

SELECT department_id
FROM employee_salary;

SELECT DISTINCT department_id
FROM employee_salary;

#Now a lot happens in the select statement. We have an entire module dedicated to just the 
#select statement so this is kind of just an introduction to the select statement.
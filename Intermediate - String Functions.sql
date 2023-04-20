#Now let's look at string functions. These help us change and look at strings differently.

SELECT * 
FROM bakery.customers;


#Length will give us the length of each value
SELECT LENGTH('sky');

#Now we can see the length of each name
SELECT first_name, LENGTH(first_name) 
FROM employee_demographics;

#Upper will change all the string characters to upper case
SELECT UPPER('sky');

SELECT first_name, UPPER(first_name) 
FROM employee_demographics;

#lower will change all the string characters to lower case
SELECT LOWER('sky');

SELECT first_name, LOWER(first_name) 
FROM employee_demographics;

#Now if you have values that have white space on the front or end, we can get rid of that white space using TRIM
SELECT TRIM('sky'   );

#Now if we have white space in the middle it doesn't work
SELECT LTRIM('     I           love          SQL');

#There's also L trim for trimming just the left side
SELECT LTRIM('     I love SQL');


#There's also R trim for trimming just the Right side
SELECT RTRIM('I love SQL    ');


#Now we have Left. Left is going to allow us to take a certain amount of strings from the left hand side.
SELECT LEFT('Alexander', 4);

SELECT first_name, LEFT(first_name,4) 
FROM employee_demographics;

#Right is basically the opposite - taking it starting from the right side
SELECT RIGHT('Alexander', 6);

SELECT first_name, RIGHT(first_name,4) 
FROM employee_demographics;

#Now let's look at substring, this one I personally love and use a lot.
#Substring allows you to specify a starting point and how many characters you want so you can take characters from anywhere in the string. 
SELECT SUBSTRING('Alexander', 2, 3);

#We could use this on phones to get the area code at the beginning.
SELECT birth_date, SUBSTRING(birth_date,1,4) as birth_year
FROM employee_demographics;

#We can also use replace
SELECT REPLACE(first_name,'a','z')
FROM employee_demographics;

#Next we have locate - we have 2 arguments we can use here: we can specify what we are searching for and where to search
#It will return the position of that character in the string.
SELECT LOCATE('x', 'Alexander');

#Now Alexander has 2 e's - what will happen if we try to locate it
SELECT LOCATE('e', 'Alexander');
#It will return the location of just the first position.

#Let's try it on our first name
SELECT first_name, LOCATE('a',first_name) 
FROM employee_demographics;

#You can also locate longer strings
SELECT first_name, LOCATE('Mic',first_name) 
FROM employee_demographics;

#Now let's look at concatenate - it will combine the strings together
SELECT CONCAT('Alex', 'Freberg');

#Here we can combine the first and the last name columns together
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;


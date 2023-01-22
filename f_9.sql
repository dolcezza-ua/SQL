/* 1. This is a "staff" table :
____________________________________staff__________________________________________________________________________________________
| id  |	first_name | last_name | sex    | birth_date | position     | phone         | salary | date_of_hiring | date_of_dismissal |
| 1   |	Stepan     | Shvets    | male   | 1990-05-07 | teacher      | +380984805362 | 7500   | 2013-07-01     | 2017-01-15        |
...................................................................................................................................
| 10  | Eugen      | Stolar    | male   | 1992-11-09 | teacher      | NULL          | 9300   | 2019-07-29     | NULL              |

Find the average salary for each position of only those employees who are still working. The result should be displayed only if the average value of the salary is more than 10,000. 
The result should contain the following columns:
- position — position;
- average_salary — average salary for each position. */

SELECT position, AVG (salary) AS average_salary
FROM staff
WHERE date_of_dismissal IS NULL
GROUP BY position
HAVING average_salary > 10000;

/* 2. This is a "category" table and a "product" table:
_______category_____                              
| id |    name      |
| 2  | Seafood      |
.....................
| 4  | Grains       |

__________________________product_____________________
| id | name        | amount   | price   | category_id |
| 2  | Shrimp      | 50       | 450     | 2           |
.......................................................
| 8  | Flour       | 20       | 60      | 4           |

Find information about categories that include 4 or more different products. The result should contain the following columns:
- category_name — category name;
- number_of_products — number of products in each category. */

SELECT category.name AS category_name, COUNT (*) AS number_of_products
FROM product
INNER JOIN category
ON category.id = product.category_id
GROUP BY product.category_id
HAVING number_of_products >= 4
ORDER BY category_name;

/* 3. This is a "employee" table: 
__________________________________employee______________________________
| id | first_name  | last_name   | department_id | hiring_date | salary |
| 1  | Steven      | King        | 1             | 2019-12-02  | 15000  |
.........................................................................
| 22 | Adam        | Fripp       | 8             | 2021-03-17  | 12000  |

Find information about the number of employees who were hired each month. The result should be shown only if the number of such employees is 3 or more.
The result should contain the following columns:
- month — month from the hiring_date column;
- number_of_employees — the number of employees who got a job in month. */

SELECT EXTRACT (MONTH FROM hiring_date) AS month, COUNT (*) AS number_of_employees
FROM employee
GROUP BY month
HAVING number_of_employees >= 3;

/* 4. Find the names of the categories in which the sum of the number of all products is more than 80. The result should contain the following columns:
- category_name — category name;
- total_amount is the sum of all products for each category 
(use the "category" and "product" tables). */

SELECT category.name AS category_name, SUM (amount) AS total_amount, 
FROM product
INNER JOIN category
ON product.category_id = category.id
GROUP bY category_id
HAVING total_amount > 80
ORDER BY category_name;

/* 5. This is a "scoreboard" table and a "pupil" table:
____________________________________pupil_____________________________________________________
| id  |	first_name | last_name | sex    | birth_date | mother_phone  | father_phone  | city  |
| 1   |	Eugen      | Tsven     | male   | 2000-12-01 | +380967826174 | +380998161172 | Kyiv  |
..............................................................................................
| 10  | Inna       | Kostenko  | female | 2009-10-15 | +380981865416 | +380981458216 | Irpin |

_________________________scoreboard___________________________
| id  | pupil_id  | subject      | mark | semester        | year |
| 4   | 1         | Geography    | 10   | FIRST SEMESTER  | 2015 |
...............................................................
| 167 | 10        | Math         | 9    | SECOND SEMESTER | 2020 |

Find the average score in each subject for the student Eugen Tsven. The result should be displayed only if the average score for the subject is 10 or more.
The result should contain the following columns:
- subject — subject;
- average_mark — average mark for each subject. */

SELECT subject, AVG (mark) AS average_mark
FROM pupil
INNER JOIN scoreboard 
ON scoreboard.pupil_id = pupil.id
WHERE first_name = 'Eugen' AND last_name = 'Tsven'
GROUP BY subject
HAVING average_mark >= 10;

/* 6.  Find the categories and prices of the most expensive products from these categories, if they belong to 3 or more different products. Sort the result by price in ascending order.
The result should contain the following columns:
- category_name — category name;
- max_price — the price of the most expensive product for each of the categories
(use the "category" and "product" tables). */

SELECT category.name AS category_name, MAX (price) AS max_price
FROM product
INNER JOIN category
ON product.category_id = category.id
GROUP BY category_id
HAVING COUNT (product.name) >= 3
ORDER BY max_price;

/* 7. This is a "department" table and a "employee" table:
____________department__________
| id |    name      |  budget   |
| 1  | Marketing    | 200000    |
.................................
| 8  | Recruiting   | 750000    |

__________________________________employee______________________________
| id | first_name  | last_name   | department_id | hiring_date | salary |
| 1  | Steven      | King        | 1             | 2019-12-02  | 15000  |
.........................................................................
| 22 | Adam        | Fripp       | 8             | 2021-03-17  | 12000  |

Find the names of departments and the total amount of money that is spent on the salaries of employees from these departments. Display only those departments in which more than 3 employees work. Sort the result by total amount in descending order.
The result should contain the following columns:
- department_name — department name;
- amount_of_money — total amount of money for each department. */

SELECT department.name AS department_name, SUM (salary) AS amount_of_money
FROM employee
INNER JOIN department
ON employee.department_id = department.id
GROUP BY department.name
HAVING COUNT (*) > 3
ORDER BY amount_of_money DESC;

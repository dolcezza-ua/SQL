/* 1. This is a "department" table and a "employee" table: 
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

For employees who work in departments with identifiers 2 or 7, find:
- first_name — name;
- last_name — last name;
- department_name is the department in which they work. */

SELECT employee.first_name, employee.last_name, department.name AS department_name
FROM employee
INNER JOIN department
ON employee.department_id = department.id
WHERE employee.department_id = 2 OR employee.department_id = 7;

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

Find the total number of all products in the Seafood category. Create an alias for the resulting column — total_amount. */

SELECT SUM (amount) AS total_amount
FROM product
INNER JOIN category
ON category.id = product.category_id
WHERE category.id = 2;

/* 3. Images of employees whose last name contains the letter n. The result should contain the first and last names of the employees, as well as the name of their department 
(use the "department" and "employee" tables). */

SELECT employee.first_name, employee.last_name, department.name
FROM employee
INNER JOIN department
ON department.id = employee.department_id
WHERE employee.last_name LIKE '%n%';

/* 4. Find unique category names for products priced under $300 (use the "category" and "product" tables). */

SELECT DISTINCT category.name
FROM product
INNER JOIN category
ON category.id = product.category_id
WHERE product.price<300;

/* 5. Find the maximum employee salary for each department. The result should contain the following columns:
- department_name — department name;
- max_salary — maximum salary for each department
(use the "department" and "employee" tables). */

SELECT department.name AS department_name,MAX(salary) AS max_salary 
FROM employee
INNER JOIN department
ON department.id = employee.department_id
GROUP BY department.name;

/* 6. Displays the names of departments and the number of employees in each of them. The result should contain the following columns:
- department_name — department name;
- number_of_employees — number of employees in each department
(use the "department" and "employee" tables). */

SELECT department.name AS department_name , COUNT (department_id) AS number_of_employees 
FROM employee
INNER JOIN department 
ON employee.department_id = department.id
GROUP BY employee.department_id
ORDER BY department.name;

/* 7. Find the number of products that belong to the categories 'Meat' or 'Grains'. The result should contain the following columns:
- category_name — category name;
- number_of_products — number of products
(use the "category" and "product" tables). */

SELECT category.name AS category_name, COUNT (price) AS number_of_products
FROM product
INNER JOIN category
ON product.category_id = category.id 
WHERE category.name = 'Meat' OR category.name = 'Grains'
GROUP BY category.name
ORDER BY category.name;

/* 8. This is a "scoreboard" table and a "pupil" table:
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

Find the average grade for each subject for all students living in the city of Kyiv. The result should contain the following columns:
- subject — the name of the subject;
- average_mark — average mark for each subject.
Sort the items in alphabetical order. */

SELECT scoreboard.subject, AVG (mark) AS average_mark
FROM scoreboard
INNER JOIN pupil
ON pupil.id = scoreboard.pupil_id
WHERE pupil.city = 'Kyiv'
GROUP BY scoreboard.subject
ORDER BY scoreboard.subject;

/* 9. Find the average marks separately for each subject for the student Anna Ivaniuk. The result should contain two columns:
- subject — the name of the subject;
- average_mark — average mark for each subject.
Sort the result by the average mark in descending order (use the alias average_mark).
(use the "scoreboard" and "pupil" tables) */

SELECT scoreboard.subject, AVG (mark) AS average_mark
FROM pupil
INNER JOIN scoreboard
ON pupil.id = scoreboard.pupil_id
WHERE first_name = 'Anna' AND last_name = 'Ivaniuk'
GROUP BY subject
ORDER BY average_mark DESC;

/* 10. Display the department name, average salary, and number of employees for each department. The result should contain the following columns:
- department_name — department name;
- average_salary — average salary for the department;
- number_of_employees — the number of employees in the department.
(use the "department" and "employee" tables) */

SELECT department.name AS department_name, AVG (salary) AS average_salary, COUNT (last_name) AS number_of_employees
FROM employee
INNER JOIN department
ON employee.department_id = department.id
GROUP BY department.name
ORDER BY department.name;

/* 11. Find the average score of each student in all school subjects. The result should contain the following columns:
- first_name — name of the student;
- last_name — student's last name;
- average_mark — average mark for all subjects. 
(use the "scoreboard" and "pupil" tables) */

SELECT first_name, last_name, AVG (mark) AS average_mark
FROM pupil
INNER JOIN scoreboard
ON scoreboard.pupil_id = pupil.id
GROUP BY pupil.id;

/* 12. Find the average points that students who were born after 01.01.2005 receive annually in each subject. The result should contain the following columns:
- subject — the name of the subject;
- year — year of study;
- average_mark — average mark;
Sort the subjects in alphabetical order, and the years in descending order. (use the "scoreboard" and "pupil" tables) */

SELECT subject,year, AVG (mark) AS average_mark, 
FROM pupil
INNER JOIN scoreboard
ON pupil.id = scoreboard.pupil_id
WHERE birth_date > '2005-01-01'
GROUP BY  year, subject
ORDER BY subject, year DESC;

/* 13. Find all departments, including those without employees. The result should contain the following columns:
- department_name — department name;
- first_name — name of the employee;
- last_name — last name of the employee.
(use the "department" and "employee" tables) */

SELECT name AS department_name, first_name, last_name
FROM department
LEFT JOIN employee
ON department.id = employee.department_id;

/* 14. Displays first names, last names, and department titles for all employees, regardless of whether they work in a department or not. 
The result should contain the following columns:
- department_name — department name;
- first_name — name of the employee;
- last_name — last name of the employee. 
(use the "department" and "employee" tables) */

SELECT first_name, last_name, department.name AS department_name
FROM department
Right JOIN employee
ON employee.department_id = department.id;

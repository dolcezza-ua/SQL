/* 1. This is a "dish" table :
_______________________dish_______________________
| id  |	name         | price | weight | calories |
| 1   |	Baked potato | 30    | 200    | 300      |
..................................................
| 10  | Omelette     | 85    | 180    | 190      |

 Display the calories of the least caloric meal. Create an alias for the resulting column — calories. */

SELECT MIN (calories) AS calories 
FROM dish;

/* 2. This is a "book" table :
____________________________________book_________________________________
| id  |	title                           | publish_year | number_of_pages| 
| 1   |	Functional Skills Maths Level 1	| 2009         | 232            | 
.........................................................................
| 10  | See Inside Your Body            | 2015         | 216            | 

Find the smallest number of pages among the books. Create an alias for the resulting column — min_number_of_pages. */

SELECT MIN (number_of_pages) AS min_number_of_pages
FROM book;

/* 3. This is a "staff" table :
____________________________________staff__________________________________________________________________________________________
| id  |	first_name | last_name | sex    | birth_date | position     | phone         | salary | date_of_hiring | date_of_dismissal |
| 1   |	Stepan     | Shvets    | male   | 1990-05-07 | teacher      | +380984805362 | 7500   | 2013-07-01     | 2017-01-15        |
...................................................................................................................................
| 10  | Eugen      | Stolar    | male   | 1992-11-09 | teacher      | NULL          | 9300   | 2019-07-29     | NULL              |

Find the date when the first employee was hired. Create an alias for the resulting column — hiring_date. */

SELECT MIN (date_of_hiring) AS hiring_date
FROM staff;

/* 4. Find the date of birth of the youngest employee who no longer works. Create an alias for the resulting column — birth_date (use the "staff" table). */

SELECT MAX(birth_date) AS birth_date
FROM staff
WHERE date_of_dismissal IS NOT NULL;

/* 5. Find the highest salary among employees who:
- still working;
- have the position of teacher.
Create an alias for the resulting column — max_salary (use the "staff" table). */

SELECT MAX (salary) AS max_salary
FROM staff
WHERE date_of_dismissal IS NULL AND position = 'teacher';

/* 6. This is a "pupil" table:
____________________________________pupil_____________________________________________________
| id  |	first_name | last_name | sex    | birth_date | mother_phone  | father_phone  | city  |
| 1   |	Eugen      | Tsven     | male   | 2000-12-01 | NULL          | +380998161172 | Kyiv  |
..............................................................................................
| 10  | Inna       | Kostenko  | female | 2009-10-15 | +380981865416 | NULL          | Irpin |

Display the name of the student who:
- does not live in the city of Kyiv;
- in the list sorted by last name is the last.
Create an alias for the resulting column — LAST_NAME. */

SELECT MAX (last_name) AS LAST_NAME
FROM pupil
WHERE city != 'Kyiv';

/* 7. Find the average number of calories of dishes whose price is 100 or more. Create an alias for the resulting column — CALORIES (use the "dish" table). */

SELECT AVG (calories) AS CALORIES
FROM dish
WHERE price >=100;

/* 8. Find the average weight of meals that contain less than 300 calories. Create an alias for the resulting column — average_weight (use the "dish" table). */

SELECT AVG (weight) AS average_weight
FROM dish
WHERE calories < 300;

/* 9. Find the average salary of all employees who started working after 01.01.2015. Create an alias for the resulting column — average_salary (use the "staff" table). */

SELECT AVG (salary) AS average_salary
FROM staff
WHERE date_of_hiring > '2015-01-01';

/* 10. Find the total cost of dishes whose names begin with the capital letter C. For the resulting column, create an alias - total_price (use the "dish" table). */

SELECT SUM (price) AS total_price
FROM dish
WHERE name LIKE 'C%';

/* 11. Find the total number of pages of all books published after 2012. Create an alias for the resulting column — total_number_of_pages (use the "book" table). */

SELECT SUM (number_of_pages) AS total_number_of_pages
FROM book
WHERE publish_year >2012;

/* 12. Find the number of students living in the city of Kyiv. Create an alias for the resulting column — number_of_pupils (use the "pupil" table). */

SELECT COUNT (*) AS number_of_pupils
FROM pupil
WHERE city = 'Kyiv';

/* 13. Find the number of fired employees. Create an alias for the resulting column — non_working_staff (use the "staff" table). */

SELECT COUNT (date_of_dismissal) AS non_working_staff
FROM staff;

/* 14. Find the number of books that were published between 2012 and 2017 inclusive. Create an alias for the resulting column — number_of_books (use the "book" table). */

SELECT COUNT (*) AS number_of_books
FROM book
WHERE publish_year BETWEEN 2012 AND 2017;

/* 15.  Find the number of students for whom the father's phone number (father_phone) is known. 
Create an alias for the resulting column — number_of_pupils (use the "pupil" table). */

SELECT COUNT (father_phone) AS number_of_pupils
FROM pupil;

/* 16.  Find the number of employees who:
- still working;
- have the position of teacher;
- have a salary of 9000 and more.
Create an alias for the resulting column — number_of_staff. (use the "staff" table). */

SELECT COUNT (*) AS number_of_staff
FROM staff
WHERE date_of_dismissal IS NULL AND position = 'teacher' AND salary >=9000;

/* 17. This is a "subject" table : 
______subject______
| id  |	name      | 
| 1   |	Music 	  | 
...................
| 10  | Economics | 

Find the number of subjects whose name begins with the letter E. For the resulting column, create an alias - number_of_subjects. */

SELECT COUNT (*) AS number_of_subjects
FROM subject
WHERE name LIKE 'E%';
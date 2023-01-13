/* 1. This is a "pupil" table:
____________________________________pupil_____________________________________________________
| id  |	first_name | last_name | sex    | birth_date | mother_phone  | father_phone  | city  |
| 1   |	Eugen      | Tsven     | male   | 2000-12-01 | NULL          | +380998161172 | Kyiv  |
..............................................................................................
| 10  | Inna       | Kostenko  | female | 2009-10-15 | +380981865416 | NULL          | Irpin |

Display all information about students who live in the city of Kyiv. Sort the result by the date of birth of the students - from the oldest to the youngest. */

SELECT *
FROM pupil
WHERE city = 'Kyiv'
ORDER BY birth_date ; 

/* 2. This is a "book" table :
____________________________________book_________________________________
| id  |	title                           | publish_year | number_of_pages| 
| 1   |	Functional Skills Maths Level 1	| 2009         | 232            | 
.........................................................................
| 10  | See Inside Your Body            | 2015         | 216            | 

Display all information about books from the table. Sort the result by the year of publication, starting with the most recent.*/

SELECT *
FROM book
ORDER BY publish_year DESC;

/* 3. This is a "dish" table :
_______________________dish_______________________
| id  |	name         | price | weight | calories |
| 1   |	Baked potato | 30    | 200    | 300      |
..................................................
| 10  | Omelette     | 85    | 180    | 190      |

Display the name and price of all dishes whose price is greater than 100. Sort the result by the name of the dish in alphabetical order. */

SELECT name, price
FROM dish
WHERE price > 100
ORDER BY name;

/* 4. Display the title and year of publication of books published in 2012 or later. Sort the result by book title in descending order (use the "book" table). */

SELECT title, publish_year
FROM book
WHERE publish_year >= 2012
ORDER BY title DESC;

/* 5. Display all information about students. Sort the result by first name, and then by last name in alphabetical order (use the "pupil" table). */

SELECT *
FROM pupil
ORDER BY first_name, last_name;

/* 6. Display the name, weight and price of dishes, the cost of which is in the range from 90 to 125 inclusive. Sort the result first by price in descending order, and then by weight in ascending order (use the "dish" table). */

SELECT name, weight, price
FROM dish
WHERE price BETWEEN 90 AND 125
ORDER BY price DESC, weight;

/* 7. Display all information about the three youngest students (use the "pupil" table). */

SELECT *
FROM pupil
ORDER BY birth_date DESC
LIMIT 3;

/* 8. This is a "staff" table :
____________________________________staff__________________________________________________________________________________________
| id  |	first_name | last_name | sex    | birth_date | position     | phone         | salary | date_of_hiring | date_of_dismissal |
| 1   |	Stepan     | Shvets    | male   | 1990-05-07 | teacher      | +380984805362 | 7500   | 2013-07-01     | 2017-01-15        |
...................................................................................................................................
| 10  | Eugen      | Stolar    | male   | 1992-11-09 | teacher      | NULL          | 9300   | 2019-07-29     | NULL              |

Display the first name, last name, and date of birth of the oldest employee still working. */

SELECT first_name, last_name, birth_date
FROM staff
WHERE date_of_dismissal IS NULL
ORDER BY birth_date
LIMIT 1;

/* 9. Display the first name, last name, and date of birth of the youngest employee who resigned (use the "staff" table). */

SELECT first_name, last_name, birth_date 
FROM staff
WHERE date_of_dismissal IS NOT NULL
ORDER BY birth_date DESC
LIMIT 1;

/* 10. Display a list of unique city names from the "pupil" table. */

SELECT DISTINCT city
FROM pupil;

/* 11. Display a list of unique positions of employees, in which the salary is more than 12000. Sort the result by positions in alphabetical order (use the "staff" table). */

SELECT DISTINCT position
FROM staff
WHERE salary > 12000
ORDER BY position;
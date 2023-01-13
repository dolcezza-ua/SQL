/* 1. This is a "staff" table :
____________________________________staff__________________________________________________________________________________________
| id  |	first_name | last_name | sex    | birth_date | position     | phone         | salary | date_of_hiring | date_of_dismissal |
| 1   |	Stepan     | Shvets    | male   | 1990-05-07 | teacher      | +380984805362 | 7500   | 2013-07-01     | 2017-01-15        |
...................................................................................................................................
| 10  | Eugen      | Stolar    | male   | 1992-11-09 | teacher      | NULL          | 9300   | 2019-07-29     | NULL              |

Display all information about dismissed employees.    */

SELECT *
FROM staff
WHERE date_of_dismissal IS NOT NULL;

/* Displays the names and surnames of employees who do not have a phone number: */

SELECT first_name, last_name
FROM staff
WHERE phone IS NULL;

/* 2. This is a "pupil" table:
____________________________________pupil_____________________________________________________
| id  |	first_name | last_name | sex    | birth_date | mother_phone  | father_phone  | city  |
| 1   |	Eugen      | Tsven     | male   | 2000-12-01 | NULL          | +380998161172 | Kyiv  |
..............................................................................................
| 10  | Inna       | Kostenko  | female | 2009-10-15 | +380981865416 | NULL          | Irpin |

It is necessary to display all information about students who do not have the phone number of at least one of their parents. */

SELECT *
FROM pupil
WHERE  mother_phone IS NULL OR father_phone IS NULL;

/* Display the first name, last name and date of birth of students whose first name starts with 'A': */

SELECT first_name, last_name, birth_date
FROM pupil
WHERE first_name LIKE 'A%';

/* 3. It is necessary to display all information about students whose names consist of five letters (use the "pupil" table). */

SELECT *
FROM pupil
WHERE first_name LIKE '_____';

/* 4. Find the names and surnames of employees whose surnames end with the letter 'v' (use the "staff" table). */

SELECT first_name, last_name
FROM staff
WHERE last_name LIKE '%v';

/* 5. This is a "subject" table : 
______subject______
| id  |	name      | 
| 1   |	Music 	  | 
...................
| 10  | Economics | 

Display all information about items in the name of which the letter 'o' occurs two or more times. */

SELECT *
FROM subject
WHERE name LIKE '%o%o%';

/* 6. Display all information about employees who are still working and whose names start with the letter 'I' (use the "staff" table). */

SELECT *
FROM staff
WHERE date_of_dismissal IS NULL AND first_name LIKE 'I%';

/* 7. This is a "dish" table :
_______________________dish_______________________
| id  |	name         | price | weight | calories |
| 1   |	Baked potato | 30    | 200    | 300      |
..................................................
| 10  | Omelette     | 85    | 180    | 190      |

Display all information about dishes with the number of calories from 270 to 340 inclusive. */

SELECT *
FROM dish
WHERE calories BETWEEN 270 AND 340;

/* 8. This is a "book" table :
____________________________________book_________________________________
| id  |	title                           | publish_year | number_of_pages| 
| 1   |	Functional Skills Maths Level 1	| 2009         | 232            | 
.........................................................................
| 10  | See Inside Your Body            | 2015         | 216            | 

Display the title and year of publication of all books published between 2011 and 2015 inclusive. */

SELECT title, publish_year
FROM book
WHERE publish_year BETWEEN 2011 AND 2015;

/* 9. Display all information about dishes whose price is 90, 95 or 125 (use the "dish" table).*/

SELECT *
FROM dish
WHERE price IN (90, 95, 125);

/* 10. Display the first name, last name, date of birth and city of students named 'Eugen', 'Anna' or 'Volodymyr'(use the "pupil" table). */

SELECT first_name, last_name, birth_date, city
FROM pupil
WHERE first_name IN ('Eugen', 'Anna', 'Volodymyr');

/* 11. Display all information about books whose title does not begin with the letter 'F'(use the "book" table).*/

SELECT *
FROM book
WHERE title  NOT LIKE 'F%';

/* 12. Display first name, last name, date of birth and city of students except those born between 28.08.2005 and 12.06.2007 inclusive (use the "pupil" table).*/

SELECT first_name, last_name, birth_date, city
FROM pupil
WHERE birth_date NOT BETWEEN '2005-08-28' AND '2007-06-12';

/* 13. You need to display all information about students who do not live in the cities of 'Kyiv' and 'Irpin' (use the "pupil" table).*/

SELECT *
FROM pupil
WHERE city != 'Kyiv' AND city != 'Irpin';



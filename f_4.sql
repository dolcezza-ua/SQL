/* 1. This is a "subject" table : 
______subject______
| id  |	name      | 
| 1   |	Music 	  | 
...................
| 10  | Economics | 

Find subjects whose name consists of 7 or more letters. The result should contain two columns: subject_id and subject_name. */

SELECT id  AS subject_id, name AS subject_name
FROM subject
WHERE name LIKE '_______%' ;

/* 2. This is a "dish" table :
_______________________dish_______________________
| id  |	name         | price | weight | calories |
| 1   |	Baked potato | 30    | 200    | 300      |
..................................................
| 10  | Omelette     | 85    | 180    | 190      |

Displays the id, name and price of the three most expensive dishes. The result should contain three columns: dish_id, dish_name, and dish_price. */

SELECT id AS dish_id, name AS dish_name, price AS dish_price
FROM dish
ORDER BY price DESC
LIMIT 3;

/* 3.  This is a "book" table :
____________________________________book_________________________________
| id  |	title                           | publish_year | number_of_pages| 
| 1   |	Functional Skills Maths Level 1	| 2009         | 232            | 
.........................................................................
| 10  | See Inside Your Body            | 2015         | 216            | 

Find the oldest book and display its title. For the resulting column, set an alias - book_title. */

SELECT title AS book_title
FROM book
ORDER BY publish_year
LIMIT 1;

/* 4.  This is a "users" table :
____________________________________users___________________________
| id  |	       first_name       |     age	      |     city       | 
| 1   | Alice	                |      18         |    Kharkiv     | 
....................................................................
| 10  | John                    |      23         |      Lviv      |

Write a query that returns the name and age of users over 19 years old. The result should contain two columns: user name, user age. */

SELECT first_name AS "user name", age AS "user age"
FROM users 
WHERE age > 19;

/* 5. Write a query that returns the name and age of the users ("users" table). And also set the alias for the "user" table - "u". */

SELECT u.first_name, u.age
FROM users AS u ;           /* or: FROM users u; */
/* 1. This is a "pupil" table:
____________________________________pupil_____________________________________________________
| id  |	first_name | last_name | sex    | birth_date | mother_phone  | father_phone  | city  |
| 1   |	Eugen      | Tsven     | male   | 2000-12-01 | NULL          | +380998161172 | Kyiv  |
..............................................................................................
| 10  | Inna       | Kostenko  | female | 2009-10-15 | +380981865416 | NULL          | Irpin |

Count the number of students in each city. The result is presented in the form of:
- the first column is city;
- the second column is number_of_pupils. */

SELECT city, COUNT (*) AS number_of_pupils
FROM pupil
GROUP BY city;

/* 2. This is a "staff" table :
____________________________________staff__________________________________________________________________________________________
| id  |	first_name | last_name | sex    | birth_date | position     | phone         | salary | date_of_hiring | date_of_dismissal |
| 1   |	Stepan     | Shvets    | male   | 1990-05-07 | teacher      | +380984805362 | 7500   | 2013-07-01     | 2017-01-15        |
...................................................................................................................................
| 10  | Eugen      | Stolar    | male   | 1992-11-09 | teacher      | NULL          | 9300   | 2019-07-29     | NULL              |

Count the number of men and women who are still working. The result is presented in the form of:
- the first column is sex;
- the second column is number_of_staff. */

SELECT sex, COUNT (*) AS number_of_staff
FROM staff
WHERE date_of_dismissal IS NULL
GROUP BY sex;

/* 3. Find the number of students with one or another name. Sort the names in alphabetical order. The result is presented in the form of:
- first column — first_name;
- the second column is number_of_pupils (use the "pupil" table). */

SELECT first_name, COUNT (*) AS number_of_pupils
FROM pupil
GROUP BY first_name
ORDER BY first_name;

/* 4. Find the maximum salary for each position. The result is presented in the form of:
- the first column is position;
- the second column is max_salary (use the "staff" table). */

SELECT position, MAX (salary) AS max_salary
FROM staff
GROUP BY position;

/* 5. This is a "book" table :
____________________________________book_________________________________
| id  |	title                           | publish_year | number_of_pages| 
| 1   |	Functional Skills Maths Level 1	| 2009         | 232            | 
.........................................................................
| 10  | See Inside Your Body            | 2015         | 216            | 

Find the number (sum) of pages of books that were published each year from 2011 to 2015 inclusive. Sort the result by year of publication in descending order. 
The result is presented in the form of:
- the first column — year;
- the second column is number_of_pages. */

SELECT publish_year AS year, SUM (number_of_pages) AS number_of_pages
FROM book
WHERE publish_year BETWEEN 2011 AND 2015
GROUP BY publish_year
ORDER BY publish_year DESC;

/* 6. This is a "users" table: 
____________users_____________
| id  |	first_name | country |  
| 1   |	Mike	   | USA     |
| 2   | John       | Spain   | 
| 3   |	Kate	   | Ukraine |
| 4   |	Ivan	   | Ukraine |
| 5   |	Alice	   | Brazil  |
| 6   |	Bob	       | USA     |
..............................
Write a query that returns the number of users in each country */

SELECT country, COUNT(*) AS number_of_users
FROM users
GROUP BY country;

/* 7. This is a "orders" table:
_______________________orders_______________________
| id  |	price | date       |     city    | country |  
| 1   |	1000  | 2020-07-23 | Kyiv        | Ukraine |
| 2   | 2000  | 2021-02-10 | Los Angeles | USA     | 
| 3   |	1600  | 2020-10-02 | Kyiv        | Ukraine |
| 4   |	1550  | 2020-12-18 | Los Angeles | USA     |
| 5   |	1200  | 2021-03-12 | Odesa       | Ukraine |
| 6   |	1780  | 2021-05-01 | New York    | USA     |
....................................................
Write a query that returns the maximum value of an order placed in each city in each country. Sort the result by country and city in alphabetical order. */

SELECT country, city, MAX(price) AS max_price
FROM orders
GROUP BY country, city
ORDER BY country, city;

/* 1. Given a table with information about employees - "staff", display all the data of this table. */

SELECT *
FROM staff;

/* Given a "book" table, you need to display the "title" and publication year of all books "publish_year". */

SELECT title,publish_year
FROM book;

/* 2. Show all information about students who are not from the city of Kyiv from the "pupil" table. (Use two different ways) */

SELECT *
FROM pupil
WHERE city != 'Kyiv';

SELECT *
FROM pupil
WHERE NOT city = 'Kyiv';


/* Given a table "pupil". Display the name, surname and date of birth of all students who were born before 01.01.2003. */

SELECT first_name, last_name, birth_date
FROM pupil
WHERE birth_date < '2003-01-01';

/* 3. Given a "book" table, you need to display the names of all books for which both conditions are met:
- they were published (publish_year) after 2013;
- "number_of_pages" is less than or equal to 310. */

SELECT title
FROM book
WHERE publish_year > 2013 AND number_of_pages <= 310;

/* 4. The table "staff" is given. Display all information about employees who:
- male;
- started working after 01.01.2014 (date_of_hiring column);
- have a salary of more than 10,000 (not including). */

SELECT *
FROM staff
WHERE sex = 'male' AND date_of_hiring > '2014-01-01' AND salary > 10000;

/* 5. Given a "book" table, you want to display all information about books that were published in 2012 or 2015. */

SELECT *
FROM book
WHERE publish_year = 2012 OR publish_year = 2015;

/* 6. Given a "dish" table, you want to display the names of dishes with more than 280 calories and less than 300 calories. */

SELECT name
FROM dish
WHERE calories > 280 AND calories < 300;

/* 7. Given a table "book", you need to display the names of all books that meet two conditions:
- published before 2012 inclusive or after 2017 inclusive;
- contain more than 240 pages. */

SELECT title
FROM book
WHERE (publish_year <= 2012 OR publish_year >= 2017) AND number_of_pages > 240;

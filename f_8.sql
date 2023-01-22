/* 1. This is a "dish" table :
_______________________dish_______________________
| id  |	name         | price | weight | calories |
| 1   |	Baked potato | 30    | 200    | 300      |
..................................................
| 10  | Omelette     | 85    | 180    | 190      |

Display information about all dishes in the format: name: price UAH. Create an alias for the resulting column — dish_information. */

SELECT CONCAT (name, ': ', price, ' UAH') AS dish_information
FROM dish;

/* 2. This is a "staff" table :
____________________________________staff__________________________________________________________________________________________
| id  |	first_name | last_name | sex    | birth_date | position     | phone         | salary | date_of_hiring | date_of_dismissal |
| 1   |	Stepan     | Shvets    | male   | 1990-05-07 | teacher      | +380984805362 | 7500   | 2013-07-01     | 2017-01-15        |
...................................................................................................................................
| 10  | Eugen      | Stolar    | male   | 1992-11-09 | teacher      | NULL          | 9300   | 2019-07-29     | NULL              |

Find the number of workers who were hired each year. The result should contain the following columns:
- year — year from the date_of_hiring column;
- number_of_staff — the number of new employees hired in year. */

SELECT EXTRACT (year FROM date_of_hiring) AS year, COUNT (*) AS number_of_staff
FROM staff
GROUP BY year;

/* 3. This is a "pupil" table:
____________________________________pupil_____________________________________________________
| id  |	first_name | last_name | sex    | birth_date | mother_phone  | father_phone  | city  |
| 1   |	Eugen      | Tsven     | male   | 2000-12-01 | NULL          | +380998161172 | Kyiv  |
..............................................................................................
| 10  | Inna       | Kostenko  | female | 2009-10-15 | +380981865416 | NULL          | Irpin |

Find the number of students who have a birthday in the current calendar month. Create an alias for the resulting column — number_of_pupils. */

SELECT COUNT (*) AS number_of_pupils
FROM pupil
WHERE EXTRACT (MONTH FROM CURRENT_DATE) = EXTRACT (MONTH FROM birth_date);

/* 4. This is a "category" table and a "product" table:
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

Display information about each of the products in the "Beverages" category in the format: [product name] - [amount] units. Create an alias for the resulting column — product_information. */

SELECT CONCAT (product.name, ' - ',amount, ' units') AS product_information
FROM product
INNER JOIN category
ON category.id = product.category_id
WHERE category.name = 'Beverages';

/* 5. Find information about fired employees. Present the date of dismissal in three different columns: day, month and year. The result should contain the following columns:
- first_name — name of the employee;
- last_name — last name of the employee;
- day — release day;
- month — the month of dismissal;
- year — the year of release. 
(use the "staff" table) */

SELECT first_name, last_name, EXTRACT (day FROM date_of_dismissal) AS day, EXTRACT (month FROM date_of_dismissal) AS month, EXTRACT (year FROM date_of_dismissal) AS year
FROM staff 
WHERE date_of_dismissal IS NOT NULL;

/* 6. This is a "scoreboard" table and a "pupil" table:
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

Find the average score in each subject for a student with id = 3. The display result is in the format: [first_name] [last_name]: [subject] - [average mark]. 
Create an alias for the resulting column — pupil_mark. */

SELECT CONCAT (first_name, ' ', last_name, ': ', subject, ' - ', AVG (mark)) AS pupil_mark
FROM pupil
INNER JOIN scoreboard
ON pupil.id = scoreboard.pupil_id
WHERE pupil.id = 3
GROUP BY subject;

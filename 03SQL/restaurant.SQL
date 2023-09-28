-- สร้างdatabase restaurant.db 
-- สร้างtable อย่างน้อย 5 tables
-- เขียน3-5 queries มี 1 x WITH, 1 x Subqueries, 1 x Aggregate Functions + JOIN 
-- https://replit.com/@Film007original/BootcampHomeworkSQL

.open restaurant.db
SELECT "-------------------------------------------------";
SELECT "-------------------------------------------------";
DROP TABLE foodMENU;
DROP TABLE dessertMENU;
DROP TABLE staff;
DROP TABLE member;
DROP TABLE orders;
DROP TABLE invoices;

  -- create table foodMENU
CREATE TABLE foodMENU (
  foodID int NOT NULL PRIMARY KEY,
  foodName text,
  foodPrice int NOT NULL
);

INSERT INTO foodMENU VALUES
    (0,'NULL',0),
    (1, 'Mango Salad', 300),
    (2, 'Pomelo Salad', 350),
    (3, 'Santol Salad', 250),
    (4, 'Mixed Fruit Salad', 400);

-- create table dessertMENU
CREATE TABLE dessertMENU (
  dessertID int NOT NULL PRIMARY KEY,
  dessertName text,
  dessertPrice int NOT NULL
);

INSERT INTO dessertMENU VALUES
    (0,'NULL',0),
    (1, 'Mango Bingsu', 320),
    (2, 'Melon Bingsu', 340),
    (3, 'Strawberry Bingsu', 340);

--create table staff
CREATE TABLE staff (
  staffId int NOT NULL PRIMARY KEY,
  staffName text
);

INSERT INTO staff VALUES
    (1, 'Mana'),
    (2, 'Manee'),
    (3, 'Piti'),
    (4, 'Shujai');

--create table member
CREATE TABLE member (
  memberId int NOT NULL PRIMARY KEY,
  memberName text,
  gender text,
  invoicesId int,
  FOREIGN KEY (invoicesId) REFERENCES invoices(invoicesId)
);

INSERT INTO member VALUES
    (1, 'Sam', 'Mr.', 1),
    (2, 'Ann', 'Mrs.', 2),
    (3, 'Adam', 'Mr.', 3),
    (4, 'Cindy', 'Miss', 4),
    (5, 'Peter', 'Mr.', 5);

--create table orders
CREATE TABLE orders (
  orderId int NOT NULL PRIMARY KEY,
  staffId int NOT NULL ,
  memberId int NOT NULL ,
  foodId int NOT NULL ,
  dessertId int NOT NULL,
  FOREIGN KEY (memberId) REFERENCES member(memberId)
);

INSERT INTO orders VALUES
    (1, 1, 2, 1, 1),
    (2, 2, 1, 2, 3),
    (3, 3, 3, 3, 2),
    (4, 2, 2, 2, 2),
    (5, 1, 4, 2, 3),
    (6, 1, 5, 1, 0),
    (7, 2, 3, 1, 1),
    (8, 2, 4, 1, 1);

--create table invoices
CREATE TABLE invoices (
  invoicesId int NOT NULL PRIMARY KEY,
  orderId int NOT NULL ,
  memberId int NOT NULL,
  invoicesDate text
);

INSERT INTO invoices VALUES
    (1, 1, 2, '2023-01-31 07:30:11'),
    (2, 2, 1, '2023-01-31 08:24:40'),
    (3, 3, 3, '2023-01-31 08:55:17'),
    (4, 4, 2, '2023-01-31 09:04:08'),
    (5, 5, 4, '2023-01-31 10:31:45'),
    (6, 6, 5, '2023-01-31 12:53:10'),
    (7, 7, 3, '2023-01-31 13:21:58'),
    (8, 8, 4, '2023-01-31 14:05:25');

SELECT 
  "************DAILY_FRUIT_SALAD_&_BINGSU************";
SELECT 
  "-------------------------------------------------";
.mode column
.header on
---------------------------------------------

  
-- JOIN tables for find order foodMENU and dessertMENU
SELECT 
  orderId,
  x4.gender AS list, 
  memberName,
  foodName,
  dessertName
  -- x10.invoicesDate
FROM member AS x4,
     orders AS x5,
     foodMENU AS x1,
     dessertMENU AS x2
     -- invoices AS x10
WHERE x4.memberId = x5.memberId
AND x5.foodId = x1.foodId
AND x2.dessertId = x5.dessertId

ORDER BY OrderId;
.print

-- JOIN tables for the daily most popular salad
SELECT 
  t1.foodId,
  foodName AS popular_salad,
  Count(*) As times
FROM member AS t4
JOIN orders AS t5
ON t4.memberId = t5.memberId
JOIN foodMENU AS t1
ON t1.foodId = t5.foodId
GROUP BY t1.foodId
HAVING Count(t1.foodId) > 1
Order By Count(*) Desc Limit 2;
.print  

-- JOIN tables for the daily most popular bingsu
SELECT 
  t2.dessertId,
  dessertName AS popular_bingsu,
  Count(*) As times
FROM member AS t4
JOIN orders AS t5
ON t4.memberId = t5.memberId
JOIN dessertMENU AS t2
ON t2.dessertId = t5.dessertId
GROUP BY t2.dessertId
HAVING Count(t2.dessertId) > 1
Order By Count(*) Desc Limit 2;
.print
  

-- Sub query 

SELECT invoicesId,memberName,invoicesDate FROM (
  SELECT 
    x4.memberId, 
    memberName,
    foodName AS food,
    dessertName,
    invoicesDate,
    x6.invoicesId
  FROM member AS x4
  JOIN orders AS x5 ON x4.memberId = x5.memberId
  JOIN foodMENU AS x1 ON x5.foodId = x1.foodId
  JOIN dessertMENU AS x2 ON x2.dessertId = x5.dessertId
  JOIN invoices AS x6 ON x5.orderId = x6.orderId
);
.print

-- WITH & Sub query 
WITH Menus AS (
  SELECT 
    x4.memberId, 
    memberName AS member,
    foodName AS food,
    dessertName AS dessert,
    invoicesDate,
    x6.invoicesId,
    x3.staffName AS staff,
    dessertPrice AS dessertprice,
    foodPrice AS foodprice
  FROM member AS x4
  JOIN orders AS x5 ON x4.memberId = x5.memberId
  JOIN foodMENU AS x1 ON x5.foodId = x1.foodId
  JOIN dessertMENU AS x2 ON x2.dessertId = x5.dessertId
  JOIN invoices AS x6 ON x5.orderId = x6.orderId
  JOIN staff AS x3 ON x5.staffId = x3.staffId
  )
SELECT staff, food, dessert, invoicesDate AS history
  FROM Menus
ORDER BY invoicesDate;
-- WHERE staff LIKE 'M%';
.print

--Aggregate function 
SELECT
  x4.memberName,
  COUNT(*) AS get_points,
  SUM(x1.foodPrice+x2.dessertPrice) AS total
  
FROM member AS x4
JOIN orders AS x5 ON x4.memberId = x5.memberId
JOIN foodMENU AS x1 ON x5.foodId = x1.foodId
JOIN dessertMENU AS x2 ON x2.dessertId = x5.dessertId
JOIN invoices AS x6 ON x5.orderId = x6.orderId
GROUP BY x4.memberName
ORDER BY get_points DESC;
.print

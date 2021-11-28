--Part 4
--1.
CREATE TABLE mrFrumbleData(
name VARCHAR(250),
discount INT,
month VARCHAR(20),
price INT
);
--.mode csv
--.import .import /Users/munzir/Desktop/Homework4/mrFrumbleData.csv mrfrumbleData


--2.

--name -> discount No FD by looking at data
--name -> month No FD by looking at data
--name -> price


SELECT * FROM mrFrumbleData A, mrFrumbleData B
WHERE A.name = B.name AND A.price != B.price;


--It returns no data, so name -> price
--discount -> name No FD by looking at data
--discount -> month No FD by looking at data
--discount -> price

SELECT * FROM mrFrumbleData A, mrFrumbleData B
WHERE A.discount = B.discount AND A.price != B.price;

--It returns tons of data, so no FD
--month -> name No FD by looking at data
--month -> discount

SELECT * FROM mrFrumbleData A, mrFrumbleData B
WHERE A.month = B.month AND A.discount != B.discount;

/*
It returns no data, so month -> discount
month -> price No FD by looking at data
price -> name No FD by looking at data
price -> discount No FD by looking at data
price -> month No FD by looking at data

From here we have: name -> price AND month -> discount
So we have: name, month -> price, discount

Now trying many-to-many
name, discount -> price, month
*/

SELECT * FROM mrFrumbleData A, mrFrumbleData B
WHERE A.name = B.name AND A.discount = B.discount
AND A.price != B.price AND A.month != B.month;

--It returns no data, so name, discount -> price, month
--name, month -> price, discount is a FD (tested)
--name, price -> month, discount

SELECT * FROM mrFrumbleData A, mrFrumbleData B
WHERE A.name = B.name AND A.price = B.price
AND A.discount != B.discount AND A.month != B.month;

--It returns tons of data, so no FD
--discount, month -> name, price

SELECT *
FROM mrFrumbleData A, mrFrumbleData B
WHERE A.discount = B.discount AND A.month = B.month
AND A.name != B.name AND A.price != B.price;
/*
It returns a loy of data = no FD
discount, price -> name, month No FD by looking at data
month, price -> discount, name
*/

SELECT * FROM mrFrumbleData A, mrFrumbleData B
WHERE A.month = B.month AND A.price = B.price
AND A.discount != B.discount AND A.name != B.name;
/* It returns no data, so month, price -> discount, name
FDs:
name -> price
month -> discount
name, month -> price, discount
month, price -> discount, name
name, discount -> price, month */

--3.
/*
For S(name,price,discount,month)
[name]+ = [name, price]
S(name, price, discount, month) can be decomposed as
S1(name, price) and (name, discount, month)
For (name, discount, month)
[month]+ = [month, discount]
(name, discount, month) can be decomposed as
S2(month, discount) and S3(month, name)

So:
S1(name, price)
S2(month, discount)
S3(month, name)
*/

CREATE TABLE name_price (
name VARCHAR(20) PRIMARY KEY,
price INT
);

CREATE TABLE month_discount (
month varchar(10) PRIMARY KEY,
discount int
);

CREATE TABLE month_name (
month varchar(256),
name varchar(10),
FOREIGN KEY(name) REFERENCES name_price(name),
FOREIGN KEY(month) REFERENCES month_discount(month)
);


--4.
INSERT INTO name_price
SELECT DISTINCT name, price
FROM mrFrumbleData;
SELECT COUNT(*) FROM name_price;

--36 rows

INSERT INTO month_discount
SELECT DISTINCT month, discount
FROM mrFrumbleData;
SELECT COUNT(*) FROM month_discount;

--12 rows

INSERT INTO month_name
SELECT DISTINCT month,name
FROM mrFrumbleData;
SELECT COUNT(*) FROM month_name;

--426 rows

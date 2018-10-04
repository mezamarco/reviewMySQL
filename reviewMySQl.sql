create table userTable(id integer PRIMARY KEY AUTO_INCREMENT NOT NULL, firstName varchar(100),lastName varchar(100),
                        age integer, email varchar(100), phoneNumber varchar(100));

insert into userTable(firstName, lastName, age,email, phoneNumber) values("Marco", "Meza",27,"mezamarco@yahoo.com", "61034343223");
insert into userTable(firstName, lastName, age,email, phoneNumber) values("Bob", "Meza",222,"mezaco@yahoo.com", "61023");
insert into userTable(firstName, lastName, age,email, phoneNumber) values("d", "Msza",17,"mezco@yahoo.com", "6103223");
insert into userTable(firstName, lastName, age,email, phoneNumber) values("Masarco", "Meza",54,"meco@yahoo.com", "612333223");
insert into userTable(firstName, lastName, age,email, phoneNumber) values("Marsasdgo", "Meza",6,"mezaFo@yahoo.com", "61033");
insert into userTable(firstName, lastName, age,email, phoneNumber) values("ipoco", "Meza",33,"mesaamarco@yahoo.com", "61223");
insert into userTable(firstName, lastName, age,email, phoneNumber) values("Maaaaco", "Maaza",43,"fsa@yahoo.com", "61321223");
insert into userTable(firstName, lastName, age,email, phoneNumber) values("Maaaaaaaaso", "Mdaa",90,"masdmarco@yahoo.com", "623145223");


select * from userTable;
-- Your code here


-- Lets diplay all our tables
-- Note that we only have one table
show tables;

-- Lets select only some specific fields
select firstName, lastName, age from userTable;
-- Select but a with a given limit
select * from userTable LIMIT 5;

show tables;

-- limit with an offset of two
select * from userTable LIMIT 5 OFFSET 2;
show tables;
show tables;
show tables;

-- We need to give our data an order
select * from userTable ORDER BY age;
-- What about descending 
select * from userTable ORDER BY age DESC;
show tables;
show tables;
show tables;

-- Selecting very speciific data, WHERE, AND, OR
select * from userTable WHERE id = 7;

select * from userTable WHERE id <= 3;
show tables;

select * from userTable WHERE age <= 43 AND age >= 17;

select * from userTable WHERE id = 4 OR lastName = "Meza";
show tables;

-- Search for cetain keywords using LIKE, make sure to use the percentage symbol
select * from userTable WHERE email LIKE "%co@yahoo%";
show tables;

-- Select all the result except where not
select * from userTable WHERE NOT id = 2;
show tables;
show tables;
show tables;


-- We will now work with functions, COUNT, AVG, SUM
select COUNT(id) from userTable WHERE id = 0;

select COUNT(id) from userTable WHERE id <= 6;

select AVG(age) from userTable;

select SUM(age) from userTable;


select COUNT(id) from userTable WHERE id = 0;


-- We are done with selecting data, but how do we modify a table

-- Add new data into our table, a new row
insert into userTable (firstName, lastName, age) VALUES ('Bobby', 'Hill', 100);
select * from userTable;
select COUNT(id) from userTable WHERE id = 0;
select COUNT(id) from userTable WHERE id = 0;

-- How do we update current data in our table, we need to use the keyword UPDATE
UPDATE userTable SET firstName = "Gohan", lastName = "Goku", age = 200 WHERE id = 4;

select * from userTable;

-- We need to delete an entire row, Always backup your data before deleting anything
DELETE FROM userTable WHERE id = 8;
select count(id) from userTable where id = 0;
select * from userTable;

select count(id) from userTable where id = 0;
select count(id) from userTable where id = 0;



-- We need to create a new table and then we will alter the table
create table reviewTable(review_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, productName varchar(100) NOT NULL,score INTEGER NOT NULL);
insert into reviewTable(productName, score) values ("shoes", 100);
insert into reviewTable(productName, score) values ("hat", 22);
insert into reviewTable(productName, score) values ("backpack", 90);
select * from reviewTable;


-- If we want to delete an entire table, use DROP TABLE
create table tempTable(id integer, tempfield integer);
insert into tempTable(id, tempfield) values ( 6,89);
select * from tempTable;
DROP TABLE tempTable;

select count(id) from userTable where id = 0;

-- To ALTER TABLE, we can to ADD, DROP, MODIFY a column

select * from reviewTable;
select count(id) from userTable where id = 0;

ALTER TABLE reviewTable ADD theNewCol varchar(100);

select * from reviewTable;


ALTER TABLE reviewTable ADD theLastColumn varchar(100);
select * from reviewTable;
ALTER TABLE reviewTable DROP theLastColumn;
ALTER TABLE reviewTable MODIFY theNewCol INTEGER;
select count(score) from reviewTable WHERE score = 100;
select * from reviewTable;


create table Customer(CustomerID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, CityID INTEGER, CustomerName varchar(100));
insert into Customer(CityID, CustomerName) values(1, "Bob Smith");
insert into Customer(CityID, CustomerName) values (1, "Sally Smith");
insert into Customer(CityID, CustomerName) values (2, "Tom Smith");
insert into Customer(CityID, CustomerName) values (NULL, "Mary Smith");

create table City(CityID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, CityName varchar(100));
insert into City(CityName) VALUES("Kansas City");
insert into City(CityName) VALUES("New York");
insert into City(CityName) VALUES("Houston");


-- Iis time to join table, we will use our customer table and the city table
select count(score) from reviewTable WHERE score = 100;
select count(score) from reviewTable WHERE score = 100;
select count(score) from reviewTable WHERE score = 100;
select count(score) from reviewTable WHERE score = 100;
select count(score) from reviewTable WHERE score = 100;
select * from Customer;
select count(score) from reviewTable WHERE score = 100;
select * from City;
select count(score) from reviewTable WHERE score = 100;

-- Inner Join: Data where a cetain field matches in both
select * from Customer Inner Join City on Customer.CityID = City.CityID;
select count(score) from reviewTable WHERE score = 100;


-- Left Join: Get everytihng from the first table and also from inner join
select * from Customer Left Join City on Customer.CityID = City.CityID;
select count(score) from reviewTable WHERE score = 100;

-- Right Join: Get everytihng from the second tanle and also form the inner join
select * from Customer Right Join City on Customer.CityID = City.CityID;
select count(score) from reviewTable WHERE score = 100;

-- Full Join: Get everytihng from both tables
-- select * from Customer Full JOIN City on Customer.CityID = City.CityID;
select count(score) from reviewTable WHERE score = 100;

-- Utilizing AS and then ge the inner join
select * from Customer as cs JOIN City as ci on cs.CityID = ci.CityID;
select count(score) from reviewTable WHERE score = 100;
select cs.*, ci.CityName from Customer as cs JOIN City as ci on cs.CityID = ci.CityID;
select count(score) from reviewTable WHERE score = 100;


-- In the userTable who is the oldest person
select * from userTable where age = (select MAX(age) from userTable);
-- Get the second oldest person
select * from userTable ORDER BY age DESC Limit 1 offset 1;
select count(score) from reviewTable WHERE score = 100;
select max(age) from userTable where not age = (select MAX(age) from userTable);

select * from userTable where id >=3 and id <= 5;




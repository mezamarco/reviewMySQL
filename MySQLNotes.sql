What is MySQL? Structure Query Language
This is the language that is used to communicate with databases.

Databases?
Is a collection of data
Databases are made up of tables. Different data goes into different tables. 
Every column in a table is different.
MySQL will allow us to add, remove, modify, search and join, tables in a database using code.


PHP is a programming language: Server Sided
Used to create dynamic websites and also allows us to connect to a databases

HTML allows us to form the structure of the web page
CSS will make the web page look amazing and the way you want it to look

Web development Basic Concepts 
The internet is just a bunch of computers that talk to each other using a certain protocol (TCP IP) 

The client(user) will make a request to a certain server
The server will then respond by giving you the files that contain the HTML and CSS files

The client languages are HTML, CSS, and Javascript.
The server is a computer in a datacenter.(databases) 
The language used by the servers: PHP, Java, Python,……, etc.
Server function, 
Contain user accounts, login/logout, saving data, photos, files, creating inserting deleting data.

 
What are primary keys:
A unique key in our table. Allows us to find a single and specific row.

In the terminal, if you want to see all the tables use:
show tables;


SELECT:
We can select all the data from a table
SELECT * FROM ‘tableName’
Or we can select some fields from the given table
SELECT ‘username’ , ’password’ FROM ‘usersTable’

 LIMIT:
When we can to limit the number of results we can place a limit (Example :  Limit to 13 results)
SELECT * FROM `tableName` LIMIT 13

OFFSET:
We can skip the first results by using OFFSET, example display the result from 6-10
SELECT * FROM `tableName` LIMIT 5 OFFSET 5
Or
SELECT * FROM `tableName` LIMIT 3, 2                =>  Skip the first two results and then print out 3 results


ORDER BY: (Place this before any limits or offsets) (By default, Ascending order)
Example:
SELECT * FROM `tableName` ORDER BY `id` LIMIT 10
If we want Descending order we must add the keyword right after the ORDER BY keyword: DESC
SELECT * FROM `tableName` ORDER BY `id` DESC LIMIT 10
WHER E:
Print out result with that satisfy given condition.
SELECT `product_name`, `product_stock` FROM `tableName` WHERE `product_stock` <= 20
SELECT `first_name` , `last_name` FROM `users` WHERE `id` = 14
SELECT * FROM `addresses` WHERE `state` = “California”


AND:
SELECT * FROM `addresses` WHERE `state` = “California” AND `zip` = 92154
OR:
SELECT * FROM `addresses` WHERE `state` = “California” OR `state` = “Nevada”


LIKE:
Looking for certain keywords, 
The percentage symbol(%), the wildcard symbol,  will state that there might be some stuff before the word or after the word.
SELECT * FROM `products` WHERE `product_name` LIKE “%ball%”


WHERE NOT:
Shows all the result except where the username is Marco.
SELECT `username` FROM `users` WHERE NOT `username`= "Marco"
Or use the symbol <>
SELECT `username` FROM `users` WHERE `username` <> "Marco"






//SQL FUNCTIONS

SELECT COUNT():
The counting function outputs the number of results
SELECT COUNT(`username`) FROM `users` WHERE `username` = 'Marco'

SELECT AVG(): The average function, 
SELECT AVG(`product_price`) FROM `products`

SELECT SUM(): The sum function,
SELECT SUM(`product_price`) FROM `products`

//Inserting new rows into our table, inserting into table name and make sure to declare the fields and then give it values
INSERT INTO `tableName` (`first_name`,`last_name`) VALUES (‘Marco’,’Meza’)

//Updating a row , make sure to use the keyword, WHERE, because then you will be modifying the entire table
UPDATE `tableName` SET `username` = ‘therock’ , `password` = ‘1234’ WHERE `id` = 16

//Deleting data, Always export the current SQL version, because using delete in a wrong way will delete all the data, therefore always use WHERE, be specific, delete by the primary key
DELETE FROM `users`  WHERE  `id`= 16

//Creating and dropping tables
CREATE TABLE `reviews` (
    review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    review_title VARCHAR(255) NOT NULL,
    review_description TEXT(1000) NOT NULL,
    users_id INT NOT NULL,
    product_id INT NOT NULL
 )

DROP TABLE `reviews`


//Updating a new column in a given table
ALTER TABLE `tableName` ADD `random_column` VARCHAR(255)
ALTER TABLE `tableName` DROP  `random_column`
ALTER TABLE `tableName` MODIFY `random_column` text
ALTER TABLE `tableName` MODIFY `random_column` date NOT NULL
ALTER TABLE `tableName` ADD `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY








Foreign Key:  A primary key that belongs to another table
One single primary key per table
Multiple Foreign keys are allowed
Primary key cannot be null
Foreign key can be null






//Joining 2 tables
//select the fields by using the tableName.FieldName 
//FROM tableOne JOIN tableTwo 
//ON foreignKeyOne = foreignKeyTwo

SELECT users.first_name, users.last_name, addresses.address_line_1,addresses.city, addresses.state_province 
FROM addresses JOIN users 
ON addresses.id = users.id


Joining multiple tables
SELECT orders.order_id, products.product_id, products.product_name, users.first_name FROM orders JOIN products ON orders.product_id = products.product_id JOIN users ON users.id = orders.user_id

Aliases
SELECT o.order_id, p.product_name FROM orders AS o JOIN products AS p ON o.product_id = p.product_id









Foreign Key (linking the current table to another table using the primary key)
CREATE TABLE `reviews` (
    review_id INT NOT NULL AUTO_INCREMENT,
    review_title VARCHAR(255) NOT NULL,
    review_description TEXT(1000) NOT NULL,
    users_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY(review_id) REFERENCES products(product_id)
 )

ALTER TABLE orders ADD FOREIGN KEY ( product_id) REFERENCES products(product_id)
ALTER TABLE orders ADD FOREIGN KEY ( user_id) REFERENCES users(id)

Remove a foreign key(Check in structure, relational view,  and the linking name
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1



How do we group our data.
SELECT name,count(*) FROM student GROUP BY name;
SELECT Month(birth_day) AS ‘Month’, COUNT(*) FROM student GROUP BY Month ORDER BY Month;

MONTH function will look at: 2009-03-23, therefore it will get: 3









What are Triggers in SQL?
Command	Type	Keyword
INSERT	BEFORE,AFTER	NEW
UPDATE	BEFORE,AFTER	NEW OLD
DELETE	BEFORE,AFTER	OLD
Ex,
CREATE TRIGGER createHistory
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
	INSERT INTO history(name,email) VALUES (OLD.name, OLD.email);
END

A trigger is a named database object that is associated with a table, and that activates when a particular event occurs for the table. Some uses for triggers are to perform checks of values to be inserted into a table or to perform calculations on values involved in an update.A trigger is defined to activate when a statement inserts, updates, or deletes rows in the associated table. 


What are different levels of normalization in SQL?
1nf(first normal form)
2nf(second normal form)
3nf(third normal form)
Think of it as pouring dirty water with rocks into filters 
The first filter has many holes
The second filter has less holes
The third filter has smaller and less holes
In the end, you will have very pure water.


What is a Foreign Key in SQL?  
It should reference a unique key.
A child row references(points to) another parent row



We can update 64 column in a single query

Database Name up to 64  characters
Table Name up to 64  characters
Column Name up to 64  characters

(DDL) Data Definition Language: (CREATE TABLE, ALTER TABLE, etc)
Deals with database schemas and descriptions of how the data should reside in the database
(DML)Data Manipulation Language
Deals with data manipulation, ex:  SELECT, INSERT,UPDATE, DELETE, etc
(DCL)Data Control Language
It includes commands such as GRANT, and mostly concern with rights , permission and other controls of the database systems.

Get the number of rows: 
SELECT COUNT (fieldname) FROM tableName          //Make sure to use the primaryKey









MySQL_fetch_object(): returns the result as an object
Access data using the field name:      $result->name

MySQL_fetch_array(): returns the result as an array
Access data using the field name:      $result->[name]

MySQL_fetch_row($result): where $result is the resource returned from a successful query 
executed using the mysql_query() function. 


How to find unique values:
Use DISTINCT,     Ex:
SELECT COUNT(DISTINCT user_name) FROM tableName;

Return one hundred books starting from 25th book? 
SELECT book_title FROM books LIMIT 25,100;
//NOTE: After LIMIT: First value: 25 is the offset, the second is the number

How would you select all the users, whose phone number is null?
SELECT user_name FROM users WHERE ISNULL (user_phonenumber);

How can you see all indexes defined for a table?
SHOW INDEX FROM users;

How would you delete a column?
ALTER TABLE users DROP user_emails 


Inside LIKE:
%corresponds to 0 or more characters
_ is exactly one character   

How to get the highest salary of an employee from an employee table
SLECT salary FROM employee ORDER BY salary DESC LIMIT 1
How to get the second highest salary of an employee from an employee table
SLECT salary FROM employee ORDER BY salary DESC LIMIT 1,1
MySQL: It is an SQL database management system.


The trigger can be executed when you run one of the following MySQL statements on the table: INSERT, UPDATE and DELETE and it can be invoked before or after the event.












Employee info with the max salary
Select * from employeeTable where salary(select Max(salary) from employeeTable)

What is the actual max salary in the given table
Select MAX(salary) from employeeTable;

Employee info with 2nd  max salary
Select * from employeeTable ORDER BY salary DESC LIMIT 1 OFFSET 1

Who has the 2nd highest salary in the employee table
Select Max(salary) from employeeTable WHERE NOT salary  = (select Max(salary) from employeeTable)

Select a range of employees
Select * from EmployeeTable WHERE id >=12 and id <=25;

Do a join with the EmployeeTable and the departmentTable(Note that they both have a departmentID)
Select * from EmployeeTable INNER JOIN departmentTable 
WHERE EmployeeTable.departmentID = departmentTable.departmentID;

Specifically, only get the employee name, highest salary and the department
Select EmployeeTable.empName, departmentTable.departmentName from EmployeeTable INNER JOIN departmentTable 
WHERE EmployeeTable.departmentID = departmentTable.departmentID;


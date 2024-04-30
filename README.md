# sql-challenge
9th challenge of the ITESM data analytics bootcamp 

For this challenge I reviewed the solutions for the problems reviewed in classes. 
Starting out I struggled with importing the .csv files to the table sin the proper order, so I asked my brother who studied Computer Technologies.

ANother resources I used for a couple questins was ChatGPT, here is my exchange with it:

#1
How to select elements from a table in postgres based on a specific letter their value starts with

A:
To select elements from a table in PostgreSQL based on a specific letter that their value starts with, you can use the LIKE operator in combination with the appropriate wildcard character. Here's a basic example:
Let's say you have a table named my_table with a column named my_column, and you want to select rows where the values in my_column start with the letter 'A'. You can use the following query:

|-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·|
SELECT *						
FROM my_table					
WHERE my_column LIKE 'A%';		
|-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·|

In this query:
* LIKE 'A%' is a pattern matching condition that selects rows where my_column starts with the letter 'A'. The % wildcard matches any sequence of characters.
If you want to make the search case-insensitive, you can use the ILIKE operator instead of LIKE. For example:

|-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·  |
 SELECT *					 	
 FROM my_table					
 WHERE my_column ILIKE 'a%';		
|-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·  |

This query will select rows where my_column starts with the letter 'a', regardless of whether it's uppercase or lowercase.
Remember to replace my_table and my_column with your actual table and column names.


— #2
What does 'JOIN' do in postgres

A:
In PostgreSQL, as in many other relational database management systems (RDBMS), the JOIN clause is used to combine rows from two or more tables based on a related column between them. It allows you to retrieve data from multiple tables in a single query by specifying how the tables are related to each other.
There are different types of joins in PostgreSQL, including:
1. INNER JOIN: Returns only the rows where there is a match in both tables based on the join condition.
2. LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table and the matched rows from the right table. If there is no match, the result is NULL for the columns from the right table.
3. RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from the right table and the matched rows from the left table. If there is no match, the result is NULL for the columns from the left table.
4. FULL JOIN (or FULL OUTER JOIN): Returns all rows when there is a match in either the left or right table. If there is no match, the result is NULL for the columns from the table that lacks a matching row.
Here's a basic example of an INNER JOIN:
Let's say you have two tables: orders and customers. The orders table contains order information, and the customers table contains customer information. Both tables have a column customer_id that represents the ID of the customer who placed the order. You can join these tables to get a list of orders along with the corresponding customer information:

|-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-|
 SELECT orders.order_id, orders.order_date, customers.customer_name
 FROM orders
 INNER JOIN customers ON orders.customer_id = customers.customer_id;
|-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-·-|

In this query:
* INNER JOIN customers ON orders.customer_id = customers.customer_id specifies the join condition, which matches rows from the orders table with rows from the customers table where the customer_id values are equal.
* orders.order_id, orders.order_date, and customers.customer_name are the columns selected from the joined tables.
Remember, the type of join you use depends on the desired result and the relationship between the tables.

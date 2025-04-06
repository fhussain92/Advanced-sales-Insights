
CREATE DATABASE PROJECT;     -- CREATE A NEW DATABASE

--============================PROJECT: Advanced sales Insights - Unlocking Data Trends================================================

-- ◇ Q1: Find all orders shipped via 'Economy' mode with a total amount greater than ₹25,000.

SELECT * FROM Sales
WHERE Ship_Mode = 'Economy' AND Total_Amount > 25000;


-- ◇ Q2: Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.

SELECT * FROM Sales
WHERE Category = 'Technology' AND Country = 'Ireland' AND  Order_Date > '2020-01-01';


-- ◇ Q3: List the top 10 most profitable sales transactions in descending order.

SELECT TOP 10 * FROM Sales
ORDER BY Total_Amount DESC;


-- ◇ Q4: Find all customers whose name starts with 'J' and ends with 'n'.

SELECT * FROM Sales
WHERE Customer_Name LIKE '[J-N]%';


-- ◇  Q5: Retrieve all product names that contain 'Acco' anywhere in the name.

SELECT * FROM Sales
WHERE Product_Name LIKE '%Acco%';


-- ◇  Q6: Get the top 5 cities with the highest total sales amount.

SELECT TOP 5 City, MAX (Total_Amount) AS Total_Amount
FROM Sales
GROUP BY City
ORDER BY MAX (Total_Amount) DESC;


-- ◇ Q7: Display the second set of 10 records, including: Order_ID, City, Country, Region, Category, Total Amount

SELECT Order_ID, City, Country, Region, Category, Total_Amount 
FROM SALES
ORDER BY Order_ID 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;


-- ◇ Q8: Find the total revenue, average unit cost, and total number of orders.

SELECT SUM (Total_Amount) AS [total revenue]
FROM Sales;

SELECT AVG (Unit_Cost) AS [average unit cost]
FROM Sales;

SELECT COUNT (Order_ID) AS [total number of orders]
FROM Sales;


-- ◇ Q9: Get total sales per product category.

SELECT Category, SUM (Total_Amount) AS TOTAL_Sale                
FROM Sales
GROUP BY Category;


-- ◇ Q10: Find the number of orders placed by each customer.

SELECT Customer_Name, Count (Order_ID) AS [Order placed]             
FROM Sales
GROUP BY Customer_Name;


-- ◇ Q11: Get customers who have placed orders worth more than ₹50,000.

SELECT Customer_Name, Total_Amount FROM Sales
WHERE Total_Amount > 50000
ORDER BY Total_Amount DESC;


-- ◇ Q12: Rank products based on total sales using RANK().

SELECT Product_Name, Total_Amount, RANK() OVER (ORDER BY Total_Amount DESC) AS RANK_Products
FROM Sales;   


-- ◇ Q13: Find the top 5 customers by sales revenue using DENSE_RANK().

SELECT Top 5 Customer_Name, Total_Amount, DENSE_RANK() OVER (ORDER BY Total_Amount DESC) AS DENSE_RANK_POS
FROM Sales; 


-- ◇ Q14: Use a CTE to find the top 3 most sold product categories.

WITH RANKING_NUMBER AS      
(
SELECT Category, Total_Amount, DENSE_RANK() OVER (ORDER BY Total_Amount DESC) AS DENSE_RANK_POS
FROM Sales                         
)
SELECT * FROM RANKING_NUMBER
WHERE DENSE_RANK_POS = 3;


-- ◇ Q15: Use a CTE to find the top-selling product in each category.

WITH RANKING_NUMBER AS      
(
SELECT Category, Product_Name, Total_Amount, DENSE_RANK() OVER (ORDER BY Total_Amount DESC) AS DENSE_RANK_POS
FROM Sales                         
)
SELECT * FROM RANKING_NUMBER
WHERE DENSE_RANK_POS IN (1,2,4);


SELECT * FROM SALES;        -- CHECK ALL THE RECOREDS OF A TABLE





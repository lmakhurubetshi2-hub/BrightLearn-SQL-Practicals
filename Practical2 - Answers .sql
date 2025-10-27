--------------------------------------------------------------------------------------------------------------------------------
--1. INNER JOIN: Orders with Customer and Product Names
--Question:
--List all orders along with the customer name and product name.
--Expected Output Columns:
--• OrderID, OrderDate, CustomerName, ProductName, Quantity

SELECT A.orderid,
       A.orderdate,
       B.customername,
       C.productname,
       A.quantity
FROM practical2.shop.orders AS A
INNER JOIN practical2.shop.customers AS B 
ON A.customerid = B.customerid
INNER JOIN practical2.shop.products AS C
ON A.productid = C.productid

--------------------------------------------------------------------------------------------------------------------------------
--2. INNER JOIN: Customers Who Placed Orders
--Question:
--Which customers have placed at least one order?
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate

SELECT A.orderid,
       A.orderdate,
       B.customerid,
       B.customername,
       B.country,
       A.quantity     
FROM practical2.shop.orders AS A
INNER JOIN practical2.shop.customers AS B 
ON A.customerid = B.customerid
INNER JOIN practical2.shop.products AS C
ON A.productid = C.productid
WHERE quantity > 0;

--------------------------------------------------------------------------------------------------------------------------------
--3. LEFT JOIN: All Customers and Their Orders
--Question:
--List all customers and any orders they might have placed. Include customers who have not placed any orders.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT 
    B.customerID,
    B.customerName,
    B.country,
    A.orderID,
    A.orderDate,
    A.productID,
    A.quantity
FROM practical2.shop.customers AS B
LEFT JOIN practical2.shop.orders AS A
    ON A.customerID = B.customerID
--------------------------------------------------------------------------------------------------------------------------------
--4. LEFT JOIN: Product Order Count
--Question:
--List all products and how many times each was ordered (if any).
--Expected Output Columns:
--• ProductID, ProductName, TotalOrders (TotalOrders is the count of how many times the product appears in orders)

SELECT 
    C.productID,
    C.productName,
    COUNT(A.orderID) AS TotalOrders
FROM practical2.shop.products AS C
LEFT JOIN practical2.shop.orders AS A
    ON A.productID = C.productID
GROUP BY C.productID, C.productName;
--------------------------------------------------------------------------------------------------------------------------------
--5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)
--Question:Find all orders along with product details, including any products that might not have been ordered.
--Expected Output Columns:
--• OrderID, OrderDate, ProductID, ProductName, Price, Quantity

SELECT 
    A.orderID,
    A.orderDate,
    C.productID,
    C.productName,
    C.price,
    A.quantity
FROM practical2.shop.orders AS A
RIGHT JOIN practical2.shop.products AS C
    ON A.productID = C.productID;
--------------------------------------------------------------------------------------------------------------------------------
--6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
--Question: Which customers have made orders, and include customers even if they have never placed an order.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT B.customerID, 
       B.customerName, 
       B.country,
       A.orderID, 
       A.orderDate, 
       A.productID, 
       A.quantity
FROM practical2.shop.orders AS A
RIGHT JOIN  practical2.shop.customers AS B 
ON A.customerid = B.customerid

--------------------------------------------------------------------------------------------------------------------------------
--7.FULL OUTER JOIN: All Customers and All Orders
--Question: List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT B.customerID, 
       B.customerName, 
       B.country,
       A.orderID, 
       A.orderDate, 
       A.productID, 
       A.quantity
FROM practical2.shop.orders AS A
FULL OUTER JOIN  practical2.shop.customers AS B 
ON A.customerid = B.customerid

--------------------------------------------------------------------------------------------------------------------------------
--8. FULL OUTER JOIN: All Products and Orders
--Question:List all products and orders, showing NULLs where products were never ordered or orders are missing product info.
--Expected Output Columns:
--• ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

SELECT 
    C.productID,
    C.productName,
    C.price,
    A.orderID,
    A.orderDate,
    A.customerID,
    A.quantity
FROM practical2.shop.products AS C
FULL OUTER JOIN practical2.shop.orders AS A
    ON A.productID = C.productID;

--------------------------------------------------------------------------------------------------------------------------------

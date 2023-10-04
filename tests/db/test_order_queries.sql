-- Database Unit Test: Order Queries

-- Test Case 1: Retrieve orders for a specific customer
SELECT * FROM Orders WHERE customer_id = 1;

-- Test Case 2: Calculate the total order amount for a customer
SELECT customer_id, SUM(total_amount) AS total_order_amount
FROM Orders
GROUP BY customer_id;

-- Test Case 3: Find orders placed on a specific date
SELECT * FROM Orders WHERE order_date = '2023-09-02';

-- Database Unit Test: Product Queries

-- Test Case 1: Retrieve product by ID
SELECT * FROM Products WHERE product_id = 1;

-- Test Case 2: Retrieve products by price range
SELECT * FROM Products WHERE price BETWEEN 20.00 AND 30.00;

-- Test Case 3: Count the total number of products
SELECT COUNT(*) FROM Products;

-- Seed data script to populate initial data

-- Insert some sample products
INSERT INTO Products (product_name, description, price)
VALUES
    ('Product A', 'Description of Product A', 19.99),
    ('Product B', 'Description of Product B', 24.99),
    ('Product C', 'Description of Product C', 14.99);

-- Insert some sample orders
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
    (1, '2023-09-01', 49.98),
    (2, '2023-09-02', 39.97),
    (3, '2023-09-03', 59.96);

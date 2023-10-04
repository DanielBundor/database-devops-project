-- Migration script to create the "Products" table

-- Create the table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
    CREATE TABLE Products (
        product_id INT PRIMARY KEY IDENTITY(1,1),
        product_name VARCHAR(255) NOT NULL,
        description TEXT,
        price DECIMAL(10, 2) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    -- Create a trigger for updating the "updated_at" column
    CREATE TRIGGER tr_Products_Update
    ON Products
    AFTER UPDATE
    AS
    BEGIN
        UPDATE Products
        SET updated_at = CURRENT_TIMESTAMP
        FROM Products
        INNER JOIN inserted ON Products.product_id = inserted.product_id;
    END;
END;

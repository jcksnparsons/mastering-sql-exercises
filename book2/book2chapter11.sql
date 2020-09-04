-- What are the top 5 US states with the most customers who have purchased a vehicle from a dealership participating in the Carnival platform?
SELECT
    d.state,
    COUNT(s.sale_id) as num_of_sales
FROM
    Dealerships d
    JOIN Sales s ON d.dealership_id = s.dealership_id
GROUP BY
    d.state
ORDER BY
    num_of_sales DESC
LIMIT
    5;

-- What are the top 5 US zipcodes with the most customers who have purchased a vehicle from a dealership participating in the Carnival platform?
WITH CustomersByState AS (
    SELECT
        COUNT(s.sale_id) as num_of_sales,
        c.customer_id
    FROM
        Sales s
        JOIN Customers c ON s.customer_id = c.customer_id
    GROUP BY
        c.customer_id
)
SELECT
    c.zipcode,
    COUNT(cs.num_of_sales) AS num_of_sales
FROM
    Customers c
    JOIN CustomersByState cs ON c.customer_id = cs.customer_id
GROUP BY
    c.zipcode
ORDER BY
    num_of_sales DESC
LIMIT
    5;

-- What are the top 5 dealerships with the most customers?
SELECT
    d.business_name,
    COUNT(c.customer_id) as num_of_customers
FROM
    Dealerships d
    JOIN Sales s ON d.dealership_id = s.dealership_id
    JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY
    d.business_name
ORDER BY
    num_of_customers DESC
LIMIT
    5;
-- Write a query that shows the total purchase sales income per dealership.
SELECT
    d.business_name,
    SUM(s.price) AS total_purchase
FROM
    Dealerships d
    JOIN Sales s ON d.dealership_id = s.dealership_id
WHERE
    s.sales_type_id = 1
GROUP BY
    d.business_name;

-- Write a query that shows the purchase sales income per dealership for the current month.
SELECT
    d.business_name,
    SUM(s.price) AS purchase_this_month
FROM
    Dealerships d
    JOIN Sales s ON d.dealership_id = s.dealership_id
WHERE
    EXTRACT(
        MONTH
        FROM
            s.purchase_date
    ) = EXTRACT(
        MONTH
        FROM
            CURRENT_DATE
    )
    AND EXTRACT(
        YEAR
        FROM
            s.purchase_date
    ) = EXTRACT(
        YEAR
        FROM
            CURRENT_DATE
    )
    AND s.sales_type_id = 1
GROUP BY
    d.business_name;

-- Write a query that shows the purchase sales income per dealership for the current year.
SELECT
    d.business_name,
    SUM(s.price) AS purchase_this_year
FROM
    Sales s
    LEFT JOIN Dealerships d ON d.dealership_id = s.dealership_id
WHERE
    EXTRACT(
        YEAR
        FROM
            s.purchase_date
    ) = EXTRACT(
        YEAR
        FROM
            CURRENT_DATE
    )
    AND s.sales_type_id = 1
GROUP BY
    d.business_name;

-- Write a query that shows the total lease income per dealership.
SELECT
    d.business_name,
    SUM(s.price) AS total_lease
FROM
    Dealerships d
    JOIN Sales s ON d.dealership_id = s.dealership_id
WHERE
    s.sales_type_id = 2
GROUP BY
    d.business_name;

-- Write a query that shows the lease income per dealership for the current month.
SELECT
    d.business_name,
    SUM(s.price) AS lease_this_month
FROM
    Dealerships d
    JOIN Sales s ON d.dealership_id = s.dealership_id
WHERE
    EXTRACT(
        MONTH
        FROM
            s.purchase_date
    ) = EXTRACT(
        MONTH
        FROM
            CURRENT_DATE
    )
    AND EXTRACT(
        YEAR
        FROM
            s.purchase_date
    ) = EXTRACT(
        YEAR
        FROM
            CURRENT_DATE
    )
    AND s.sales_type_id = 2
GROUP BY
    d.business_name;

-- Write a query that shows the lease income per dealership for the current year.
SELECT
    d.business_name,
    SUM(s.price) AS lease_this_year
FROM
    Sales s
    LEFT JOIN Dealerships d ON d.dealership_id = s.dealership_id
WHERE
    EXTRACT(
        YEAR
        FROM
            s.purchase_date
    ) = EXTRACT(
        YEAR
        FROM
            CURRENT_DATE
    )
    AND s.sales_type_id = 2
GROUP BY
    d.business_name;

-- Write a query that shows the total income (purchase and lease) per employee.
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee,
    SUM(s.price) AS total_sales
FROM
    Employees e
    LEFT JOIN Sales s ON e.employee_id = s.employee_id
GROUP BY
    employee;
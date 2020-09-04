-- How many employees are there for each role?
SELECT
    et.name,
    COUNT(e.employee_type_id)
FROM
    Employees e
    JOIN EmployeeTypes et ON e.employee_type_id = et.employee_type_id
GROUP BY
    et.name;

-- How many finance managers work at each dealership?
SELECT
    d.business_name,
    COUNT(e.employee_type_id) as num_of_finance
FROM
    Dealerships d
    JOIN DealershipEmployees de ON d.dealership_id = de.dealership_id
    JOIN Employees e ON de.employee_id = e.employee_id
WHERE
    e.employee_type_id = 2
GROUP BY
    d.business_name;

-- Get the names of the top 3 employees who work shifts at the most dealerships?
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee,
    COUNT(de.dealership_employee_id) as num_of_dealerships
FROM
    Employees e
    JOIN DealershipEmployees de ON e.employee_id = de.employee_id
GROUP BY
    employee
ORDER BY
    num_of_dealerships DESC
LIMIT
    3;

-- Get a report on the top two employees who has made the most sales through leasing vehicles.
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee,
    COUNT(s.sale_id) as num_of_leases
FROM
    Employees e
    JOIN Sales s ON e.employee_id = s.employee_id
WHERE
    s.sales_type_id = 2
GROUP BY
    employee
ORDER BY
    num_of_leases DESC
LIMIT
    2;
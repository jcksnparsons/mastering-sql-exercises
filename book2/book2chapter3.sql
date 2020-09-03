--Get a list of the sales that was made for each sales type.
SELECT
    s.invoice_number,
    st.name AS sales_type
FROM
    Sales s
    JOIN salestypes st ON s.sales_type_id = st.sales_type_id;

--Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, first name and last name of the employee who made the sale and the name, city and state of the dealership.
SELECT
    s.invoice_number,
    v.vin,
    c.first_name,
    c.last_name,
    e.first_name,
    e.last_name,
    d.business_name,
    d.city,
    d.state
FROM
    Sales s
    JOIN Vehicles v ON s.vehicle_id = v.vehicle_id
    JOIN Customers c ON s.customer_id = c.customer_id
    JOIN Employees e ON s.employee_id = e.employee_id
    JOIN Dealerships d ON s.dealership_id = d.dealership_id;

--Get a list of all the dealerships and the employees, if any, working at each one.
SELECT
    d.business_name,
    e.first_name,
    e.last_name
FROM
    Dealerships d
    LEFT JOIN DealershipEmployees de ON d.dealership_id = de.dealership_id
    LEFT JOIN Employees e ON de.employee_id = e.employee_id
ORDER BY
    d.business_name;

--Get a list of vehicles with the names of the body type, make, model and color.
SELECT
    v.vehicle_id,
    vb.name AS body_type,
    vma.name AS make,
    vmo.name as model,
    v.exterior_color
FROM
    Vehicles v
    JOIN VehicleTypes vt ON v.vehicle_type_id = vt.vehicle_type_id
    JOIN VehicleBodyTypes vb ON vt.body_type_id = vb.vehicle_body_type_id
    JOIN VehicleMakes vma ON vt.make_id = vma.vehicle_make_id
    JOIN VehicleModels vmo ON vt.model_id = vmo.vehicle_model_id;
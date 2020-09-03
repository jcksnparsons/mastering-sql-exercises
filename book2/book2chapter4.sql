--Produce a report that lists every dealership, the number of purchases done by each, and the number of leases done by each.
SELECT
	d.business_name,
	st.name,
	COUNT(s.sale_id) AS num_of_sales
FROM
	dealerships d
	JOIN sales s on d.dealership_id = s.dealership_id
	JOIN salestypes st ON s.sales_type_id = st.sales_type_id
GROUP BY
	d.dealership_id,
	st.sales_type_id
ORDER BY
	d.dealership_id;

--Produce a report that determines the most popular vehicle model that is leased.
SELECT
	vmo.name,
	COUNT(s.sale_id) AS lease_count
FROM
	sales s
	JOIN Vehicles v On s.vehicle_id = v.vehicle_id
	JOIN VehicleTypes vt ON v.vehicle_type_id = vt.vehicle_type_id
	JOIN VehicleModels vmo ON vt.model_id = vmo.vehicle_model_id
WHERE
	s.sales_type_id = 2
GROUP BY
	vmo.vehicle_model_id
ORDER BY
	COUNT(s.sale_id) DESC;

--What is the most popular vehicle make in terms of number of sales?
SELECT
	vma.name,
	COUNT(s.sale_id)
FROM
	sales s
	JOIN vehicles v ON s.vehicle_id = v.vehicle_id
	JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
	JOIN vehiclemakes vma ON vt.make_id = vma.vehicle_make_id
GROUP BY
	vma.vehicle_make_id
ORDER BY
	COUNT(s.sale_id) DESC
LIMIT
	1;

--Which employee type sold the most of that make?
SELECT
	et.name,
	COUNT(s.sale_id)
FROM
	sales s
	JOIN employees e on s.employee_id = e.employee_id
	JOIN employeetypes et ON e.employee_type_id = et.employee_type_id
	JOIN vehicles v ON s.vehicle_id = v.vehicle_id
	JOIN vehicletypes vt on v.vehicle_type_id = vt.vehicle_type_id
	JOIN vehiclemakes vm on vt.make_id = vm.vehicle_make_id
WHERE
	vm.vehicle_make_id = (
		SELECT
			vma.vehicle_make_id
		FROM
			sales s
			JOIN vehicles v ON s.vehicle_id = v.vehicle_id
			JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
			JOIN vehiclemakes vma ON vt.make_id = vma.vehicle_make_id
		GROUP BY
			vma.vehicle_make_id
		ORDER BY
			COUNT(s.sale_id) DESC
		LIMIT
			1
	)
GROUP BY
	et.employee_type_id
ORDER BY
	COUNT(s.sale_id) DESC;

;
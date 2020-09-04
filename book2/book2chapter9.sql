-- Which model of vehicle has the lowest current inventory? This will help dealerships know which models the purchase from manufacturers.
SELECT
    vm.name AS model,
    COUNT(v.vehicle_id) AS inventory_count
FROM
    Vehicles v
    JOIN VehicleTypes vt ON v.vehicle_type_id = vt.vehicle_type_id
    JOIN VehicleModels vm ON vt.model_id = vm.vehicle_model_id
GROUP BY
    model
ORDER BY
    inventory_count
LIMIT
    1;

-- Which model of vehicle has the highest current inventory? This will help dealerships know which models are, perhaps, not selling.
SELECT
    vm.name AS model,
    COUNT(v.vehicle_id) AS inventory_count
FROM
    Vehicles v
    JOIN VehicleTypes vt ON v.vehicle_type_id = vt.vehicle_type_id
    JOIN VehicleModels vm ON vt.model_id = vm.vehicle_model_id
GROUP BY
    model
ORDER BY
    inventory_count
LIMIT
    1;

-- Which dealerships are currently selling the least number of vehicle models? This will let dealerships market vehicle models more effectively per region.
SELECT
    d.business_name,
    COUNT(v.vehicle_type_id) as num_of_models
FROM
    Dealerships d
    JOIN Sales s ON d.dealership_id = s.dealership_id
    JOIN Vehicles v ON s.vehicle_id = v.vehicle_id
GROUP BY
    d.business_name
ORDER BY
    num_of_models;

-- Which dealerships are currently selling the highest number of vehicle models? This will let dealerships know which regions have either a high population, or less brand loyalty.
SELECT
    d.business_name,
    COUNT(v.vehicle_type_id) as num_of_models
FROM
    Dealerships d
    JOIN Sales s ON d.dealership_id = s.dealership_id
    JOIN Vehicles v ON s.vehicle_id = v.vehicle_id
GROUP BY
    d.business_name
ORDER BY
    num_of_models DESC;
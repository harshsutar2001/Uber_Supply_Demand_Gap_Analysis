create database uber_project;

use uber_project;
go 

select*
from [uber_data.csv];

--1] Total Ride Requests

SELECT COUNT(*) AS total_requests
FROM [uber_data.csv]

--Insight: Shows the total number of ride requests received.

--2] 2. Trip Status Distribution

select status,count(*) as total_count 
from [uber_data.csv] 
group by  Status
order by total_count desc;

--Insight: Displays completed, cancelled, and failed trips.Helps evaluate Uber’s service performance.

--3] Peak Time Slot Analysis
SELECT Time_slot,
       COUNT(*) AS total_requests
FROM [uber_data.csv]
GROUP BY Time_slot
ORDER BY total_requests DESC;

--Insight: Identifies the busiest time slots. Useful for demand forecasting.

--4]Driver Cancellation Analysis
SELECT Time_slot,
       COUNT(*) AS cancelled_rides
FROM [uber_data.csv]
WHERE Status = 'Cancelled'
GROUP BY Time_slot
ORDER BY cancelled_rides DESC;

--Insight: Shows when drivers cancel rides the most.Helps identify operational issues.

--5]No Cars Availability Analysis 

SELECT Time_slot,
       COUNT(*) AS no_cars_count
FROM [uber_data.csv]
WHERE Status = 'No Cars Available'
GROUP BY Time_slot
ORDER BY no_cars_count DESC;

--Insight: Detects supply shortages across time slots.Indicates periods with insufficient drivers.

--6]Pickup Point Demand Analysis

SELECT [Pickup_point],
       COUNT(*) AS total_requests
FROM [uber_data.csv]
GROUP BY [Pickup_point];

--Insight: Compares demand between Airport and City.Helps understand location-based demand patterns.

--7]Airport Ride Failure Analysis

SELECT Status,
       COUNT(*) AS total_requests
FROM [uber_data.csv]
WHERE [Pickup_point] = 'Airport'
GROUP BY Status;

--Insight: Identifies major ride issues at the airport. Helps improve airport ride operations.

--8]Hourly Ride Request Analysis

SELECT Pick_up_Hour,
       COUNT(*) AS total_requests
FROM [uber_data.csv]
GROUP BY Pick_up_Hour
ORDER BY total_requests DESC;

--Insight:Shows exact peak demand hours. Useful for driver allocation planning.

--9]Completion Rate by Time Slot

SELECT Time_slot,
       ROUND(
           SUM(CASE WHEN Status = 'Trip Completed' THEN 1 ELSE 0 END) * 100.0
           / COUNT(*), 2
       ) AS completion_rate
FROM [uber_data.csv]
GROUP BY Time_slot;

--Insight:Measures service efficiency in each time slot. Lower completion rates indicate operational problems.

--10] Demand vs Failed Requests Analysis

SELECT Time_slot,
       COUNT(*) AS total_requests,
       SUM(
           CASE 
               WHEN Status IN ('Cancelled', 'No Cars Available')
               THEN 1
               ELSE 0
           END
       ) AS failed_requests
FROM [uber_data.csv]
GROUP BY Time_slot
ORDER BY failed_requests DESC;

--Insight: Clearly highlights the demand-supply gap.Helps identify critical time slots needing more drivers.

--Recommendations
--Increase Driver Availability During Night Hours
--Introduce Early Morning Bonus Programs
--Improve Airport Cab Allocation
--Implement Dynamic Pricing During Peak Hours
--Use Predictive Demand Forecasting
--Improve Customer Experience During Failed Requests
--Launch Peak Hour Driver Campaigns

 
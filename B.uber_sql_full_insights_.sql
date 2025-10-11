--UBER DEMAND GAP SUPPLY --
-- 1️⃣ Create Table
CREATE TABLE UberRides (
    RequestID INT,
    PickupPoint VARCHAR(50),
    DriverID INT,
    Status VARCHAR(20),
    RequestTimestamp DATETIME,
    DropTimestamp DATETIME,
    Hour INT,
    Timeslot VARCHAR(20),
    CancelledFlag INT,
    NoCarsAvailable INT
);

-- 2️⃣ Import CSV using LOCAL (client machine path with spaces)
LOAD DATA LOCAL INFILE 'C:/Users/Admin/OneDrive/Desktop/new project no 3/Uber Demand.csv'
INTO TABLE UberRides
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 3️⃣ Total Rides per Timeslot
SELECT Timeslot, COUNT(*) AS TotalRides
FROM UberRides
WHERE Timeslot <> '#VALUE!'
GROUP BY Timeslot
ORDER BY Timeslot;
-- Insight: Kaunsa timeslot sabse zyada busy hai

-- 4️⃣ Cancelled Rides per Timeslot
SELECT Timeslot, SUM(CancelledFlag) AS CancelledRides
FROM UberRides
WHERE Timeslot <> '#VALUE!'
GROUP BY Timeslot
ORDER BY Timeslot;
-- Insight: Kaunsa time pe cancellations zyada ho rahe hain

-- 5️⃣ No Cars Available per Timeslot
SELECT Timeslot, SUM(NoCarsAvailable) AS NoCars
FROM UberRides
WHERE Timeslot <> '#VALUE!'
GROUP BY Timeslot
ORDER BY Timeslot;
-- Insight: Kis timeslot me supply shortage sabse zyada hai

-- 6️⃣ Cancellation Percentage per Timeslot
SELECT Timeslot,
       COUNT(*) AS TotalRides,
       SUM(CancelledFlag) AS CancelledRides,
       ROUND((SUM(CancelledFlag)/COUNT(*))*100,2) AS CancelPercent
FROM UberRides
WHERE Timeslot <> '#VALUE!'
GROUP BY Timeslot
ORDER BY Timeslot;
-- Insight: Early morning & night timeslot me cancellation % high → supply-demand gap

-- 7️⃣ Supply-Demand Gap per Timeslot
SELECT Timeslot,
       COUNT(*) AS TotalRides,
       SUM(NoCarsAvailable) AS CarsUnavailable,
       COUNT(*) - SUM(NoCarsAvailable) AS SupplyDemandGap
FROM UberRides
WHERE Timeslot <> '#VALUE!'
GROUP BY Timeslot
ORDER BY Timeslot;
-- Insight: Night & early morning → high gap → cab shortage; Afternoon → gap low → balance
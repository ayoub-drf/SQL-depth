
select current_database();

CREATE DATABASE sfpolice;

# \c sfpolice

CREATE TABLE police_incident_reports (
    PdId BIGINT,
    IncidntNum VARCHAR(10),
    "Incident Code" VARCHAR(10),
    Category VARCHAR(50),
    Descript VARCHAR(100),
    DayOfWeek VARCHAR(10),
    Date DATE,
    Time TIME,
    PdDistrict VARCHAR(10),
    Resolution VARCHAR(50),
    Address VARCHAR(100),
    X NUMERIC(15, 12),
    Y NUMERIC(15, 12),
    location VARCHAR(100),
    "SF Find Neighborhoods 2 2" INT,
    "Current Police Districts 2 2" INT,
    "Current Supervisor Districts 2 2" INT,
    "Analysis Neighborhoods 2 2" INT,
    "DELETE - Fire Prevention Districts 2 2" INT,
    "DELETE - Police Districts 2 2" INT,
    "DELETE - Supervisor Districts 2 2" INT,
    "DELETE - Zip Codes 2 2" INT,
    "DELETE - Neighborhoods 2 2" INT,
    "DELETE - 2017 Fix It Zones 2 2" INT,
    "Civic Center Harm Reduction Project Boundary 2 2" INT,
    "Fix It Zones as of 2017-11-06 2 2" INT,
    "DELETE - HSOC Zones 2 2" INT,
    "Fix It Zones as of 2018-02-07 2 2" INT,
    "CBD, BID and GBD Boundaries as of 2017 2 2" INT,
    "Areas of Vulnerability, 2016 2 2" INT,
    "Central Market/Tenderloin Boundary 2 2" INT,
    "Central Market/Tenderloin Boundary Polygon - Updated 2 2" INT,
    "HSOC Zones as of 2018-06-05 2 2" INT,
    "OWED Public Spaces 2 2" INT,
    "Neighborhoods 2" INT
);

# \COPY police_incident_reports FROM '/usr/databases/Police_Department_Incident_Reports__Historical_2003_to_May_2018.csv' CSV HEADER;


SELECT 
	pdid, 
	incidntnum, 
	'Incident Code', 
	category, 
	descript, 
	dayofweek, 
	date, 
	time, 
	pddistrict, 
	resolution, 
	address, 
	x, 
	y, 
	location
FROM "police_incident_reports" LIMIT 10;


SELECT 
    DATE_PART('year', max(date)),
    DATE_PART('year', min(date))  
FROM "police_incident_reports";

SELECT "Neighborhoods 2" AS Neighborhood, COUNT(*) AS incidents_count
FROM police_incident_reports GROUP BY "Neighborhoods 2" order by COUNT(*) DESC;


SELECT 
    MAX(s.incidents_count) AS maximum_incidents,
    MIN(s.incidents_count) AS minimum_incidents,
    ROUND(AVG(s.incidents_count)) AS average_incidents
FROM (SELECT "Neighborhoods 2" AS Neighborhood, COUNT(*) AS incidents_count
    FROM police_incident_reports GROUP BY "Neighborhoods 2" order by COUNT(*) DESC) s;


CREATE OR REPLACE FUNCTION maximum_number_of_incidents()
RETURNS BIGINT
AS $$
DECLARE 
    maximum BIGINT := 0;
BEGIN
    SELECT MAX(result.incidents_count) INTO maximum
    FROM (
        SELECT "Neighborhoods 2" AS Neighborhood, COUNT(*) AS incidents_count
        FROM police_incident_reports
        GROUP BY Neighborhood
    ) result;

    RETURN maximum;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION average_number_of_incidents()
RETURNS BIGINT
AS $$
DECLARE 
    average BIGINT := 0;
BEGIN
    SELECT AVG(result.incidents_count) INTO average
    FROM (
        SELECT "Neighborhoods 2" AS Neighborhood, COUNT(*) AS incidents_count
        FROM police_incident_reports
        GROUP BY Neighborhood
    ) result;

    RETURN average;
END;
$$ LANGUAGE plpgsql;

select average_number_of_incidents();



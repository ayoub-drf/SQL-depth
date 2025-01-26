# Assigns a unique, sequential number to each row 
SELECT 
    pdid, category, date,
    ROW_NUMBER() OVER (ORDER BY date DESC) AS rank
FROM police_incident_reports;

SELECT incidntnum, ROW_NUMBER() OVER (ORDER BY incidntnum ASC) FROM police_incident_reports;


# if there are date with the same value assign the same rank to the both and skip the next rank 
SELECT 
    pdid, category, date,
    RANK() OVER (ORDER BY date DESC) AS rank
FROM police_incident_reports;

# if there are date with the same value assign the same rank to the both and do not skip the next rank 
SELECT 
    pdid, category, date,
    DENSE_RANK() OVER (ORDER BY date DESC) AS rank
FROM police_incident_reports;


SELECT category, date, MAX(date) over() as max_date, MIN(date) over() as min_date FROM police_incident_reports ORDER BY date DESC;

-- how many incidntnum for each category
SELECT category, count(incidntnum) over(PARTITION BY category) FROM police_incident_reports;


SELECT category, count(incidntnum) OVER(PARTITION BY category), count(incidntnum) over(PARTITION BY category ORDER BY pdid) FROM police_incident_reports;


SELECT category, incidntnum, 
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY pdid) AS row_num
    FROM police_incident_reports;
WITH ranked_incidents AS (
    SELECT category, incidntnum, 
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY pdid) AS row_num
    FROM police_incident_reports
)
SELECT category, incidntnum
FROM ranked_incidents
WHERE row_num <= 3;



SELECT * FROM police_incident_reports ORDER BY date DESC;

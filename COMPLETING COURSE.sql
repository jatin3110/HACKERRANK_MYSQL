# Revising Aggregations - The Count Function
# Query a count of the number of cities in CITY having a Population larger than .

SELECT     
    COUNT(NAME)
FROM CITY
WHERE POPULATION>100000;

# Revising Aggregations - The Sum Function
# Query the total population of all cities in CITY where District is California.

SELECT 
    SUM(POPULATION)
FROM CITY
WHERE DISTRICT='CALIFORNIA';

# Revising Aggregations - Averages
# Query the average population of all cities in CITY where District is California.

SELECT 
    AVG(POPULATION)
FROM CITY
WHERE DISTRICT='CALIFORNIA';



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

# Asian Population
# Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

SELECT SUM(city.population)
FROM city
INNER JOIN country ON city.countrycode = country.code
WHERE country.continent = 'Asia'

#African Cities
# Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

SELECT city.name
FROM city
INNER JOIN country ON city.countrycode = country.code
WHERE country.continent = 'Africa';

# Japan Population
# Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT 
    SUM(POPULATION)
        FROM CITY
            WHERE COUNTRYCODE = 'JPN';

# Population Density Difference
# Query the difference between the maximum and minimum populations in CITY.

SELECT
    MAX(POPULATION) - MIN(POPULATION) 
        FROM CITY;
        
# The Blunder

# Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.

# Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

select 
    round(avg(salary) - avg(replace(salary,'0',''))) + 1
from employees;

# Top Earners
# We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

  
select
    (months * salary) as earnings, 
    count(*)
from employee
group by 1 
order by 1 desc 
limit 1;

# Weather Observation Station 2
# Query the following two values from the STATION table:

# The sum of all values in LAT_N rounded to a scale of  decimal places.
# The sum of all values in LONG_W rounded to a scale of  decimal places.

SELECT 
    ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2) 
FROM STATION;

# Weather Observation Station 13
# Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.

SELECT
    ROUND(SUM(LAT_N),4)
FROM STATION 
WHERE LAT_N>38.7880 AND LAT_N< 137.2345;

# Weather Observation Station 14
# Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.

# Input Format

# The STATION table is described as follows:

SELECT 
    ROUND(MAX(LAT_N),4)
FROM STATION
WHERE LAT_N< 137.2345;

# Weather Observation Station 15
# Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places.

SELECT 
    ROUND(MAX(LONG_W),4) 
FROM STATION
WHERE
    LAT_N = (SELECT MAX(LAT_N) FROM Station WHERE LAT_N < 137.2345);
    
    
# Weather Observation Station 16
# Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to  decimal places.

SELECT 
    ROUND(MIN(LAT_N),4)
FROM STATION 
WHERE LAT_N > 38.7780;


# Weather Observation Station 17
# Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.

SELECT 
    ROUND(LONG_W,4)
FROM STATION
WHERE 
LAT_N=(SELECT MIN(LAT_N) FROM STATION  WHERE LAT_N > 38.7780);

# Weather Observation Station 20
# A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

select 

round(sta.lat_n, 4) 

from station as sta 

where 

(select count(lat_n) from station where lat_n < sta.lat_n) = (select count(lat_n) from station where lat_n > sta.lat_n);

# Top Competitors
# Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

SELECT h.hacker_id, h.name
FROM submissions s
INNER JOIN challenges c ON s.challenge_id = c.challenge_id
INNER JOIN hackers h ON s.hacker_id = h.hacker_id
INNER JOIN difficulty d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(h.hacker_id) > 1
ORDER BY COUNT(h.hacker_id) DESC, h.hacker_id ASC;

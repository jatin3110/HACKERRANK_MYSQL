# Weather Observation Station 11

# Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

# Input Format

# The STATION table is described as follows:

# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude.

select
    distinct city
        from station 
            where NOT( left(city,1) in('a','e','i','o','u') and right(city,1) in('a','e','i','o','u'));
            
            
# Weather Observation Station 12

# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

# Input Format

# The STATION table is described as follows:

# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude.

select 
    distinct city 
        from station 
            where
                left(city,1) not in('a','e','i','o','u') and right(city,1) not in('a','e','i','o','u');
                
                
# Higher Than 75 Marks

# Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

# Input Format

# The STUDENTS table is described as follows:  The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

SELECT 
    NAME
        FROM STUDENTS
            WHERE MARKS>75
                ORDER BY RIGHT(NAME,3),ID ASC;
                
 # Employee Names
# Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

# Input Format

# The Employee table containing employee data for a company is described as follows:

# where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

SELECT
    NAME    
        FROM EMPLOYEE 
            ORDER BY NAME ASC;
            
            
# Employee Salaries

# Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.

# Input Format

# The Employee table containing employee data for a company is described as follows:

# where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is the their monthly salary.
               
SELECT name 
    FROM employee   
        WHERE 
            salary > 2000 AND months < 10 
                ORDER BY employee_id;    
                                                                                 
# Weather Observation Station 18
                                                                                 
 #Consider  and  to be two points on a 2D plane.

# happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
# happens to equal the minimum value in Western Longitude (LONG_W in STATION).
# happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
# happens to equal the maximum value in Western Longitude (LONG_W in STATION).
# Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.

# Input Format

# The STATION table is described as follows:

# where LAT_N is the northern latitude and LONG_W is the western longitude.
                                                                                 
select 
    Round(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)),4)
        FROM STATION;                                                                                 

# Weather Observation Station 19
# Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

# Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.

# Input Format

# The STATION table is described as follows:
                                             

SELECT
    ROUND(SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2)+POWER(MAX(LONG_W)-MIN(LONG_W),2)),4)
FROM STATION;

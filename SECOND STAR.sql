# Weather Observation Station 4

# Let N be the number of CITY entries in STATION, and let N’ be the number of distinct CITY names in STATION; query the value of N-N’ from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
# Input Format
# The STATION table is described as follows:
# Image for post
# where LAT_N is the northern latitude and LONG_W is the western longitude.
# SELECT COU

SELECT 
    COUNT(CITY) — COUNT(DISTINCT CITY) 
        FROM STATION ;
        
        
# Weather Observation Station 5

# Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
# The STATION table is described as follows:

# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude.

# Sample Input

# For example, CITY has four entries: DEF, ABC, PQRS and WXY.

SELECT * 
    FROM (SELECT DISTINCT city, LENGTH(city)    
          FROM station 
              ORDER BY LENGTH(city) ASC, city ASC)
                  WHERE ROWNUM = 1
 UNION
 
SELECT *
    FROM (SELECT DISTINCT city, LENGTH(city)
              FROM station     
                  ORDER BY LENGTH(city) DESC, city ASC)
                      WHERE ROWNUM = 1;
                      
                      
# Weather Observation Station 6

# Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

# Input Format

# The STATION table is described as follows:

# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude.

SELECT 
    DISTINCT CITY
        FROM STATION
            WHERE 
                CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE  'O%' OR CITY LIKE  'U%';
                
# Weather Observation Station 7

# Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

# Input Format

# The STATION table is described as follows:

# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude.

SELECT 
    DISTINCT city 
        FROM station
            WHERE city LIKE "%a" OR city LIKE "%e" OR city LIKE "%i" OR city LIKE "%o" OR city LIKE "%u";
            
            
# Weather Observation Station 8

# Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

# Input Format

# The STATION table is described as follows:

# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude.

select
    distinct city
        from station 
            where left(city,1) in('a','e','i','o','u') and right(city,1) in('a','e','i','o','u');
            
# Weather Observation Station 9

# Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

# Input Format

# The STATION table is described as follows:

# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude

SELECT 
    DISTINCT CITY
        FROM STATION
            WHERE NOT( 
                CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE  'O%' OR CITY LIKE  'U%');
                
# Weather Observation Station 10

# Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

# Input Format

# The STATION table is described as follows:

# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude.


select 
    distinct(city)    
        from station where
            city not like "%a" and
            city not like "%e" and    
            city not like "%i" and
            city not like "%o" and
            city not like "%u";
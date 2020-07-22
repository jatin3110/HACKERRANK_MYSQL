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
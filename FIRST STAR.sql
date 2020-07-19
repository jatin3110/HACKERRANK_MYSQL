# Revising the select query I

# Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.
# Input Format
# The CITY table is described as follows:


SELECT * 
    FROM CITY 
        WHERE 
            POPULATION>100000 && CountryCode='USA';
            
            
# Revising the select query II            

# Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

# The CITY table is described as follows:
# CITY.jpg

SELECT NAME 
    FROM CITY 
        WHERE 
            POPULATION>120000 && Countrycode='USA';
            
# SELECT ALL

# Query all columns (attributes) for every row in the CITY table.

# The CITY table is described as follows:
# CITY.jpg


SELECT * 
    FROM CITY;
    
    
    
    # Select by ID's
    
    # Query all columns for a city in CITY with the ID 1661.

# The CITY table is described as follows:
# CITY.jpg


SELECT * 
    FROM CITY 
        WHERE ID= 1661;
        
# Japanese City Attributes        

# Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

# The CITY table is described as follows:
# CITY.jpg


SELECT *
    FROM CITY
        WHERE COUNTRYCODE='JPN';
        
            
# Japanese Cities' Names

# Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
# The CITY table is described as follows:

SELECT NAME 
    FROM CITY 
        WHERE 
            COUNTRYCODE='JPN';
            
# Weather Observation Station 1

# Query a list of CITY and STATE from the STATION table.
# The STATION table is described as follows:
# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude.


SELECT CITY, STATE 
    FROM STATION;
    
    
# Weather Observation Station 3 

# Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
# The STATION table is described as follows:

# Station.jpg

# where LAT_N is the northern latitude and LONG_W is the western longitude.
    
    
    SELECT 
        DISTINCT CITY 
            FROM STATION 
                WHERE MOD(ID,2)=0;
                


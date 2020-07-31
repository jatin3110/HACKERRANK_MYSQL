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


# Average Population of Each Continent
#Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

SELECT country.continent, floor(AVG(city.population))
FROM city
INNER JOIN country ON city.countrycode = country.code
GROUP BY country.continent;

# The Report
# Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

                                    
SELECT IF(g.grade >= 8, s.name, NULL), g.grade, s.marks
FROM students s
INNER JOIN grades g ON s.marks BETWEEN min_mark and max_mark
ORDER BY g.grade DESC, s.name, s.marks ASC;       
                                    
# Ollivander's Inventory
# Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
# Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
                     
select
(
    select w1.id from wands as w1
    inner join wands_property as p1
    on w1.code = p1.code
    where p1.age=wands_property.age 
    and w1.coins_needed=min(wands.coins_needed)
),

wands_property.age, min(wands.coins_needed), wands.power

from wands

inner join wands_property
on wands.code = wands_property.code

where wands_property.is_evil=0

group by wands.power desc, wands_property.age desc;
    
# Challenges
# Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
    
    select H.hacker_id, H.name, count(C.challenge_id) as total_count
from Hackers H join Challenges C
on H.hacker_id = C.hacker_id
group by H.hacker_id, H.name
having total_count = 
(
select count(temp1.challenge_id) as max_count
    from challenges temp1
    group by temp1.hacker_id
    order by max_count desc
    limit 1
)
or total_count in
(
    select distinct other_counts from (
select H2.hacker_id, H2.name, count(C2.challenge_id) as other_counts
from Hackers H2 join Challenges C2
on H2.hacker_id = C2.hacker_id
group by H2.hacker_id, H2.name
) temp2
    group by other_counts
having count(other_counts) =1)
order by total_count desc, H.hacker_id;
   
# SQL Project Planning
# you are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

# If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

# Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

set @row1:=0;
set @row2:=0; 
    
select p_start.start_date,p_end.end_date
from (select @row1:=@row1+1 as rown,
    start_date from projects
    where start_date not in (select end_date from projects)) as p_start 
    inner join (select @row2:=@row2+1 as rown, 
    end_date from projects where end_date not in (select start_date from projects)) as p_end on p_start.rown=p_end.rown 
    order by p_end.end_date-p_start.start_date,p_start.start_date;

    
# Placements
# You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
# Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

SELECT s.Name
FROM Students s , Friends f , Packages p1,Packages p2
WHERE s.ID = f.ID and s.ID = p1.ID and f.Friend_ID = p2.ID and
p1.Salary < p2.Salary
ORDER BY p2.Salary;

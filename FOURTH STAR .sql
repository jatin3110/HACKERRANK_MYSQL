# Type of Triangle

# Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

# Equilateral: It's a triangle with  sides of equal length.
# Isosceles: It's a triangle with  sides of equal length.
# Scalene: It's a triangle with  sides of differing lengths.
# Not A Triangle: The given values of A, B, and C don't form a triangle.
# Input Format

# The TRIANGLES table is described as follows:

# Each row in the table denotes the lengths of each of a triangle's three sides.

SELECT
  CASE
    WHEN A = B AND B = C then "Equilateral"
    WHEN A + B <= C then "Not A Triangle"
    WHEN A + C <= B then "Not A Triangle"
    WHEN B + C <= A then "Not A Triangle"
    WHEN A = B AND A <> C then "Isosceles"
    WHEN A = C AND A <> B then "Isosceles"
    WHEN B = C AND A <> B then "Isosceles"
    ELSE "Scalene"
  END
FROM Triangles;

# The PADS

# Generate the following two result sets:

# Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
# Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

# There are a total of [occupation_count] [occupation]s.
# where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

# Note: There will be at least two entries in the table for each type of occupation.

# Input Format

# The OCCUPATIONS table is described as follows:  Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.


SELECT CONCAT(Name, '(', LEFT(Occupation, 1) , ')')
FROM Occupations
ORDER BY Name;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')
FROM Occupations
GROUP BY Occupation
ORDER BY COUNT(Occupation) ASC, Occupation;


# Occupations

# Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

# Note: Print NULL when there are no more names corresponding to an occupation.

# Input Format

# The OCCUPATIONS table is described as follows:

# Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

SELECT 
    D.Name, 
    P.Name, 
    S.Name, 
    A.Name 
FROM (
    SELECT 
        @rownum:=@rownum+1 AS rownum, 
        Name 
    FROM (SELECT @rownum:=0) r, 
        Occupations 
    WHERE Occupation = 'Doctor' 
    ORDER BY Name
) AS D 
RIGHT JOIN (
    SELECT 
        @rownumP:=@rownumP+1 AS rownumP, 
        Name 
    FROM (SELECT @rownumP:=0) r, Occupations 
    WHERE Occupation = 'Professor' ORDER BY Name
) AS P ON D.rownum = P.rownumP LEFT JOIN (SELECT @rownumS:=@rownumS+1 AS rownumS, Name FROM (SELECT @rownumS:=0) r, Occupations WHERE Occupation = 'Singer' ORDER BY Name) AS S ON P.rownumP = S.rownumS LEFT JOIN (SELECT @rownumA:=@rownumA+1 AS rownumA, Name FROM (SELECT @rownumA:=0) r, Occupations WHERE Occupation = 'Actor' ORDER BY Name) AS A ON P.rownumP = A.rownumA;


# Binary Tree Nodes

# You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

# Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

# Root: If node is root node.
# Leaf: If node is leaf node.
# Inner: If node is neither root nor leaf node.

SELECT N, CASE
            WHEN P IS NULL THEN 'Root'
            WHEN (SELECT COUNT(*) FROM BST child WHERE child.P = father.N) > 0 THEN 'Inner'
            ELSE 'Leaf'
          END
FROM BST father
ORDER BY N;


# New Companies

# Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 

# Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

select
    C.company_code, 
    group_concat( distinct C.founder),
    count(distinct LM.lead_manager_code),
    count(distinct SM.senior_manager_code),
    count(distinct M.manager_code),
    count(distinct E.employee_code)
from Company C
left join Lead_Manager LM on LM.company_code = C.company_code
left join Senior_Manager SM on SM.lead_manager_code = LM.lead_manager_code
left join Manager M on M.senior_manager_code = SM.senior_manager_code
left join Employee E on E.manager_code = M.manager_code
group by C.company_code
order by C.company_code;


# Contest Leaderboard

# You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

# The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.

select * from 
(select hackers.hacker_id, name, sum(subs.maxscore) as totalscore from hackers INNER JOIN 
(select hacker_id, challenge_id, max(score) as maxscore from submissions
group by hacker_id, challenge_id) subs
on hackers.hacker_id=subs.hacker_id
group by hackers.hacker_id, hackers.name) data 
where data.totalscore > 0
order by data.totalscore desc, hacker_id;

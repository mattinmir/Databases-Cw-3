-- Q1 returns (name,popularity)


SELECT names AS name, COUNT(names) AS popularity
FROM
    (
		SELECT SPLIT_PART(name, ' ', 1) AS names
		FROM person
    )AS occurunces
GROUP BY names
HAVING COUNT(names) > 1
ORDER BY popularity DESC, names
;

-- Q2 returns (name,forties,fifties,sixties)----------------------------------------------------todo
SELECT 	mother,  
	EXTRACT(YEAR FROM dob)
FROM person
WHERE mother IS NOT NULL
GROUP BY mother, dob
HAVING COUNT(name) > 1;


-- Q3 returns (name,age)
SELECT name, EXTRACT(YEAR FROM AGE(CURRENT_DATE, dob)) AS age
FROM person
WHERE dod IS NULL
ORDER BY name
; 

-- Q4 returns (father,mother,child,born)------------------------------------------------------todo
SELECT father, mother, name AS child, RANK(dob)
FROM person
WHERE (mother IS NOT NULL OR father IS NOT NULL)
;

--------------------
--Returns all children with at least one parent
SELECT father, mother, name AS child, dob
FROM person                                
WHERE mother IS NOT NULL
OR father IS NOT NULL
ORDER BY father, mother;


-- Q5 returns (father,mother,male)--------------------------------------------------------todo
WHERE (SELECT DISTINCT gender FROM person) = 'M'
;

-- Q6 returns (name)----------------------------------------------------------------------todo
WHERE COUNT(SELECT DISTINCT gender FROM person) = 1
;

SELECT ALL name, ALL father, ALL mother, DISTINCT gender
FROM person AS families
WHERE (father IS NOT NULL OR mother IS NOT NULL)
AND 

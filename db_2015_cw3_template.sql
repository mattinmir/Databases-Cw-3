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

-- Q2 returns (name,forties,fifties,sixties)
SELECT mother AS name,  
	COUNT(CASE FLOOR(EXTRACT(YEAR FROM dob) / 10) * 10 WHEN 1940 THEN 1 ELSE NULL END) AS  fourties,
	COUNT(CASE FLOOR(EXTRACT(YEAR FROM dob) / 10) * 10 WHEN 1950 THEN 1 ELSE NULL END) AS  fifties,
	COUNT(CASE FLOOR(EXTRACT(YEAR FROM dob) / 10) * 10 WHEN 1960 THEN 1 ELSE NULL END) AS  sixties
FROM person
WHERE mother IS NOT NULL
GROUP BY mother
HAVING COUNT(name) > 1

UNION	

SELECT father AS name,  
	COUNT(CASE FLOOR(EXTRACT(YEAR FROM dob) / 10) * 10 WHEN 1940 THEN 1 ELSE NULL END) AS  fourties,
	COUNT(CASE FLOOR(EXTRACT(YEAR FROM dob) / 10) * 10 WHEN 1950 THEN 1 ELSE NULL END) AS  fifties,
	COUNT(CASE FLOOR(EXTRACT(YEAR FROM dob) / 10) * 10 WHEN 1960 THEN 1 ELSE NULL END) AS  sixties
FROM person
WHERE father IS NOT NULL
GROUP BY father
HAVING COUNT(name) > 1

ORDER BY name
;


-- Q3 returns (name,age)
SELECT name, EXTRACT(YEAR FROM AGE(CURRENT_DATE, dob)) AS age
FROM person
WHERE dod IS NULL
ORDER BY name
; 

-- Q4 returns (father,mother,child,born)
-- RANK() over (PARTITION BY <columns you want to group by> ORDER BY <columns you want to recieve a rank in that group>)
SELECT father, mother, name AS child, RANK() over (PARTITION BY father, mother ORDER BY dob) AS born 
FROM person
WHERE mother IS NOT NULL OR father IS NOT NULL
GROUP BY mother, father, name
ORDER BY father, mother, born
;



-- Q5 returns (father,mother,male)
SELECT mother, father,
	-- Taking advantage of the fact that COUNT doesn't count null values
	 CAST(
	 	COUNT(CASE gender WHEN 'M' THEN 1 ELSE NULL END) * 1.0 / COUNT(gender) * 100.0 AS INTEGER) AS male
FROM person WHERE mother IS NOT NULL AND father IS NOT NULL
GROUP BY mother, father
ORDER BY mother, father
;
 

-- Q6 returns (name)
SELECT mother AS name
FROM
	(
	SELECT mother, COUNT(gender) 
	FROM person
	WHERE mother IS NOT NULL 
	OR father IS NOT NULL
	GROUP BY mother, gender
	) AS child_gender_count
GROUP BY mother
HAVING COUNT(mother) = 1

UNION

SELECT father AS name
FROM
	(
	SELECT father,COUNT(gender) 
	FROM person
	WHERE mother IS NOT NULL 
	OR father IS NOT NULL
	GROUP BY father, gender
	) AS child_gender_count
GROUP BY father
HAVING COUNT(father) = 1

ORDER BY NAME
;


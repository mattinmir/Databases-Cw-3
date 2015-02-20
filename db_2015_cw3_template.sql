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

;

-- Q3 returns (name,age)

; 

-- Q4 returns (father,mother,child,born)

;

-- Q5 returns (father,mother,male)

;

-- Q6 returns (name)

;

SELECT address, ROUND((max(age)- MIN(age) / MAX(age::numeric)), 2) AS formula,
                ROUND(avg(age),2) as "average", 
                ROUND((max(age)- MIN(age) / MAX(age::numeric)), 2) > ROUND(avg(age), 2) AS comparison
FROM person
GROUP BY address
ORDER BY 1;
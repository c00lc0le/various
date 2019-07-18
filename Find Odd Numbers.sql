/* Find count of odd numbers within 6 digits numbers that do not have a leading zero */ 

WITH e1(n) AS 
    (
     SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL 
     SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL 
     SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 0
    ) -- 10

    ,e2(n) AS (SELECT e1.n + b.n*10                                                 FROM e1 CROSS JOIN e1 AS b)                                                                                 -- 10*10
    ,e3(n) AS (SELECT e1.n + b.n*10 + c.n*100                                       FROM e1 CROSS JOIN e1 AS b CROSS JOIN e1 AS c)                                                              -- 10*100
    ,e4(n) AS (SELECT e1.n + b.n*10 + c.n*100 + d.n*1000 + e.n*10000                FROM e1 CROSS JOIN e1 AS b CROSS JOIN e1 AS c CROSS JOIN e1 AS d CROSS JOIN e1 AS e)                        -- 10*10000
    ,e5(n) AS (SELECT e1.n + b.n*10 + c.n*100 + d.n*1000 + e.n*10000 + f.n*100000   FROM e1 CROSS JOIN e1 AS b CROSS JOIN e1 AS c CROSS JOIN e1 AS d CROSS JOIN e1 AS e CROSS JOIN e1 AS f)     -- 10*100000
    
SELECT
    COUNT(*) AS ROW_COUNT
FROM
    e5
WHERE
    n BETWEEN 100000 AND 999999 -- 6 digits
    AND n%2 = 1 -- Odd numbers

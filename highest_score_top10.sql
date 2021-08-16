
SELECT MAX(score) as max_score,
       a.user_id,
FROM `bigquery-public-data.stackoverflow.comments` a
JOIN  
(
    SELECT user_id
    FROM`bigquery-public-data.stackoverflow.comments`
    GROUP by 1
    HAVING count(post_id) < 10
) as b
ON a.user_id = b.user_id
WHERE extract(year from creation_date) = 2020
GROUP BY 2
ORDER BY 1 DESC 
LIMIT 10;


--quality assurance for above query
/*

SELECT count(post_id),
       user_id
FROM `bigquery-public-data.stackoverflow.comments`
WHERE user_id IN(4406754,268627,4977243,196678)
GROUP by 2;


SELECT MAX(score) as max_score,
        user_id,
        count(post_id)
FROM `bigquery-public-data.stackoverflow.comments`
WHERE extract(year FROM creation_date) = 2020
GROUP by 2
ORDER by max_score DESC 
LIMIT 10;
*/

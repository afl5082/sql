    with q as (
SELECT  score,
        NTILE(4) OVER(ORDER BY score) as quartile
        FROM `bigquery-public-data.stackoverflow.comments` 
        WHERE score > 0
        )

        SELECT avg(score) as avg_score,
                quartile
        FROM q
        GROUP BY 2
       

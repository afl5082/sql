SELECT date_diff( current_date(), EXTRACT(DATE FROM u.creation_date), YEAR) as account_age,
       SUM(c.score) / COUNT(c.post_id) as average_score
FROM `bigquery-public-data.stackoverflow.users` u
JOIN `bigquery-public-data.stackoverflow.comments` c
ON u.id = c.user_id
GROUP BY 1
ORDER BY 1 DESC;

-- The Query to find which country are the user who sent more free tree from
--First you need to create the user_total_sent_free_tree table and then INSERT INTO it the data you've got from
-- This query :
--SELECT 
  --free_tree.user_id,
  --COUNT(free_tree.event) AS total_sent
--FROM 
  --free_tree
--GROUP BY 
  --free_tree.user_id
--ORDER BY total_sent DESC
--LIMIT 10;
 
SELECT 
   user_total_sent_free_tree.user_id,
   registrations.country,
   user_total_sent_free_tree.total_sent
FROM
    user_total_sent_free_tree 
JOIN 
    registrations
ON 
    user_total_sent_free_tree.user_id = registrations.user_id
GROUP BY user_total_sent_free_tree.total_sent, user_total_sent_free_tree.user_id, registrations.user_id, registrations.country
ORDER BY total_sent DESC;
;

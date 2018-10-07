-- The query for finding the users who sent more free tree
SELECT 
  free_tree.user_id,
  COUNT(free_tree.event) AS total_sent
FROM 
  free_tree
GROUP BY 
  free_tree.user_id
ORDER BY total_sent DESC
LIMIT 10;
  

--Top 20 users spent more days and sent more free tree
SELECT 
  free_tree.user_id,
  COUNT(DISTINCT free_tree.day) AS total_days,
  COUNT(free_tree.event) AS total_sent
FROM 
  free_tree
GROUP BY 
  free_tree.user_id 
ORDER BY total_days DESC, total_sent DESC
LIMIT 20;

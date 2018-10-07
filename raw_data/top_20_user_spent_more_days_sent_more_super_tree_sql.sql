-- Top 20 users who spent more days and sent more super tree 
SELECT 
  super_tree.user_id,
  COUNT(DISTINCT super_tree.day) AS total_days,
  COUNT(super_tree.event) AS total_sent
FROM
  super_tree
GROUP BY 
  super_tree.user_id
ORDER BY total_days DESC, total_sent DESC
LIMIT 20;

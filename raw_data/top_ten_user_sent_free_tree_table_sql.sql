-- Table of Top 10 users who sent the most free_tree
INSERT INTO top_ten_user_sent_free_tree
(SELECT 
  free_tree.user_id,
  COUNT(free_tree.event) AS total_sent
FROM 
  free_tree
GROUP BY free_tree.user_id
ORDER BY total_sent DESC
LIMIT 10);

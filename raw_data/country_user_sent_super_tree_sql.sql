-- The table to show where the top 10 users who sent most super tree are from.
SELECT 
  registrations.user_id,
  registrations.country,
  user_total_sent_super_tree.total_sent
FROM 
  registrations
JOIN
  user_total_sent_super_tree
ON
  user_total_sent_super_tree.user_id = registrations.user_id
GROUP BY registrations.user_id, registrations.country, user_total_sent_super_tree.total_sent
ORDER BY total_sent DESC;

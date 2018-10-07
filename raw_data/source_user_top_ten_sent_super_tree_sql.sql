--What source brought the users with the most super tree sends?
SELECT 
  registrations.user_id,
  user_top_10_sent_super_tree.total_sent,
  registrations.source
FROM
  registrations
JOIN
  user_top_10_sent_super_tree
ON
  registrations.user_id = user_top_10_sent_super_tree.user_id
GROUP BY registrations.user_id, user_top_10_sent_super_tree.total_sent, registrations.source
ORDER BY user_top_10_sent_super_tree.total_sent DESC;

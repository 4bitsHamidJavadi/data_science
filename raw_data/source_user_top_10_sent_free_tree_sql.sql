--What source brought the users with the most free tree sends?
SELECT 
  registrations.user_id,
  top_ten_user_sent_free_tree.total_sent,
  registrations.source
FROM 
  top_ten_user_sent_free_tree
JOIN
  registrations
ON  top_ten_user_sent_free_tree.user_id = registrations.user_id
GROUP BY registrations.user_id, registrations.source, top_ten_user_sent_free_tree.total_sent 
ORDER BY top_ten_user_sent_free_tree.total_sent DESC;

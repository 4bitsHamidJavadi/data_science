-- Insert into user_total_sent_super_tree from data we've got on the query before
INSERT INTO user_total_sent_super_tree
( SELECT 
    super_tree.user_id,
    COUNT(super_tree.event) AS total_sent
  FROM 
     super_tree
  GROUP BY super_tree.user_id
  ORDER BY total_sent DESC
  LIMIT 10);

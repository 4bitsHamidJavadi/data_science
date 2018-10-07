-- TABLE to store the user whoe sent free tree and the total number of sent items
INSERT INTO user_total_free_tree
( SELECT 
    free_tree.user_id,
    COUNT(free_tree.event) AS total_sent
  FROM
    free_tree
  GROUP BY free_tree.user_id
  ORDER BY total_sent DESC);

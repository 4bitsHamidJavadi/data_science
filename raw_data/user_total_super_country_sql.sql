--TABLE which has the users id, total sent super tree, country
INSERT INTO user_total_super_country
( SELECT
    user_total_sent_super_tree.user_id,
    user_total_sent_super_tree.total_sent,
    user_country_total_super_tree.country
  FROM
    user_total_sent_super_tree
  JOIN
    user_country_total_super_tree
  ON user_total_sent_super_tree.user_id = user_country_total_super_tree.user_id
  ORDER BY total_sent DESC);

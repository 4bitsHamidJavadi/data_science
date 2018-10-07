--INSERT into user_country_total_super_tree
INSERT INTO user_country_total_super_tree
( SELECT 
    registrations.user_id,
    registrations.country
  FROM
    registrations
  WHERE user_id IN
  ( SELECT
      user_total_sent_super_tree.user_id
    FROM
      user_total_sent_super_tree)
  GROUP BY registrations.user_id, registrations.country); 
  

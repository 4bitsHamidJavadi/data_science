--Insert into user country table from all users which sent free tree
INSERT INTO user_country
( SELECT 
    registrations.user_id,
    registrations.country
  FROM 
    registrations
  WHERE registrations.user_id IN
  (SELECT
    user_id
   FROM
    user_total_free_tree)
  GROUP BY registrations.user_id, registrations.country);

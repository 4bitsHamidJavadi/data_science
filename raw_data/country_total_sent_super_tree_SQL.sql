--INSERT INTO country_total_sent_super_tree
INSERT INTO country_total_sent_super_tree
( SELECT
    user_total_super_country.country,
    SUM(user_total_super_country.total_sent) AS total_sent
  FROM
    user_total_super_country
  GROUP BY user_total_super_country.country
  ORDER BY total_sent DESC);
  

--table user_age_total
INSERT INTO user_age_total
( SELECT 
    user_age,
    COUNT(user_age) AS total
  FROM
  ( SELECT 
      (2018 - registrations.birth_year) AS user_age
    FROM
      registrations) AS main_subquery
  GROUP BY user_age
  ORDER BY total DESC);



--FINDING THE AGE RANGE
SELECT 
  SUM(user_age_total.total) AS user_age_total_18_25
FROM
  user_age_total
WHERE user_age IN
( SELECT 
    user_age_total.user_age 
  FROM 
    user_age_total
  WHERE
    user_age_total.user_age >= 18 AND user_age_total.user_age < 25);

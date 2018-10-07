--Some basic info:

--Registrations (trend chart)
SELECT
  reg_date,
  COUNT(*) AS total_daily_reg
FROM
  registrations
GROUP BY reg_date
ORDER BY reg_date;

--Free-Tree sends (trend chart)
SELECT
  sent_date, 
  COUNT(*) AS total_sent_free_tree
FROM
  free_tree
GROUP BY sent_date
ORDER BY sent_date;

--Super-tree sends (trends chart)
SELECT 
  sent_date,
  COUNT(*) AS total_sent_super_tree
FROM
  super_tree
GROUP BY sent_date
ORDER BY sent_date;

--Basic segment informations:

--Number of registrations by source (pie chart)
SELECT 
  source,
  COUNT(*) AS total_registrations
FROM
  registrations
GROUP BY source
ORDER BY total_registrations DESC;

--Number of registrations by phone_type (pie chart)
SELECT
  device_type,
  COUNT(*) AS total_devices
FROM
  registrations
GROUP BY device_type
ORDER BY total_devices DESC;

--Number of registrations by location (pie chart)
SELECT
  country,
  COUNT(*) AS total_reg
FROM
  registrations
GROUP BY country
ORDER BY total_reg DESC;

--Number of registrations by birth_year (pie chart)
SELECT
  birth_year,
  COUNT(*) AS total_reg
FROM
  registrations
GROUP BY birth_year
ORDER BY total_reg DESC;

--The two main metrics we have just defined yesterday:

--Daily active users (last 7 days).
SELECT
  COUNT(DISTINCT(user_id)) AS total_active_users_last_7_days
FROM
  (SELECT * FROM free_tree
   UNION ALL
   SELECT * FROM super_tree) AS free_and_super
WHERE sent_date <= '2018-08-30' AND sent_date > '2018-08-23';
--WHERE sent_date <= (SELECT current_date - 1 ) AND sent_date > (SELECT current_date - 8)

--Daily revenue (last 7 days).
SELECT
  ( SELECT 
      COUNT(*) - COUNT(DISTINCT(user_id))
    FROM
      super_tree
    WHERE sent_date <= '2018-08-30') --(SELECT current_date -1 )
-
  ( SELECT
      COUNT(*) - COUNT(DISTINCT(user_id))
    FROM
      super_tree
    WHERE sent_date < '2018-08-23'); --(SELECT current_date - 8 )
    
--An advanced segment information:
--Daily tree send activity (both free and super-trees as well) by source
SELECT 
  sent_date,
  source,
  super_and_free.event,
  COUNT(*) AS total
FROM
((SELECT * FROM super_tree
  UNION ALL
  SELECT * FROM free_tree) AS super_and_free
  JOIN
    registrations
  ON registrations.user_id = super_and_free.user_id)
GROUP BY sent_date, source, super_and_free.event
ORDER BY sent_date;



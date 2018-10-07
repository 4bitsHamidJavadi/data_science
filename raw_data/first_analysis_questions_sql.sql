--1.What's our largest user segment?
--2.What's our user segment with the most free tree sends?
--3.What's our user segment with the most super tree sends?

--Registrations by reg_date
SELECT
  reg_date,
  COUNT(*) AS total_reg
FROM
  registrations
GROUP BY reg_date
ORDER BY reg_date;

--Registrations by birth_year
SELECT
  birth_year,
  COUNT(*) AS total
FROM
  registrations
GROUP BY birth_year
ORDER BY birth_year;

--Registrations by sources
SELECT 
  source,
  COUNT(*) AS total_registrations
FROM 
  registrations
GROUP BY source
ORDER BY total_registrations DESC;

--Registrations by sources and by_date
SELECT 
  reg_date,
  source,
  COUNT(*) AS total_registrations
FROM
  registrations
GROUP BY reg_date,source
ORDER BY reg_date;

--Registrations by birth_year
SELECT 
  registrations.birth_year,
  COUNT(*) AS total_reg
FROM
  registrations
GROUP BY registrations.birth_year
ORDER BY total_reg DESC;

--Registrations by birth_year and reg_date
SELECT 
  reg_date,
  birth_year,
  COUNT(birth_year) AS total_reg
FROM
  registrations
GROUP BY reg_date, birth_year
ORDER BY reg_date;

--Registrations by device_type
SELECT 
  device_type,
  COUNT(*) AS total_reg
FROM
  registrations
GROUP BY device_type
ORDER BY total_reg DESC;

--Registrations by country
SELECT 
  country,
  COUNT(*) AS total_reg
FROM
  registrations
GROUP BY country
ORDER BY total_reg DESC;

--Free tree by sources
SELECT
  source,
  COUNT(*) AS total_free_tree
FROM
  free_tree
JOIN
  registrations
ON  free_tree.user_id  = registrations.user_id
GROUP BY source
ORDER BY total_free_tree DESC;

--Free tree by sent_date
SELECT
  sent_date,
  COUNT(*) AS total_sent_free_tree
FROM
  free_tree
GROUP BY sent_date
ORDER BY sent_date;

--Free tree by sources and by sent_date
SELECT
  free_tree.sent_date,
  registrations.source,
  COUNT(registrations.source) AS total_sent_free_tree
FROM
  free_tree
JOIN
  registrations
ON  free_tree.user_id = registrations.user_id
GROUP BY free_tree.sent_date, registrations.source
ORDER BY sent_date;

--Free tree by birth_year
SELECT 
  birth_year,
  COUNT(*) AS total_sent_free_tree
FROM
  free_tree
JOIN
  registrations
ON free_tree.user_id = registrations.user_id
GROUP BY birth_year
ORDER BY total_sent_free_tree DESC;   

--Free tree by country
SELECT
  country,
  COUNT(*) AS total_sent_free_tree
FROM
  free_tree
JOIN
  registrations
ON free_tree.user_id = registrations.user_id
GROUP BY country
ORDER BY total_sent_free_tree DESC; 
 
--Free tree by device_type
SELECT 
  device_type,
  COUNT(*) AS total_sent_free_tree
FROM  
  free_tree
JOIN
  registrations
ON free_tree.user_id = registrations.user_id
GROUP BY device_type
ORDER BY total_sent_free_tree DESC;

--Super tree by sources
SELECT 
  source,
  COUNT(*) AS total_super_tree
FROM
  super_tree
JOIN
  registrations
ON super_tree.user_id = registrations.user_id
GROUP BY source
ORDER BY total_super_tree DESC;

--Super tree by sources and sent_date
SELECT 
  super_tree.sent_date,
  registrations.source,
  COUNT(registrations.source) AS total_sent_super_tree
FROM
  super_tree
JOIN
  registrations
ON super_tree.user_id = registrations.user_id
GROUP BY super_tree.sent_date, registrations.source
ORDER BY super_tree.sent_date;

--Super tree by sent_date
SELECT 
  sent_date,
  COUNT(*) AS total_sent
FROM
  super_tree
GROUP BY sent_date
ORDER BY sent_date;

--super tree by country
SELECT
  registrations.country,
  COUNT(*) AS total_sent_super_tree
FROM
  super_tree
JOIN
  registrations
ON super_tree.user_id = registrations.user_id
GROUP BY registrations.country
ORDER BY total_sent_super_tree DESC;

--super tree by birth_year
SELECT
  birth_year,
  COUNT(*) AS total_sent_super_tree
FROM
  super_tree
JOIN
  registrations
ON  super_tree.user_id = registrations.user_id
GROUP BY registrations.birth_year
ORDER BY total_sent_super_tree DESC;

--super tree by device_type
SELECT
  device_type,
  COUNT(*) AS total_sent_super_tree
FROM
  super_tree
JOIN
  registrations
ON  super_tree.user_id = registrations.user_id
GROUP BY registrations.device_type
ORDER BY total_sent_super_tree DESC;

--country and source
SELECT  
  country,
  source,
  COUNT(source) AS total_source
FROM
  registrations
GROUP BY country, source
ORDER BY country;

--country and device_type
SELECT
  country,
  device_type,
  COUNT(device_type) AS total_device
FROM
  registrations
GROUP BY country, device_type
ORDER BY country;

--country and birth_year
SELECT
  country,
  birth_year,
  COUNT(birth_year) AS total_birth_year
FROM
  registrations
GROUP BY country, birth_year
ORDER BY country;

--reg_date and device_type
SELECT
  reg_date,
  device_type,
  COUNT(device_type) AS total_device_type
FROM
  registrations
GROUP BY reg_date, device_type
ORDER BY reg_date;

--Microsegment
----------------

--This counts registrations by sources, device_type and country
SELECT
  source,
  device_type,
  country,
  COUNT(*) AS total_reg
FROM
  registrations
GROUP BY source, device_type, country
ORDER BY total_reg DESC;

--This counts free_tree by sources, device_type and country
SELECT
  source,
  device_type,
  country,
  COUNT(*) AS total_sent_free_tree
FROM
  free_tree
JOIN
  registrations
ON  free_tree.user_id = registrations.user_id
GROUP BY source, device_type, country
ORDER BY total_sent_free_tree DESC;

--This counts super_tree by sources, device_type and country
SELECT
  source,
  device_type,
  country,
  COUNT(*) AS total_sent_super_tree
FROM
  super_tree
JOIN
  registrations
ON  super_tree.user_id = registrations.user_id
GROUP BY source, device_type, country
ORDER BY total_sent_super_tree DESC;

--Revenue TASK
----------------
--What's the total revenue for the invitation program?
--Create table to save the users who sent more than 1 super tree
CREATE TABLE user_id_sent_super_tree
( user_id                     INT,
  total_sent_super_tree       INT);
  
--Insert the  data to the table
INSERT INTO  user_id_sent_super_tree
( SELECT  
    user_id,
    COUNT(*) AS total_sent_super_tree
  FROM
    super_tree
  GROUP BY  user_id
  HAVING  COUNT(*) > 1);

--Calculating the revenue by invite_a_friend (-1) is due to the first super tree is free
SELECT
  SUM(total_sent_super_tree -1) AS revenue$
FROM
  user_id_sent_super_tree
JOIN
  registrations
ON  user_id_sent_super_tree.user_id = registrations.user_id
WHERE registrations.source='invite_a_friend';
--
  
--What's the total revenue by device_type? And by birth_year?  
--Calculating the revenue by device_type
SELECT  
  device_type,
  SUM(total_sent_super_tree -1) AS revenue$
FROM
  user_id_sent_super_tree
JOIN
  registrations
ON  user_id_sent_super_tree.user_id = registrations.user_id
GROUP BY device_type
ORDER BY revenue$ DESC;

--Calculating the revenue by birth_year
SELECT
  birth_year,
  SUM(total_sent_super_tree -1) AS revenue$
FROM
  user_id_sent_super_tree
JOIN
  registrations
ON  user_id_sent_super_tree.user_id = registrations.user_id
GROUP BY birth_year
ORDER BY revenue$ DESC;

--What's the total revenue for Android users, from Germany, from the invitation program?
SELECT
  SUM(total_sent_super_tree -1) AS revenue$
FROM
  user_id_sent_super_tree
JOIN
  registrations
ON  user_id_sent_super_tree.user_id = registrations.user_id
WHERE ( device_type='android' AND country='germany' AND source='invite_a_friend');

---Another 2 Solutions by Tomi Mester
--1
SELECT source,
       SUM(revenue)
FROM (SELECT registrations.user_id,
             registrations.source,
             COUNT(*) - 1 AS revenue
      FROM super_tree
        JOIN registrations ON super_tree.user_id = registrations.user_id
      GROUP BY registrations.user_id,
               registrations.source) AS rev_table
GROUP BY source;
 
--2
SELECT source,
       COUNT(*) - COUNT(DISTINCT (super_tree.user_id)) AS revenue
FROM super_tree
  JOIN registrations ON super_tree.user_id = registrations.user_id
GROUP BY source
LIMIT 10;

-----------------------------
--Business Metrics
-----------------------------

--Number of Registrations per day
SELECT
  reg_date,
  COUNT(*) total_daily_reg
FROM
  registrations
GROUP BY reg_date
ORDER BY reg_date;
  
----------------------------
--Daily Active User: A user who sent at least 1 free tree or super tree in a given day.
--Daily Active Users in days.
SELECT
  day,
  COUNT(DISTINCT(user_id)) AS total_daily_user
FROM
 (SELECT user_id,day FROM free_tree
  UNION ALL
  SELECT user_id,day FROM super_tree) AS free_and_super
GROUP BY day
ORDER BY total_daily_user DESC;

--Daily Active Users for Yesterday
SELECT
  COUNT(DISTINCT(user_id))
FROM
  (SELECT user_id, day, sent_date FROM free_tree
   UNION ALL
   SELECT user_id, day, sent_date FROM super_tree) AS free_and_super
WHERE sent_date = (current_date-1);

--Daily Revenue
SELECT
--Daily Revenue for users who sent 1 super tree before
 (SELECT
    SUM(total_sent) AS daily_revenue
  FROM
    (SELECT 
      user_id,
      COUNT(*) AS total_sent
    FROM super_tree
    WHERE user_id IN 
      (SELECT
        DISTINCT(user_id)
       FROM
        super_tree
       WHERE sent_date < (SELECT current_date-1 AS yesterday)) 
    AND sent_date = (SELECT current_date-1 AS yesterday)
    GROUP BY user_id) AS sub_query)
+ --Adding two Groups for calculating total daily revenue 
--Daily Revenue for users who hasn't sent 1 super tree before
 (SELECT
    SUM(total_sent) AS daily_revenue
  FROM
    (SELECT 
      user_id,
      COUNT(*)-1 AS total_sent
    FROM super_tree
    WHERE user_id NOT IN 
      (SELECT
        DISTINCT(user_id)
       FROM
        super_tree
       WHERE sent_date < (SELECT current_date-1 AS yesterday))
    AND sent_date = (SELECT current_date-1 AS yesterday)
    GROUP BY user_id) AS sub_query);
    
--Alternative Solution**
SELECT
(SELECT COUNT(*)-COUNT(DISTINCT(user_id))
FROM super_tree
WHERE sent_date < (SELECT current_date as today))
-
(SELECT COUNT(*)-COUNT(DISTINCT(user_id))
FROM super_tree
WHERE sent_date < (SELECT current_date-1 as yesterday));

------------
SELECT 
  sent_date,  
(SELECT
(SELECT COUNT(*)-COUNT(DISTINCT(user_id))
FROM super_tree
WHERE sent_date < '2018-08-30')
-
(SELECT COUNT(*)-COUNT(DISTINCT(user_id))
FROM super_tree
WHERE sent_date < '2018-08-29'))
FROM super_tree
WHERE sent_date = '2018-08-29'
GROUP BY sent_date;   




  


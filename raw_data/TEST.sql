--COHORT ANALYSIS
SELECT
(SELECT 
  COUNT(DISTINCT(user_id)) * 100 AS number_of_returned_user_multiply_100
FROM
  (SELECT * FROM free_tree
   UNION ALL
   SELECT * FROM super_tree) AS free_and_super 
WHERE user_id IN
(SELECT 
  user_id
 FROM
  registrations
 WHERE reg_date = '2018-01-26')
AND sent_date = '2018-02-03')
/ 
(SELECT 
  COUNT(*)
 FROM registrations
 WHERE reg_date = '2018-01-26');


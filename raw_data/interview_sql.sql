--1
SELECT
  auther.auther_name,
  SUM(sold_copies) AS total_sold
FROM  books
JOIN  auther
ON books.book_name = auther.book_name
GROUP BY auther.auther_name
ORDER BY total_sold DESC
LIMIT 3;

--2
SELECT
  COUNT(*) AS total_number_user
FROM
  (SELECT 
    user_id,
    COUNT(*) AS total_inserted_image
  FROM
    event_log
  GROUP BY user_id) AS user_image_count
WHERE ( user_image_count.total_inserted_image > 1000 AND user_image_count.total_inserted_image < 2000) ;
  
--3
SELECT
  department_name,
  AVG(salary) AS salary_average
FROM  employees
JOIN  salaries
ON  employees.employee_id = salaries.employee_id) AS employees_salaries
GROUP BY department_name
HAVING AVG(salary) < 500;


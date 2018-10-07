--What is the most important source of registrations? Are there any changes in the trends?
SELECT 
  registrations.day,
  registrations.source, 
  COUNT(registrations.source) AS total_reg
FROM registrations
GROUP BY registrations.day, registrations.reg_date, registrations.source
ORDER BY registrations.reg_date; 

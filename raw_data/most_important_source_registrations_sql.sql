--What is the most important source of registrations?
SELECT 
  registrations.source,
  COUNT(registrations.source) AS total_reg
FROM registrations
GROUP BY registrations.source
ORDER BY total_reg DESC; 

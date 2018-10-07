-- Largest user segment
SELECT 
  registrations.country,
  COUNT(registrations.country) AS total
FROM registrations
GROUP BY registrations.country
ORDER BY total DESC;

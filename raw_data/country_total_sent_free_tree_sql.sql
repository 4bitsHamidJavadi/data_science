-- Table which has countries and total amount of sent free tree of those countries
INSERT INTO country_total_sent_free_tree
( SELECT 
    country,
    SUM(total_sent) AS total_sent_free
  FROM
  (SELECT 
      user_total_free_tree.user_id,
      user_total_free_tree.total_sent,
      user_country.country
    FROM
      user_total_free_tree
    JOIN
      user_country
    ON
      user_total_free_tree.user_id = user_country.user_id
    ORDER BY total_sent DESC) AS mainsubquery
    GROUP BY country
    ORDER BY total_sent_free DESC);

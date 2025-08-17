CREATE DATABASE IF NOT EXISTS Project;

-- Use the new database
USE Project;
select * from zomato;

# A. Volume by restaurant type

SELECT `listed_in(type)` AS type, COUNT(*) AS restaurants
FROM zomato
GROUP BY `listed_in(type)`
ORDER BY restaurants DESC;

#B. Average rating by online ordering availability

SELECT online_order,
       AVG(CAST(NULLIF(SUBSTRING_INDEX(rate, '/', 1), '') AS DECIMAL(3,2))) AS avg_rating
FROM zomato
GROUP BY online_order
ORDER BY avg_rating DESC;

#C. Average rating by table booking

SELECT book_table,
       AVG(CAST(NULLIF(SUBSTRING_INDEX(rate, '/', 1), '') AS DECIMAL(3,2))) AS avg_rating
FROM zomato
GROUP BY book_table
ORDER BY avg_rating DESC;

#D. Top restaurants by votes (social proof)

SELECT name,
       votes,
       CAST(NULLIF(SUBSTRING_INDEX(rate, '/', 1), '') AS DECIMAL(3,2)) AS rating
FROM zomato
ORDER BY votes DESC
LIMIT 20;


#E. Price band performance (cost-for-two buckets)

WITH base AS (
  SELECT
    CASE
      WHEN CAST(REPLACE(`approx_cost(for two people)`, ',', '') AS UNSIGNED) < 300 THEN '<₹300'
      WHEN CAST(REPLACE(`approx_cost(for two people)`, ',', '') AS UNSIGNED) BETWEEN 300 AND 599 THEN '₹300–599'
      WHEN CAST(REPLACE(`approx_cost(for two people)`, ',', '') AS UNSIGNED) BETWEEN 600 AND 899 THEN '₹600–899'
      ELSE '₹900+'
    END AS price_band,
    CAST(NULLIF(SUBSTRING_INDEX(rate, '/', 1), '') AS DECIMAL(3,2)) AS rating
  FROM zomato
)
SELECT price_band,
       COUNT(*) AS restaurants,
       ROUND(AVG(rating), 3) AS avg_rating
FROM base
GROUP BY price_band
ORDER BY restaurants DESC;


#F. Online × Type interaction (pivot)

SELECT `listed_in(type)` AS type,
       SUM(CASE WHEN online_order = 'Yes' THEN 1 ELSE 0 END) AS online_yes,
       SUM(CASE WHEN online_order = 'No'  THEN 1 ELSE 0 END) AS online_no
FROM zomato
GROUP BY `listed_in(type)`
ORDER BY online_yes DESC;

#G. Distribution of ratings (for Binning/QA)

SELECT FLOOR(CAST(NULLIF(SUBSTRING_INDEX(rate, '/', 1), '') AS DECIMAL(3,2)) * 2) / 2 AS rating_bin,
       COUNT(*) AS restaurants
FROM zomato
GROUP BY rating_bin
ORDER BY rating_bin DESC;

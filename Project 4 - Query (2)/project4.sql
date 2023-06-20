/*
 *  project4.sql
 * 
 *  author: Lauren Sherburne
 *  date: 10/01/2021
 *
 */

-- STATISTICS, AGGREGATION, AND GROUPING
-- 1. How many Stanford University graduates are there?
SELECT COUNT (*) AS stanford_graduates
FROM pioneers AS pi, schools AS sc
WHERE pi.school_id = sc.id AND sc.name = 'Stanford University';

-- 2. What is the earliest birth year of any pioneer in our data?
SELECT MIN(birth) AS earliest_birth_year
FROM pioneers;

-- 3. How many pioneers have no higher degrees listed?
SELECT COUNT(*) AS num_pioneers_without_degree
FROM pioneers
WHERE degree IS NULL;

-- 4. How many pioneers have first names the same length as their last names?
SELECT COUNT(*) AS same_length_first_last
FROM pioneers
WHERE LENGTH(first) = LENGTH(last);

-- 5. For each level of highest degree earned by our pioneers (Doctorate, Masters, Bachelors, none),
--    how many of our pioneers earned a degree at that level? Order by greatest number to least
--    number.
SELECT degree, COUNT(first)
FROM pioneers
GROUP BY degree
ORDER BY count DESC;

-- 6. What countries listed in schools have more than 2 schools (in our data), and how many do they
--    have? Order by the greatest number of schools first.
SELECT country, COUNT(name)
FROM schools
GROUP BY country
HAVING COUNT(name) > 2
ORDER BY count DESC;

-- 7. Give an approximate average lifespan (in years) of the deceased pioneers in our database (where
--    birth and death are known).
SELECT AVG(death - birth) AS approx_average_lifespan 
FROM pioneers
WHERE birth IS NOT NULL AND death IS NOT NULL;

-- 8. In what two years were exactly 5 of our pioneers born?
SELECT birth AS five_pioneers_born
FROM pioneers
GROUP BY birth
HAVING COUNT(first) = 5;



-- SUBQUERIES AND/OR COMPLEX JOINS
-- 9. What is the maximum number of awards won by a pioneer in our data?
SELECT pi.first, pi.last, COUNT(aw.name) 
FROM pioneers AS pi, awards AS aw, pioneers_awards_xref AS xr
WHERE pi.id = xr.pioneer_id AND aw.id = xr.award_id
GROUP BY pi.first, pi.last 
HAVING COUNT(aw.name) IN (SELECT MAX(awards_count) 
    FROM (SELECT COUNT(aw.name) AS awards_count
        FROM pioneers AS pi, awards AS aw, pioneers_awards_xref AS xr
        WHERE pi.id = xr.pioneer_id AND aw.id = xr.award_id
        GROUP BY pi.first, pi.last) AS subq);

-- 10. Who is the youngest pioneer, and what year were they born?
SELECT first, last, birth FROM pioneers
WHERE birth IN (SELECT MAX(birth) FROM pioneers)
    AND death IS NULL;

-- 11. What awards (awarding organization and award name) did Donald Knuth win?
SELECT aw.name AS award_name, aw.awarded_by AS awarding_organization
FROM pioneers AS pi, awards AS aw, pioneers_awards_xref AS xr
WHERE aw.id = xr.award_id AND pi.id = xr.pioneer_id
        AND pi.first = 'Donald' AND pi.last = 'Knuth';

-- 12. What are the first and last names of every pioneer in our data that won the Presidential Medal
--     of Freedom, and what were they known for? Order by year awarded.
SELECT pi.first, pi.last, pi.known_for, xr.year
FROM pioneers AS pi, awards AS aw, pioneers_awards_xref AS xr
WHERE aw.id = xr.award_id AND pi.id = xr.pioneer_id
        AND aw.name = 'Presidential Medal of Freedom'
ORDER BY xr.year;

-- 13. Provide Lynn Conway's school name and highest degree, along with the award she won.
SELECT pi.first, pi.last, sc.name AS school_name, pi.degree, aw.name AS award_name
FROM pioneers AS pi, awards AS aw, pioneers_awards_xref AS xr, schools as sc
WHERE aw.id = xr.award_id AND pi.id = xr.pioneer_id
        AND pi.first = 'Lynn' AND pi.last = 'Conway'
        AND sc.id = pi.school_id;

-- 14. Which pioneers went to school in the same country they were from and won exactly 2 awards, and
--     what school did they attend?
SELECT pi.first, pi.last, sc.name, pi.country, COUNT(aw.name) AS num_awards
FROM pioneers AS pi, schools as sc, awards AS aw, pioneers_awards_xref AS xr
WHERE pi.school_id = sc.id AND pi.country = sc.country
        AND xr.award_id = aw.id AND xr.pioneer_id = pi.id
GROUP BY pi.first, pi.last, sc.name, pi.country
HAVING COUNT(aw.name) = 2;

-- EXTRA CREDIT
-- 15. Which pioneers share the same first name with exactly 2 other pioneers, and what schools did
--     they attend? Order by first name and last name.
/*
 *  project2.sql
 * 
 *  author: Lauren Sherburne
 *
 */

/* 1. What is Radia Perlman known for? */
SELECT first, last, known_for FROM pioneers
WHERE first = 'Radia';

/* 2. Where did Alan Turing attend University, and what was the highest degree he obtained? */
SELECT first, last, school, degree FROM pioneers
WHERE last = 'Turing';

/* 3. Which pioneers (first and last name) were born before 1700? */
SELECT first, last FROM pioneers
WHERE birth < 1700;

/* 4. Where is the school Ensimag located (city and country)? */
SELECT city, country FROM schools
WHERE name = 'Ensimag';

/* 5. How old was Benoit Mandelbrot when he died (give or take a year)? */
SELECT death - birth AS age FROM pioneers
WHERE first = 'Benoit';

/* 6. Which pioneers did not obtain a college degree, and what were their birth/death dates? */
SELECT first, last, birth, death FROM pioneers
WHERE degree IS NULL;

/* 7. What are the names of all pioneers who attended the University of Pennsylvania, given as
 *    "firstname lastname," without extra spaces? There should only be one column in the result, not
 *    two. Order by last name. */
SELECT CONCAT(first, ' ', last) AS name FROM pioneers
WHERE school = 'University of Pennsylvania'
ORDER BY last;

/* 8. Which pioneer's last name started with 'I' whose first name did not start with 'K' and what
 *    were they known for? */
SELECT first, last, known_for FROM pioneers
WHERE last LIKE 'I%' AND first NOT LIKE 'K%';

/* 9. Give the names and locations (city, country) of all schools outside the US, sorted by country
 *    descending. */
SELECT name, city, country FROM schools
WHERE country != 'US'
ORDER BY country DESC;

/* 10. Which pioneers are known for contributions to the programming language Lisp (the string
 *     "Lisp" will occur in the "known_for" column), when were they born, and where did they attend
 *     school? Sort by school and then birth year. */
SELECT first, last, birth, school FROM pioneers
WHERE known_for LIKE '%Lisp%'
ORDER BY school, birth;

/* 11. Give names for Princeton University alumni, sorted by first name, then by last name. */
SELECT first, last FROM pioneers
WHERE school = 'Princeton University'
ORDER BY first, last;

/* 12. In what city and country did John Conway attend school? */
SELECT pi.first, pi.last, sc.city, sc.country FROM pioneers AS pi, schools AS sc
WHERE pi.first = 'John' AND pi.last = 'Conway' AND pi.school = sc.name;

/* 13. What are the names of every pioneer that attended a university outside of the US, and what was
 *     the name of the University they attended? */
SELECT pi.first, pi.last, sc.name FROM pioneers AS pi, schools AS sc
WHERE sc.country != 'US' AND pi.school = sc.name;

/* 14. What is the name, birth year, and school of the pioneer who attended school in Prague? */
SELECT pi.first, pi.last, pi.birth, sc.name FROM pioneers AS pi, schools AS sc
WHERE sc.city = 'Prague' AND pi.school = sc.name;

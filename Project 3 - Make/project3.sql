/*
 *  project2.sql
 * 
 *  author: Lauren Sherburne
 *
 */

-- drop the schedule table if it exists
DROP TABLE IF EXISTS schedule;

-- Step 1 - Create the table
CREATE TABLE schedule (term TEXT, course_id TEXT, section TEXT, title TEXT, instructor TEXT,
		       days TEXT, begin_time TIME);

-- Step 2 - Insert the data
	-- inserts the first row
INSERT INTO schedule
VALUES ('Fall','MATH201','B', 'PROBABILITY & STATISTICS','Munson, Ashlyn','TR','11:00:00');

	-- inserts the rest of the rows
INSERT INTO schedule
VALUES ('Fall','CSCI262','B','DATA STRUCTURES','Painter-Wakefield, Christopher','MWF','13:30:00'),
       ('Fall','CSCI358','A','DISCRETE MATHEMATICS',NULL,'TR','9:30:00'),
       ('Fall','MATH225','C','DIFFERENTIAL EQUATIONS','Strong, Scott','MWF','16:00:00');

-- Step 3 - Fix errors
UPDATE schedule
SET begin_time = '13:00:00'
WHERE course_id = 'CSCI262' AND section = 'B';

-- Step 4 - Create another table
	-- drop the table if it previously existed
DROP TABLE IF EXISTS transcript;
CREATE TABLE transcript (term TEXT, course_id TEXT, title TEXT, grade TEXT, credits NUMERIC(4,2),
			 quality_points NUMERIC(4,2));

-- Step 5 - Add the data
	-- inserts existing data from schedules table
INSERT INTO transcript
SELECT sc.term, sc.course_id, sc.title, NULL, 3.0
FROM schedule AS sc;

-- Step 6 - Enter grades
	-- Data Structures and Discrete Math grades entered
UPDATE transcript
SET grade = 'B', quality_points = 9.0
WHERE course_id = 'CSCI262' OR course_id = 'CSCI358';

	-- Probability & Statistics grades entered
UPDATE transcript
SET grade = 'A', quality_points = '12.0'
WHERE course_id = 'MATH201';

	-- Differential Equations grades entered
UPDATE transcript
SET grade = 'A-', quality_points = '11.1'
WHERE course_id = 'MATH225';

-- (Step 7 Optional)

-- Step 8 - Drop the old schedule
DROP TABLE schedule;

-- Step 9 - Recreate AND populate the new schedule
CREATE TABLE schedule AS
SELECT term, course_id, section, title, instructor, days, begin_time
FROM project3.catalog
WHERE CRN IN (12048,11153,12379,10866,10134,12704);

-- Step 10 - Fix errors
DELETE FROM schedule
WHERE title = 'LINEAR ALGEBRA';

-- (Step 11 Optional)

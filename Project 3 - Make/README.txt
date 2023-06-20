Purpose
Practice creating tables
Practice basic INSERT, UPDATE, and DELETE queries
Overview
In the last project, you practiced some basic SQL SELECT queries (part of the data manipulation language, or DML). This project will have you do some very basic data definition language (DDL) as well as modification queries (INSERT, UPDATE, and DELETE) from the DML.

In this project, you will work with a (vastly simplified) version of the Mines course catalog (with just CSCI and MATH courses!), and from it build (simplified) tables representing a student's schedule and transcript.

Before You Begin
It is a good idea to keep the PostgreSQL SQL referenceLinks to an external site. handy at all times!

Instructions
This project is developed, as described below, in x stages (each divided into multiple steps). The deliverable for this project is a SQL script implementing each stage. Please include comments in your script identifying which step is being addressed by the subsequent statement(s).

Stage 1
For starters, you are going to create a table in your schema representing a student schedule, and get the following information below into it:

Term	Course ID	Section	Title	Instructor	Days	Begin Time
Fall	MATH201	B	PROBABILITY & STATISTICS	Munson, Ashlyn	TR	11:00:00
Fall	CSCI262	B	DATA STRUCTURES	Painter-Wakefield, Christopher	MWF	13:30:00
Fall	CSCI358	A	DISCRETE MATHEMATICS		TR	09:30:00
Fall	MATH225	C	DIFFERENTIAL EQUATIONS	Strong, Scott	MWF	16:00:00
Step 1: Create the table

Create a table (using CREATE TABLE) named schedule with columns named term, course_id, section, title, instructor, days, and begin_time. The type 'TEXT' is probably best for all of the text columns; you may use 'VARCHAR(n)' if you prefer, but be sure there is room for the data! The type 'TIME' should be used for the begin_time column.

Pro-tip: before your CREATE TABLE command, put in the command DROP TABLE IF EXISTS schedule;. As the code suggests, this will drop (remove) the table schedule, if it exists in the database. Having this in your script means you can re-run your entire script as often as you want.

Step 2: Insert the data

Write an INSERT query to put the first row from the above table into your new schedule table. Then (your choice), either write one additional query to insert all of the rest of the data, or write separate queries to insert the rest of the entries. (This is a tedious way to add data to a database, even with cut-and-paste; we'll do something easier in later stages, but for now you need the practice.)

Notes:

Time values can be entered as strings in any format that PostgreSQL recognizes; for example, you can enter the time 9:30am simply as '9:30'.
Watch out for the missing instructor value in the third row; that should end up as a NULL value in your table (not an empty string). The NULL here could mean that an instructor has not yet been assigned to the course.
Step 3: Fix errors

Oops, CSCI262, section B, is offered at 1pm, not 1:30pm. Use an UPDATE query to fix this.

Stage 2
The semester is over! Time to record grades.

Step 4: Create another table

Create a table named transcript with columns named term, course_id, title, grade, credits, and quality_points. The credits and quality_points columns should be of type 'NUMERIC(4,2)' so that we can store numbers with 2 digits both before and after the decimal point.

Step 5: Add the data

The data will look like the table below, but rather than doing individual and tedious inserts, let's be a bit smarter about it.

Here's the data:

Term	Course ID	Title	Grade	Credits	Quality Points
Fall	MATH201	PROBABILITY & STATISTICS	A	3.0	12.0
Fall	CSCI262	DATA STRUCTURES	B	3.0	9.0
Fall	CSCI358	DISCRETE MATHEMATICS	B	3.0	9.0
Fall	MATH225	DIFFERENTIAL EQUATIONS	A-	3.0	11.1
Note that the first 3 columns are straight from our schedule. So let's just put them in using an INSERT INTO... SELECT query (see slide 6 from the lecture notes on insert, update, and delete). You'll need to specify the three columns that you are inserting into, and SELECT only the relevant three columns from schedule. This will populate the first three columns, leaving NULL values in the others.

If you're feeling extra clever, you could actually insert into the credits column as well, SELECTing a constant value of 3.0 to go into that column. That will save some typing in the next step.

Step 6: Enter grades

There are a number of ways you can modify the data using UPDATE statements to put in the correct grade, credits (if not done in last step), and quality points information. At minimum, you will need 3 UPDATE statements. Choose your own approach, but get the correct data into the table using UPDATE.

Step 7: (Optional) Play

At this point you should have a script that you can rerun as needed to reproduce your work up to this point. This is a perfect time to experiment with whatever DDL or DML you are curious about - add constraints, delete data, update data, insert data as you desire. (You can do this anytime, as a matter of fact - your schema is your playground, and we won't grade you on anything in your schema. We will be running your scripts in our own, separate schema.)

For example, we probably don't want students to be able to take the same course twice in one semester, so we should constrain the data to prevent it. You could add a PRIMARY KEY constraint on the combination of term and course_id - you can do this either in your CREATE TABLE command, or in a separate ALTER TABLE command, your choice. You could add NOT NULL constraints to section and title, as well. (Yes, it is true - we haven't talked much about PRIMARY KEY yet; you are encouraged take the initiative to look ahead in the text or postgresql documentation and read about this.) 

Stage 3
Registration for Spring!

Step 8: Drop the old schedule

We no longer need the schedule table (actually, we're going to create a new one). Go ahead and drop the table.

Step 9: Recreate AND populate the new schedule

This time, we're going to create the schedule table using a CREATE TABLE...AS command (see slide 16 in the lecture notes on types and table creation). The project3.catalog table has all of the columns needed for your schedule table, plus one additional: crn. You should use CREATE TABLE...AS to create a new schedule table by selecting term, course_id, section, title, instructor, days, and begin_time from project3.catalog where the CRN is one of these values: 12048, 11153, 12379, 10866, 10134, and 12704. (You can get all of the rows in one query easily using an IN clause as discussed in our lecture on subqueries, or you can do it using the OR operator.)

Note that you cannot set constraints when you create the table this way. You could create constraints after the fact using an ALTER TABLE command, but that isn't necessary for this project.

Step 10: Fix errors

Oh, no - we have two classes at 11am on MWF. Use a DELETE query to remove Linear Algebra from the schedule. We had too many courses on there, anyway.

At this point, your table should look like (ignoring order):

term	course_id	section	title	instructor	days	begin_time
Spring	CSCI306	B	SOFTWARE ENGINEERING	Baldwin, Mark	TR	15:30:00
Spring	CSCI400	A	PROGRAMMING LANGUAGES	McClurg, Jedidiah	TR	09:30:00
Spring	CSCI403	A	DATABASE MANAGEMENT	Painter-Wakefield, Christopher	MWF	11:00:00
Spring	MATH301	A	INTRODUCTION TO ANALYSIS	Tenorio, Luis	MWF	14:00:00
Spring	MATH307	B	INTRO TO SCIENTIFIC COMPUTING	Mikucki, Michael	MWF	10:00:00
Step 11 (Optional): Play some more

Again, you should have a script that you can re-run as many times as you'd like to re-create your work. (This is the script you will be turning in, so you should definitely test it a few times, anyway.) This is a good time to experiment - maybe consider adding grades for the Spring semester into the transcript table, adding different constraints, etc.

Grading
Task	Value
Each step except #7 and #11	8 points each
README	3 points
Total:	75 points
Submitting The Project
README:

Include your name and the names of all people who helped/collaborated.
Describe the challenges you encountered and how you surmounted them.
What did you like/dislike about the assignment?
How long did you spend on this assignment?
Submit a zip file on Canvas containing:

README
Your SQL script








README...
1. Include your name and the names of all people who helped/collaborated.
   Name: Lauren Sherburne
   Collaborator: Emi Higgins
2. Describe the challenges you encountered and how you surmounted them.
   The biggest challenge that I faced during this assignment was when I got errors in formatting. I
   missed a few commas between values in step 2 when inserting data into the table using an update
   statement with multiple values. However, this was an easy fix once I discovered the issue.
3. What did you like/dislike about the assignment?
   I liked that this assignment was separated into understandable sections. Following along with what
   was happening in the database was simple and helpful. I cannot think of anything that I really
   disliked or wanted to change about this assignment.
4. How long did you spend on this assignment?
   Time estimate: 2 hours

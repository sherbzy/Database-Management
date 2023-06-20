Purpose
Practice basic SELECT query syntax and usage
Overview
The Structured Query Language (SQL) is a key factor in the success of the relational model of databases. By providing a standard, high-level interface for working with relational databases, SQL enables data abstraction and program-data independence, leading to cleaner and more robust application code. SQL is standardized by the ISO and ANSI standards bodies, most recently as SQL:2016; while all DB vendors provide their own variations on the language (usually by extending it, rather than limiting it), the fundamentals are relatively constant from one vendor to another.

SQL can roughly be divided into three parts: the data definition language (DDL), the data manipulation language (DML), and everything else (primarily security and administration commands). Applications programmers primarily need concern themselves with the DDL and DML, leaving administration and security to dedicated database administrators (DBAs). (Of course, in small companies, the programmers may also act as DBAs.)

For this project, you will practice some basic SQL SELECT queries (part of the DML), mainly covering everything we discussed in classes 3 - 6.

You will be using the project2.pioneers  table to complete this assignment. The pioneers  table is made up of individuals that made significant contributions to computing or computer science. There is a wide range of people included in the table from early mathematicians like Gauss and Chebyshev to programmers like von Neumann and Dijkstra and even our own Dr. Camp. You may recognize some of the names on the list, however, for any, you may not have heard of, do some research on their contributions to computing in more detail - you may learn something about why their contributions were so significant!

If you have an idea for another pioneer that made significant contributions to computing as you are working on this project, feel free to share their name and why you think they should be included in your README, and we will add them to the database for future classes. (Also, I'm aware there are some errors in the data - please let me know of any you find - I'll work on fixing them.)

Your job is to write a number of SELECT queries to answer questions about computing pioneers throughout history.

Before You Begin
It is a good idea to keep the  PostgreSQL SQL referenceLinks to an external site.  handy at all times!

You may wish to download project2.sql as a template for your solution file for this project.

Set your search path
To make things easier, you should modify your search path to be able to see the tables in the project2  schema. In psql, issue the command:

SET search_path TO project2;
This will set your search path for this session of psql. If you want to make a permanent change, so that you see the project2  schema every time you login, instead do:

ALTER USER <your user id> SET search_path TO <your user id>, public, project2;
The above is just a suggestion - you can include whatever schemas you wish in your search path.

For the WebSQL tool, modify your search path using the SETTINGS page. You can alternately do the ALTER USER  command above, although you will need to refresh the page to see the change in your visible schemas.

Examine the tables
Now, you should explore the table definitions for the three tables in the project2  schema. Below, we'll show table definitions as output by psql using \d, but remember you can see table definitions in WebSQL by clicking on the "<" button next to the sideways "SCHEMA" label.

If you are looking at the people table by issuing the command \d pioneers  in psql, you should see something like the following (different versions of psql may show more or less information):

csci403=# \d pioneers
                 Table "project2.pioneers"
  Column   |     Type     | Collation | Nullable | Default 
-----------+--------------+-----------+----------+---------
 last      | text         |           | not null | 
 first     | text         |           | not null | 
 birth     | numeric(4,0) |           |          | 
 death     | numeric(4,0) |           |          | 
 country   | character(2) |           |          | 
 degree    | text         |           |          | 
 school    | text         |           |          | 
 known_for | text         |           | not null | 
Indexes:
    "pioneers_people_pkey" PRIMARY KEY, btree (last, first)
Foreign-key constraints:
    "pioneers_people_school_fkey" FOREIGN KEY (school) REFERENCES schools(name)
Referenced by:
    TABLE "awards" CONSTRAINT "pioneers_awards_last_fkey" FOREIGN KEY (last, first) REFERENCES pioneers(last, first)
This output is showing you that there are columns named: last, first, birth, death, country, degree, school,  and known_for  in the pioneers  table. The first two columns are of type (or domain) "text," which is a PostgreSQL type that allows arbitrary length strings to be stored. (Most modern databases have a type like this, but it is not standard; the standard only specifies types like "character varying" which have a maximum character length.) Country has type character(2) which allows exactly two characters representing a country's abbreviation. The birth and death columns have type "numeric(4,0)", which means they store 4-digit numbers with no decimal component. You can also see that last, first,  and known_for  are constrained not to allow NULL values.

An explanation of the fields in this table (this is often called a data dictionary):

Column	Description
last	last name
first	first name
birth	birth year (if known)
death	death year (if known)
country	birth country
degree	highest level of degree obtained
school	where the highest degree was obtained
known_for	most important computing contribution(s)
The rest of the information given by the \d pioneers  command tells you about the primary key and a foreign key of the table. The "pioneers_people_pkey" gives the name of the primary key constraint object, "btree" tells you the data structure used for the index (more on this in a future lecture), and "(last, first)" tells you the columns in the primary key. The information about the foreign key similarly gives you a name, the column in pioneers  comprising the foreign key, and the referenced table and column. If you haven't seen these concepts in lecture yet, you will shortly!

Take a look at the other tables in the project2  schema. The schools  table gives information about each school's location. The name  column in this table matches the school  column in the pioneers  table. The awards  table gives information about awards won by various pioneers - we won't be using this table in this project, but a similar table will be used in project 4.

If you have any questions, as always, post them on Piazza!

Instructions
All of the questions below should be answered strictly via queries executed on the database, e.g., using psql or other SQL client. That is, although you could query the database and do some post-processing within a client programming environment, you are required for this project to do all of the work on the database (server) side, using pure SQL. The deliverable for this project is a SQL script (a text file containing your queries - traditionally with a .sql extension - see  project2.sql  Download project2.sql for a template you can edit) containing one query for each question posed. Your file can have a .sql extension, a .txt extension, or no extension - as long as it is a plain text file it will be ok! Please put a comment (anything between /* and */ will be ignored by the SQL processor or anything after a -- on a line) before each query identifying which question the query answers. Be sure to terminate each query with a semi-colon!

Example:

If the question is: "What do we know about pioneers born before 1900?", your script might include the comment and query:

    -- 1. What do we know about people born before 1900?
    SELECT * FROM pioneers WHERE birth < 1900;
Please do not provide the answers you get back from the database with your query unless you comment them out. We will test your scripts by running them through psql all at once (using the \i  command) - this is why you must terminate every query with a semi-colon! If you are running your script using the /i  command on Windows make sure the path to the file uses \\  or /  instead of \. If your script cannot be run through psql successfully, we will ask you to resubmit.

For each of the questions below, please try to provide the least amount of data that answers the question. For example, if we ask what a pioneer is known for, we do not also want to know when they were born or where they went to school.

Questions
Easy starters

What is Radia Perlman known for?
Where did Alan Turing attend University, and what was the highest degree he obtained?
Which pioneers (first and last name) were born before 1700?
Where is the school Ensimag located (city and country)?
Functions and operators

How old was Benoit Mandelbrot when he died (give or take a year)?
Which pioneers did not obtain a college degree, and what were their birth/death dates?
What are the names of all pioneers who attended the University of Pennsylvania, given as "firstname lastname," without extra spaces? There should only be one column in the result, not two. Order by last name.
Which pioneer's last name started with 'I' whose first name did not start with 'K' and what were they known for?
Sorting

Give the names and locations (city, country) of all schools outside the US, sorted by country descending.
Which pioneers are known for contributions to the programming language Lisp (the string "Lisp" will occur in the "known_for" column), when were they born, and where did they attend school? Sort by school and then birth year.
Give names for Princeton University alumni, sorted by first name, then by last name.
Simple joins - you must use a join in each of your answers

In what city and country did John Conway attend school?
What are the names of every pioneer that attended a university outside of the US, and what was the name of the University they attended?
What is the name, birth year, and school of the pioneer who attended school in Prague?
Grading
Task	Value
Each question/query (14 total)	5 points each
README	5 points
Total:	75 points
Submitting The Project
README: (note the addition of question 5, specific to this assignment)

Include your name  and the names of all people who helped/collaborated.
Describe the challenges you encountered and how you surmounted them.
What did you like/dislike about the assignment?
How long did you spend on this assignment?
Are there any computer people you think we should add to the database, and why could they be considered a computing pioneer? Did you identify any incorrect data, and if so, what were they?
Submit a zip file on Canvas containing:

README
Your SQL script








README...
1. Include your name and the names of all people who helped/collaborated.
	Name: Lauren Sherburne
	Collaborators: Sean Keeney
2. Describe the challenges you encountered and how you surmounted them.
	For the longest time, I could not figure out how to get my sql script to run using psql
	and I kept getting the error that the file couldn't be found. However, I asked about this
	before class and discovered that I was using '/' instead of '\' when giving the file's path.
3. What did you like/dislike about the assignment?
	I enjoyed that this project was simple and straightforward. It was a good beginning project
	and it did a good job of covering all of the commands that we discussed in class. However,
	I disliked that it was a bit unclear on how to actually run a script. I know that it was
	mentioned in class, but the process was unfamiliar.
4. How long did you spend on this assignment?
	I spent about 2-3 hours on the actual sql script, but I spent about 2 hours trying to figure
	out how to run my script in psql and why it wasn't running.
5. Are there any computer people you think we should add to the database, and why could they be
   considered a computing pioneer? Did you identify any incorrect data, and if so, what were they?
	I did not think of any more "computer people" to add to the database during this project.
	Also, I did not identify any incorrect data.

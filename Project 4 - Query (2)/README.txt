Purpose
Practice grouping and aggregation
Practice subqueries and complex joins
Become a master of SELECT
Instructions
This project picks up where project 2 left off (you may wish to reread the introductory material from project 2). The database has been modified, though, to more closely match normal database practices. In particular, the tables will now use primary key columns named "id" of type integer. Linkages between tables will now use these id fields, following foreign key relationships, rather than linking on, say, school name or person name.

Before you go any further, be sure to set your schema to project4 - be sure not to use the old project2 schema.

This assignment is more complex than project 2, and it usually takes time to work out what the queries need to be - start early to give yourself time to work these out. There's a reason this assignment has a 2-week window, don't wait until the due date to start!

As an example of how the project 4 tables differ, the pioneers table now has column "school_id", which is a foreign key referencing the "id" column of schools.

There are also two tables you didn't work with in project 2, awards and pioneers_awards_xref. The awards table contains a list of various prestigious awards that have been earned by some of the pioneers in our database:

pioneers_awards
Column	Description
id	id of award
awarded_by	organization that gave award
name	name of the award
awarded_for	selection criteria for awardee
The pioneers_awards_xref table is what is known as a cross-reference table. Cross-reference tables are used when there is a many-to-many relationship between the data in one table and the data in another table. Many-to-many just means that a row in one table can be related to multiple rows in the second table, and vice-versa. In this case, for example, numerous people in our database have won the ACM's Turing Award (the most prestigious award for a computer scientist), including Edsger W. Dijkstra in 1972, E.F. Codd in 1981, and Barbara Liskov in 2008 - many people to one award. On the other hand, many of our pioneers have won multiple awards - e.g., Barbara Liskov, in addition to winning the Turing Award, has won the IEEE John von Neumann Medal (2004) and the IEEE Computer Pioneer Award (2018) - many awards to one person.

The cross-reference table solves the problem of relating all these records with each other. Without it, you'd have to do something along the lines of storing an array of award ids in a record in pioneers, or storing an array of pioneer ids in the awards rows - while this can be done, it makes joins much harder, and introduces complications into the formatting of the data. Instead, the cross-reference table pioneers_awards_xref contains rows that store one "pioneer_id" - an id from pioneers - and one "award_id" - an id from awards. The existence of a row in pioneers_awards_xref, then, means the pioneer associated with the pioneer_id won the award associated with the award_id. Usefully, the cross-reference table also gives us an appropriate place to store the year that the award was given to the pioneer.

So, to get a list of awards for a given person, you need to join the pioneers table to the pioneers_awards_xref table, and join that to the awards table (a 3-way join); or you can do it with nested subqueries. Here is the definition of pioneers_awards_xref:

pioneers_awards_xref
Column	Description
pioneer_id	id mapped to award winner
award_id	id mapped to award
year	year the award was given to the person
Create a SQL script file to answer the questions below using SELECT queries. Each answer should consist of exactly one query (which can include subqueries). As you do this assignment, consider that there are often many ways to achieve the same result in SQL; that joins can often be replaced with a subquery or vice-versa is one example. On the quiz and midterm, you will have to read someone else's (my) SQL, which may use a different technique than you might have chosen. So you might want to take extra time on this assignment and try different ways of solving each question.

Questions:
Statistics, aggregation, and grouping

How many Stanford University graduates are there?
What is the earliest birth year of any pioneer in our data?
How many pioneers have no higher degrees listed?
How many pioneers have first names the same length as their last names?
For each level of highest degree earned by our pioneers (Doctorate, Masters, Bachelors, none), how many of our pioneers earned a degree at that level? Order by greatest number to least number.
What countries listed in schools have more than 2 schools (in our data), and how many do they have? Order by the greatest number of schools first.
Give an approximate average lifespan (in years) of the deceased pioneers in our database (where birth and death are known).
In what two years were exactly 5 of our pioneers born?
Subqueries and/or complex joins

What is the maximum number of awards won by a pioneer in our data?
Who is the youngest pioneer, and what year were they born?
What awards (awarding organization and award name) did Donald Knuth win?
What are the first and last names of every pioneer in our data that won the Presidential Medal of Freedom, and what were they known for? Order by year awarded.
Provide Lynn Conway's school name and highest degree, along with the award she won.
Which pioneers went to school in the same country they were from and won exactly 2 awards, and what school did they attend?
Extra credit

Which pioneers share the same first name with exactly 2 other pioneers, and what schools did they attend? Order by first name and last name.
Grading
Task	Value
Each question/query (14 total)	5 points each
README	5 points
Total:	75 points
EC #15 is worth up to 5 additional points.

Submitting The Project
README:

Include your name and the names of all people who helped/collaborated.
Describe the challenges you encountered and how you surmounted them.
What did you like/dislike about the assignment?
How long did you spend on this assignment?
Submit a zip file on Canvas containing:

README
Your SQL script

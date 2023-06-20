Purpose
Get connected!
Overview
For this course, you will be using a PostgreSQL database which lives on a CS@Mines server. Most of your assignments will require that you connect to this database server and execute queries against it. This assignment will walk you through the basics of connecting to the server and running a simple query. You will also change your password on the server.

You should already have an account on the database if you are registered for the course. You should have received emails giving you your account credentials. If you haven't received these, please let me know ASAP!

There are several ways to connect to the database. For this course I have provided instructions (see the  Help page) on how to use psql (a command line client) or WebSQL (a homegrown web application) to connect to the database. Later in the semester, you will learn how to connect and run queries on the database from within Python or Java code.

Your goal for this project is to: 1) install an SQL client, 2) run the client and connect to the database using your credentials, 3) change your password, and 4) run a simple SELECT query and report the results.

Details
See the  Help page  for info on how to acquire, install, and use psql or WebSQL.

Connect to the database using the client of your choice.

Change your password by executing the following query (replacing yourid  and newpassword!):

  ALTER ROLE yourid PASSWORD 'newpassword'; 
Note: you can also change your password (more safely) in psql using the \password  command.

Test your password by exiting your client and reconnecting.

Execute the following SQL query and copy the text result:

  SELECT * FROM project1;
(Optional) Explore the client software to see what other things you can do or learn about the database.

Grading
Task	Value
Change your password	10 points
Run a simple query	10 points
README	5 points
Total:	25 points
Submitting The Project
README: 

Create a plain text file named README with the file extension .txt that contains:

Include your name  and the names of all people who helped/collaborated.
Describe the challenges you encountered and how you surmounted them.
What did you like/dislike about the assignment?
How long did you spend on this assignment?
Submit a zip file on Canvas containing:

README.txt
A text  file (with .txt extension) containing the results of your query.








README...
1. Include your name  and the names of all people who helped/collaborated.
	Name: Lauren Sherburne
	Collaborator: Kenneth
2. Describe the challenges you encountered and how you surmounted them.
	I did not encounter a great many challenges since this is a fairly simple and straightforward
	project. However, I did forget to add a semicolon and had to fix that before I could move on.
	Also, I originally did not use "\encoding utf8" and was confused when my select statement did
	not give any results.
3. What did you like/dislike about the assignment?
	I liked that this assignment was easy to follow, and gave me the opportunity to mess around
	with psql to see how it works. Honestly, there wasn't anything about this project that I
	really disliked.
4. How long did you spend on this assignment?
	about 30 minutes

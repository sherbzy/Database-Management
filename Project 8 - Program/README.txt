Purpose
Learn about client/server database programming
More practice writing INSERT, UPDATE, and DELETE statements
Overview
The goal of this project is to create a complete working client/server database application (albeit a very simple and small one). You will be working with simple music database (data sourced from MusicBrainz.org). Your program will provide functions to search, insert, modify, and delete album records from the database, and insert new artists. You are provided with a script (schema.sql) you can use to create and populate tables in your own schema. The script defines the tables and constraints for you.

Before You Begin
Download the starter code: code.zip Download code.zip. This contains working (but only partially) GUI programs in Python and Java for you to complete (you choose one). There are also text-based example programs, showing more query types.

The first thing you need to do is run the script schema.sql (which is in code.zip) against the database with your schema as the first schema in your search_path, and with public also in your search_path. The script will set up the simple tables needed for this project in your schema.

Once you've run the script, decide whether you want to work in Python, Java, or PHP for this project. I provide a simple GUI for this project in both Python and Java. Some startup instructions are below. (Note: at this time I do not have MacOS X instructions. The linux instructions should mostly apply, though.)

Python
If you plan on working in Python for this project, then first make sure you have a working installation of Python 3. You can obtain Python for your platform from https://www.python.org/downloads/Links to an external site..

Next, install the pg8000 connector via pip. The pip program comes with your python install; if you are on linux or MacOS, you may need to run pip3 for the Python 3 version. On my Windows machine, pip.exe is installed under my user directory (C:\Users\Christopher\AppData\Local\Programs\Python\Python35-32\Scripts\pip.exe). If you are on Windows, you can find the directory where the python install lives by launching IDLE and choosing "Path Browser" from the File menu. Once you've figured out how to run pip from the command line, just do

pip install pg8000
Once you've done all that, try running the starter code Python program named gui.py. On linux/MacOS, you should be able to run gui.py from the command line/Terminal (assuming python3 is installed in /usr/bin), or you can do

python3 gui.py
from the command line in the directory where gui.py is. Or you can launch it from IDLE. On Windows and MacOS, I find the easiest way is to run the program from IDLE, since python is typically not in your path. Launch IDLE, then use the File menu to open gui.py, then choose Run Module from the Run menu.

Java
If, instead, you intend to work in Java, make sure you have a working installation of the Java JDK (I have tested the code successfully on Java 8, 11, 13, and 16 - older or newer versions may or may not work). The Java JDK can be obtained at https://openjdk.java.net/Links to an external site. (OpenJDK) or http://www.oracle.com/technetwork/java/javase/downloads/index.htmlLinks to an external site. (commercial Oracle JDK). On linux, Java JDK (in the OpenJDK flavor) can usually be obtained from your package manager.

You will also need the postgresql JDBC jarfile called (postgresql-42.2.6), which is in the java subdirectory you will get from code.zip.

The java subdirectory in code.zip contains source code for four classes which together comprise the application. You can import these into your favorite IDE, or compile them from the command line using

javac GuiApplication.java
For command line, copy the JDBC jarfile into the directory with the compiled code and then you can run the application on Linux/MacOS with

java -cp .:postgresql-42.2.6.jar GuiApplication
For Windows you can run the application with

java -cp .;postgresql-42.2.6.jar GuiApplication
in the directory containing the .class files and the jarfile.

Running the code within your IDE requires you to set up the JDBC jarfile as an external library for your project, or possibly just setting up the classpath for executing the program. There are too many IDEs for me to provide instructions for each one - but it shouldn't be too difficult to figure it out, especially with help from Google.

Other languages...
If you are interested in using other languages, these are currently approved: PHP, using PDO to access Postgres. It will be up to you to locate appropriate libraries to call Postgres from PHP through PDO.

However, no support is given for this - you start from empty - so you must redevelop the framework provided in Python/Java in your language and then complete this assignment.

Details
Let the GUI be your guide as to the functions you need to implement, but essentially there are the following:

Search by artist (implemented for you)
Search by album title
Insert artist
Insert album
Edit album
Delete album
The existing code provides GUI interfaces to handle each of the above functions; you just need to provide the database code. All of the methods you need to implement are marked with a TODO comment. They are all gathered in one place in the code - for the Java programmers, you need to look in GuiModel.java. All of the methods currently have some kind of stub code that provides some non-useful behavior (like printing a message to the command line). The "search by artist" method has been provided to give you some idea how to proceed with the remaining methods. Note there is an additional method you must provide to retrieve a list of artists from the database; this is used on the "insert album" view.

Notes from Dr. Painter-Wakefield
While I am overall pleased with this code given that I a) did it in a short time and b) haven't ever even programmed GUI code in python before, I have to admit it is not the prettiest nor likely the best designed code. The Java code is hopefully slightly better than the Python code for design. Neither codebase is well commented at this time (shame on me!)
One weakness of the current design is that the Insert album function is provided with the artist as a string value - the artist name - rather than the artist id from the database. Since we don't have duplicate artist names in the database, this is only a minor problem, but it isn't the way professional software usually does things.
The Python starter code has been tested on Linux, Windows, and Mac; the Java starter code was tested on Linux, Windows, and Mac; please let your instructor(s) know of any bugs you find and we will try to fix them and make the fixed code available.
If you want to expand the function of the apps in small ways (Search by year) or large ways (add genres to the database and application), be my guest - just make a note in your README so we'll know what to expect. No extra credit for it, just the satisfaction of increasing your skills.
Grading
Task	Value
README	5 points
Search function	5 points
Retrieve artists function	5 points
Insert artist function	5 points
Insert album function	5 points
Edit album function	5 points
Delete album function	5 points
Total:	35 points
Submitting The Project
README:

Include your name and the names of all people who helped/collaborated, as per the syllabus.
Describe the challenges you encountered and how you surmounted them.
What did you like/dislike about the assignment?
How long did you spend on this assignment?
Submit a zip file on Canvas containing:

README
All of the source code (including both files you modified or added, and those you did not modify)








README...
1. Include your name and the names of all people who helped/collaborated, as per the syllabus.
	Name: Lauren Sherburne
	No Collaborators
2. Describe the challenges you encountered and how you surmounted them.
	By far, the biggest challenges I faced was setting up the initial code. As far as the project
	itself, it was mostly straightforward, although debugging was difficult because I am not used
	to the type of error messages that were given.
3. What did you like/dislike about the assignment?
	I really liked that this program helped us connect our previous coding experience with the
	new sql that we learned this year. In my experience, this is a very important part of
	internships/careers. I disliked how much difficulty I had setting up the project, and I went
	into a bit more detail below. I talked to a few other people who seemed to be having as much
	trouble as I was, but perhaps that was intended.
4. How long did you spend on this assignment?
	Once I got the provided code running correctly, this assignment took me about 3 or 4 hours.
	However, I spent about 12-15 hours struggling to get the starter code running. I started with
	java because that is what I am more comfortable with, but I ran into several problems. I was
	able to get the java code to run, but it was not able to connect to the database despite
	following the instructions for the assignment. At this point I switched to python, and
	struggled with using the "pip install pg8000" for a many hours. In the end, I finally was
	able to fix the issues and get the python program working correctly. I did not need a whole
	lot of extra instruction when it came to the assignment itself, but I would suggest making
	the setup instruction a bit more clear if that is possible.

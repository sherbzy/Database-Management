Purpose
practice normalizing schemas
Overview
For this project, you are given an unnormalized relation schema, and asked to normalize it (with respect to Boyce-Codd Normal Form only, although an optional extra credit asks you to normalize further). I will provide you with the attributes and a set of functional dependencies, which together form a cover of the possible functional dependencies (you may need to infer additional dependencies using the inference rules we learned). I will also provide you with a key for the initial relation schema; you will need to infer keys for any new relation schemas you create from the functional dependencies.

Your job is to decompose the relation schema(s) until all relation schemas are in BCNF. When applying the normalization algorithm, please always do the optional step to compute the closure of the left-hand side of each functional dependency. To document your work, for each decomposition you do, please note the following:

The starting relation schema (a variable name)
The functional dependency which violates BCNF which you choose to use to decompose the relation schema
The two decomposition products (two lists of attributes, labeled with variable names, e.g., R1 and R2)
At the end of your work, please list the set of final relation schemas (discard schemas which were decomposed), along with the functional dependencies for each final relation schema.

An example of what your solution should look like is included in the Details below.

Details
The relation schema you need to decompose concerns composers and their compositions (sorry for the pun, I couldn't resist). The attributes for the relation are: {composer, era, era dates, birthplace, continent, work, setting}. The choice of attributes is somewhat contrived, and also abbreviated for instructional purposes - try to imagine a much larger set of attributes for each "entity". If it helps make sense of things, some example tuples compatible with the unnormalized relation schema can be found in figure 1 and in the composers  table in the public schema of the course database.

The only key for the unnormalized relation is: {composer, era, work}.

You are given the following functional dependencies:

{composer} → {birthplace}‍
{composer, work} → {setting}‍
{era} → {era_dates}‍
{birthplace} → {continent}‍

(composers.PNG is available in the repo)

Example
In case the instructions are not clear, here is an artificial example, showing what I am looking for in your solution.

Given some set of attributes R = {a, b, c, d, e} where the only key is the set {a}, and functional dependencies

{b} → {c}‍
{d} → {e},
your solution would look something like this:

-----------------------------------------------
Example Solution

Step 1

Starting schema: R
Decompose on {b} → {c}‍
Results:
R1 = {a,b,d,e}‍
R2 = {b,c}‍
Step 2

Starting schema: R1
Decompose on {d} → {e}‍
Results:
R3 = {a,b,d}‍
R4 = {d,e}‍
Final database:

R3 = {a,b,d}, only FD is {a} → {b,d}‍
R2 = {b,c}, only FD is {b} → {c}‍
R4 = {d,e}, only FD is {d} → {e}‍
-----------------------------------------------
Note that your solution doesn't need to show the resulting relations (i.e., the example data), just the resulting relation schemas (the list of attributes will do).

Extra Credit
You may notice (by looking at the example data) that one relation in your final result still has some remaining redundancy. For 5 points extra credit, identify the relation and the violating multi-valued dependency (MVD), and show the decomposition needed to bring it into fourth normal form (4NF).

Grading
This project is worth 50 Points.

Submitting The Project
Submit your solution as a PDF file (with .pdf extension) or a text file (with .txt extension).

If you'd like to include a README with feedback on the project, put both files in a zip file to submit.

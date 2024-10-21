# 💻 Project: WorldCup Database

## Project goal:
Create a Bash script that enters information from World Cup games.csv file into PostgreSQL, then query the database for useful statistics.
The project was made as part of the FreeCodeCamp Relational Databases Certificate course

## Creating the database
Using CSV Dataset: [games.csv](https://github.com/jhao13/FCC-Worldcup-database/blob/main/games.csv)

Created the database, 'worldcup', and the tables ('teams' and 'games') on PostgreSQL to visualise the data from games.csv.

Added appropriate constraints (primary keys and foreign keys) required to relate the tables.

Table Info:

'games' table lists all matches and scores made by both the winner team and the opponent team (using team_id as the identifier).

'teams' table lists all teams that played in the matches.

winner_id and opponent_id in 'games' table references the same team_id in 'teams' table to prevent duplicate team names.

## Automating data insertion and querying with Bash script

Created a Bash script that reads the games.csv data and uses SQL query commands to insert the data automatically into the tables previously created.

Took constraints into consideration when creating the Bash script to insert all winner and opponent teams individually into 'teams' and then into 'games' based on the team_id created.

Bash script used to read games.csv and insert data: [insert_data.sh](https://github.com/jhao13/FCC-Worldcup-database/blob/main/insert_data.sh)

Finished by writing a Bash script that utilises SQL to query the database and obtain useful valuesL: [queries.sh](https://github.com/jhao13/FCC-Worldcup-database/blob/main/queries.sh)

Final database dump (after inserting data): [worldcup.sql](https://github.com/jhao13/FCC-Worldcup-database/blob/main/worldcup.sql)



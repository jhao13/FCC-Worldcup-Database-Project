# Project goal:
Create a Bash script that enters information from World Cup games.csv file into PostgreSQL, then query the database for useful statistics.
The project was made as part of the FreeCodeCamp Relational Databases Certificate course
# Creating the database
Dataset: [games.csv](https://github.com/redlessblade/FCC-Worldcup-database/blob/main/games.csv)

Created the database, 'worldcup', and the appropriate tables ('teams' and 'games') on PostgreSQL to visualise the data from games.csv.

Added appropriate constraints (primary keys and foreign keys) required to relate the tables.

Tables:

'games' tracks all matches and scores made by both the winner team and the opponent team (using team_id as the identifier).
'teams' lists all teams that played in the matches.

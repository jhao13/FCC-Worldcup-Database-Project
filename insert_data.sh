#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS #IFS reads until comma to put seperate words into variableS
do
  if [[ $YEAR != "year" ]]
    then
    #get winner_id to put into names column for teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    #if not found
    if [[ -z $WINNER_ID ]] #CHECKS IF WINNER_ID IS EMPTY, INSERTS RESULTS INTO DATABASE IF ID IS EMPTY/NONEXISTENT
      then
      $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")   
      #echo "Inserted into name column of teams table, $WINNER"
      #get new team ids
      #WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    #get opponent_id to put into names column for teams table
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_ID ]] #CHECKS IF id IS EMPTY, INSERTS RESULTS INTO DATABASE IF ID IS EMPTY/NONEXISTENT
      then
      $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")   
      #echo "Inserted into name column of teams table, $OPPONENT"
      #get new team ids
      #OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    $($PSQL "INSERT INTO games(winner_id, opponent_id, winner_goals, opponent_goals, year, round) VALUES($WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS, $YEAR, '$ROUND')")   
  fi
done
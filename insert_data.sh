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
  if [[ $WINNER != "winner" ]]
    then
    #get winner_id to put into names column for teams table
    WINNER_NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    #if not found
    if [[ -z $WINNER_NAME ]] #CHECKS IF WINNER_NAME IS EMPTY, INSERTS RESULTS INTO DATABASE IF NAME IS EMPTY/NONEXISTENT
      then
      INSERT_WINNER_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")   
        if [[ $INSERT_WINNER_TEAM_NAME == "INSERT 0 1" ]]
          then
            echo Inserted team $WINNER
        fi
      #echo "Inserted into name column of teams table, $WINNER"
      #get new team ids
      #WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi
  
  if [[ $OPPONENT != "opponent" ]]
    then
    #get opponent_id to put into names column for teams table
    OPPONENT_NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_NAME ]] #CHECKS IF OPPONENT_NAME IS EMPTY, INSERTS RESULTS INTO DATABASE IF NAME IS EMPTY/NONEXISTENT
      then
      INSERT_OPPONENT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")   
        if [[ $INSERT_OPPONENT_TEAM_NAME == "INSERT 0 1" ]]
          then
            echo Inserted team $OPPONENT
        fi
      #echo "Inserted into name column of teams table, $OPPONENT"
      #get new team ids
      #OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi
  if [[ YEAR != "year" ]]
    then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)")
      if [[ $INSERT_GAME == "INSERT 0 1" ]]
        then
          echo New game added: $YEAR, $ROUND, $WINNER_ID VS $OPPONENT_ID, score $W_GOALS : $O_GOALS
      fi
  fi
  
done

#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c" 
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
clear
echo "$($PSQL "truncate games, teams")"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" && $OPPONENT != "opponent" ]]
  then
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    if [[ -z $WINNER_ID ]]
    then
      WINNER_INSERT_RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
      if [[ $WINNER_INSERT_RESULT = "INSERT 0 1" ]]
      then
        echo "Inserted in the table teams, $WINNER"
      fi
    fi

    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_INSERT_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT')")
      if [[ $OPPONENT_INSERT_RESULT = "INSERT 0 1" ]]
      then
        echo "Inserted in the table teams, $OPPONENT"
      fi
    fi
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

    GAME_INSERT_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $GAME_INSERT_RESULT = "INSERT 0 1" ]]
    then
      echo "Inserted Game $WINNER vs $OPPONENT"
    fi
  fi
done 
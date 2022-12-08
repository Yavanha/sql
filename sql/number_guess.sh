#!/bin/bash

echo -e "\n Number Guesssing Game"

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align --tuples-only -c"

ENTER_GAME() {
echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM USERS where username like '$USERNAME'")

if [[ -z $USER_ID ]] ; then
  #create a new users
  INSERT_RESULT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')");
  if [[ $INSERT_RESULT_USER == "INSERT 0 1" ]]; then
      USER_ID=$($PSQL "SELECT user_id FROM USERS where username like '$USERNAME'")
  fi
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "select count(*) from games where user_id = $USER_ID")
  MIN_SCORE=$($PSQL "select min(score) from games where user_id = $USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $MIN_SCORE guesses." 
fi
}

GAME_LOOP() {
  TO_GUESS=$(( $RANDOM % 1000 + 1 ))
  echo  "Guess the secret number between 1 and 1000: ($TO_GUESS)"
  read GUESS
  NUMBER_GUESSES=1

  while [[ ! $TO_GUESS -eq $GUESS ]]; do
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
    elif [[ $GUESS -lt $TO_GUESS ]]; then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $TO_GUESS ]]; then 
      echo "It's lower than that, guess again:"
    fi
    NUMBER_GUESSES=$(($NUMBER_GUESSES + 1))
    read GUESS
  done
  echo "You guessed it in $NUMBER_GUESSES tries. The secret number was $TO_GUESS. Nice job!"
  INSERT_GAME_RESULT=$($PSQL "insert into games(user_id, to_guess, score) values($USER_ID, $TO_GUESS, $NUMBER_GUESSES)");
  
}


ENTER_GAME
GAME_LOOP

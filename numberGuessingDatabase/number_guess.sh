#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$(( (RANDOM % 1000) + 1 ))
NUMBER_OF_GUESSES=0

echo Enter your username:
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# if user does not exist
if [[ -z $USER_ID ]]
then
  # create new user and welcome
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo Welcome, $USERNAME! It looks like this is your first time here.
# if user exists
else
  # get games stats for user
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id='$USER_ID'")
  # welcome existing user
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

# play game
echo Guess the secret number between 1 and 1000:
read GUESS
((NUMBER_OF_GUESSES++))
# check guess is integer
while [[ ! $GUESS =~ ^[0-9]+$ ]]
do
  echo That is not an integer, guess again:
  read GUESS
done
while [[ $GUESS != $RANDOM_NUMBER ]]
do 
  if [[ $RANDOM_NUMBER -lt $GUESS ]]
  then
    ((NUMBER_OF_GUESSES++))
    echo "It's lower than that, guess again:"
    read GUESS
    while [[ ! $GUESS =~ ^[0-9]+$ ]]
    do
      echo That is not an integer, guess again:
      read GUESS
    done
  else
    ((NUMBER_OF_GUESSES++))
    echo "It's higher than that, guess again:"
    read GUESS
    while [[ ! $GUESS =~ ^[0-9]+$ ]]
    do
      echo That is not an integer, guess again:
      read GUESS
    done
  fi
done
echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!
#enter game stats
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID,$NUMBER_OF_GUESSES)")


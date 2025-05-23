#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games,teams")
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $winner != winner ]]
  then
    #get winner id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    #if not found
    if [[ -z $WINNER_ID ]]
    then
      #insert major
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $winner"
      fi
      #get new major_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    fi 
    #get opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    #if not found
    if [[ -z $OPPONENT_ID ]]
    then
      #insert major
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $opponent"
      fi
      #get new major_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    fi 
  fi
  #insert into games
  INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($year,'$round',$WINNER_ID,$OPPONENT_ID,$winner_goals,$opponent_goals)")
  if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
  then
    echo "Inserted into games, $round"
  fi
done

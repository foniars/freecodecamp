#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
  then
    #find Atomic Number
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements where $1 = atomic_number")
    elif [[ $1 =~ ^.{1,2}$ ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements where '$1' = symbol")
    else
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements where '$1' = name")
    fi
    #if element found
    if [[ $ATOMIC_NUMBER ]]
    then
      #get element data
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties where $ATOMIC_NUMBER = atomic_number")
      MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties where $ATOMIC_NUMBER = atomic_number")
      BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties where $ATOMIC_NUMBER = atomic_number")
      TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING(type_id) where $ATOMIC_NUMBER = atomic_number")
      NAME=$($PSQL "SELECT name FROM elements where $ATOMIC_NUMBER = atomic_number")
      SYMBOL=$($PSQL "SELECT symbol FROM elements where $ATOMIC_NUMBER = atomic_number")
      #print element data
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    #element not found
    else    
      echo I could not find that element in the database.
    fi
  else
    echo "Please provide an element as an argument."
  fi

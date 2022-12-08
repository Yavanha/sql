#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"
DISPLAY_ELEMENT() {
  if [[ $1 ]]; then
    echo "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME MASS MELTING BOILING TYPE_ID
    do
      TYPE=$($PSQL "select type from types where type_id = $TYPE_ID")
      echo "The element with atomic number $(echo "$ATOMIC_NUMBER" | sed 's/ //g') is $(echo "$NAME" | sed 's/ //g') ($(echo "$SYMBOL" | sed 's/ //g')). It's a $(echo "$TYPE" | sed 's/ //g'), with a mass of $(echo "$MASS" | sed 's/ //g') amu. $(echo "$NAME" | sed 's/ //g') has a melting point of $(echo "$MELTING" | sed 's/ //g') celsius and a boiling point of $(echo "$BOILING" | sed 's/ //g') celsius."
    done
  fi
 
}

if  [[ -z $1 ]]
then 
  echo "Please provide an element as an argument."
  exit 0
fi
  
if [[ $1 =~ ^[0-9]$ ]]; then
  ELEMENT=$($PSQL "select * from elements inner join properties using (atomic_number) where atomic_number = $1")
elif [[ $1 =~ ^[A-Z][a-z]{0,1}$ ]]; then
    ELEMENT=$($PSQL "select * from elements inner join properties using (atomic_number) where symbol = '$1'")
else
    ELEMENT=$($PSQL "select * from elements inner join properties using (atomic_number) where name = '$1'")
fi

if [[ -z $ELEMENT ]]; then 
  echo "I could not find that element in the database."
else
  DISPLAY_ELEMENT $ELEMENT
fi


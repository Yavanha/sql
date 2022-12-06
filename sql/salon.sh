#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"


echo -e "Welcome to My Salon, how can I help you?\n"
CHOOSE_SERVICE() {
  if [[ $1 ]]
  then
    echo -e "\n$1" 
  fi
  AVAILABLE_SERVICES=$($PSQL "select service_id, name from services order by service_id")
  echo "$AVAILABLE_SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    echo "$(echo "$SERVICE_ID" | sed 's/ //g')) $(echo "$NAME" | sed 's/ //g')"
  done
  read SERVICE_ID_SELECTED
  SERVICE_NAME_CHOSEN=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")

  while [[ -z $SERVICE_NAME_CHOSEN ]]
  do
    echo "$AVAILABLE_SERVICES" | while IFS="|" read SERVICE_ID NAME
      do
        echo "$SERVICE_ID) $NAME"
      done
    read SERVICE_ID_SELECTED
    SERVICE_NAME_CHOSEN=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  done

  echo -e "What's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "select name from customers where phone like '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "select customer_id from customers where name like '$(echo "$CUSTOMER_NAME" | sed "s/ //g")'")
  echo -e "What time would you like your $(echo "$SERVICE_NAME_CHOSEN" | sed "s/ //g"), $(echo "$CUSTOMER_NAME" | sed "s/ //g")?"
  read SERVICE_TIME

  while [[ ! $SERVICE_TIME =~ ^[0-9]{2}:[0-9]{2}$ ]] && [[ ! $SERVICE_TIME =~ ^[0-9]{1,2}am$ ]]
  do
    read SERVICE_TIME
  done

  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values($(echo "$CUSTOMER_ID" | sed "s/ //g"), $SERVICE_ID_SELECTED,'$SERVICE_TIME')")

  if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
  then
    echo "I have put you down for a $(echo "$SERVICE_NAME_CHOSEN" | sed "s/ //g") at $SERVICE_TIME, $(echo "$CUSTOMER_NAME" | sed "s/ //g")."
  fi
} 


CHOOSE_SERVICE
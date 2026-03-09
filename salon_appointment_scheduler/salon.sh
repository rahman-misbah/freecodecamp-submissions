#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -tA -c "

MAIN_MENU() {
  if [[ -z $1 ]]; then
    echo -e "Welcome to My Salon, how can I help you?\n"
  else
    echo -e "\n$1"
  fi

  # display list of services
  echo "$($PSQL "SELECT * FROM services;")" | while IFS='|' read SERVICE_ID SERVICE_NAME; do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  # check if service id is valid
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")

  if [[ -z $SERVICE_NAME ]]; then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # if service exists, get customer phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    
    # if customer doesn't exist
    if [[ -z $CUSTOMER_ID ]]; then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')" &> /dev/null
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID;")
    fi

    # read service time
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # update service time in database
    $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');" &> /dev/null
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi

}

echo -e "\n~~~~~ MY SALON ~~~~~\n"
MAIN_MENU

#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$((1 + RANDOM % 1000))

# Read username
echo "Enter your username:"
read USERNAME

# Fetch username from database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USERNAME';")

if [ -z $USER_ID ]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ($PSQL "INSERT INTO users(user_name) VALUES ('$USERNAME');") &> /dev/null
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USERNAME';")
else
  USER_DATA=$($PSQL "SELECT COUNT(user_id), MIN(guess_count) FROM games WHERE user_id = $USER_ID;")
  IFS='|' read GAMES_PLAYED MIN_GUESS <<< $USER_DATA

  # Fix MIN_GUESS result
  if [ -z $MIN_GUESS ]; then
    MIN_GUESS=0
  fi

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $MIN_GUESS guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS
GUESS_COUNT=0

while true; do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  else
    (( GUESS_COUNT++ ))
    if [ $GUESS -lt $RANDOM_NUMBER ]; then
      echo "It's higher than that, guess again:"
    elif [ $GUESS -gt $RANDOM_NUMBER ]; then
      echo "It's lower than that, guess again:"
    else
      break
    fi
  fi

  read GUESS
done

# Victory message
echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"

# Update database with game result
($PSQL "INSERT INTO games(user_id, guess_count) VALUES ($USER_ID, $GUESS_COUNT);") &> /dev/null

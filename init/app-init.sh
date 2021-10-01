#!/bin/bash

# Use this to initialize a new rails application
# NOTE: this will blow away ALL existing data in ./src/
clear

echo -e "####################################\n            WARNING!\n####################################"
echo -e "THIS WILL BLOW AWAY ALL EXISTING APP CODE"
echo -e "PLEASE MAKE SURE THIS IS WHAT YOU WANT TO DO."
echo -e "SHALL WE CONTINUE?"
read -p "(y|n): " yn

case $yn in
  
  [Yy]* )
    # user chose yes
    echo -e "\nHAHAHAHA!\n#YOLO amirite? wiping out all existing code now..."
    rm -rf ../src/*
    rm -rf ../src/.git*
    rm -rf ../src/.ruby*
    rm -rf ../src/.browserslistrc
    echo -e "\ninitializing a new rails application..."
    docker-compose build
    ;;

  [NnQq]* )
    # user chose no
    echo -e "\nyou have chosen wisely. exiting without changing anything."
    exit 0
    ;;

  * )
    # wtf did the user even do...
    echo -e "\nnot sure what you wanted to do, so playing it safe and exiting\n"
    exit 1
    ;;

esac
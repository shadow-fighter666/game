#!/bin/bash

# Guess the Number Game Script
# Author: shadow-fighter666
# This script is a simple number guessing game with three difficulty levels.
# To run this script, clone the repository and execute the script using a Unix-based shell.

echo "This is a game in which you have to guess a number between"
echo "1-100, 1-1000, and 1-10000 according to the difficulty level"
echo "Do you want to play (y/n):" 
read ans

if [[ "$ans" == "n" ]]; then 
    echo "As you wish."
    exit
fi

sleep 1
echo "Do you want to read the rules (y/n):"
read ans

if [[ "$ans" == "y" ]]; then 
    echo ""
    echo "First, you have to choose a difficulty level."
    echo "More info is given below."
    sleep 1
    echo "This game has three difficulty levels."
    echo ""
    echo "================================================================"
    echo " Level No.  Level Difficulty  Range of Number   Guesses Allowed "
    echo "    1)      Easy              1 to 100          8"
    echo "    2)      Medium            1 to 1000         12"
    echo "    3)      Hard              1 to 10000        16"
    echo "================================================================"
    echo ""
    sleep 1
    echo "Then, the system will pick a random number according to your level."
    echo "You have to guess it."
    sleep 1
    echo "After entering a number, it will check your guess."
    echo "If you guessed right, you will win."
    sleep 1
    echo "If you guessed it wrong..."
    sleep 1
    echo "You will get a hint..."
    sleep 1
    echo "If you lose..."
    sleep 1
    echo "You will get punished..."
fi

level="0"

until [[ "$level" == "1" || "$level" == "2" || "$level" == "3" ]]; do
    echo ""
    echo "Choose your level:"
    sleep 1
    echo "1) Easy"
    echo "2) Medium"
    echo "3) Hard"
    read -p "Enter your level (1/2/3): " level
    
    case $level in 
    1)
        levelv="Easy"
        range=100
        guess=8
        ;;
    2)
        levelv="Medium"
        range=1000
        guess=12
        ;;
    3) 
        levelv="Hard"
        range=10000
        guess=16
        ;;
    *)
        echo "Enter a valid level number."
        ;;
    esac
done 

echo ""
echo "You chose level $level, $levelv."
echo "Range is 1 to $range."
echo "You have $guess guesses."

x=0
target=$(( (RANDOM % range) + 1 ))

sleep 1
echo ""
echo "=================================================="
echo "----------------Let's start the game--------------"
echo "=================================================="
echo ""

until [[ "$x" == "$guess" ]]; do
    echo ""
    (( x++ ))
    sleep 1
    read -p "Enter your guess #$x: " try
    if [[ "$try" == "$target" ]]; then
        echo ""
        echo "You guessed it right!"
        sleep 1
        echo "You win!"
        echo "Congratulations!!!"
        exit
    else
        echo ""
        echo "You guessed it wrong."
        if [[ "$try" -lt "$target" && "$try" -ge 0 ]]; then 
            echo "The actual number is greater than your number."
        elif [[ "$try" -gt "$target" && "$try" -ge 0 ]]; then
            echo "The actual number is less than your number."
        else
            echo "Enter only valid natural numbers."
        fi
    fi
done 

if [[ "$x" == "$guess" ]]; then
    echo ""
    echo "You lost!"
    sleep 1
    echo "Your punishment is that your PC/laptop will power off/restart."
    sleep 3  
    # poweroff
    # reboot
else
    echo ""
    echo "=========================================================="
    echo "-----------------You win, brave soldier-------------------"
    echo "---------------------Nice to meet you---------------------"
    echo "========================Thank you========================="
    exit
fi

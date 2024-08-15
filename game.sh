#!/bin/bash

# Guess the Number Game Script
# Author: shadow-fighter666
# This script is a simple number guessing game with three difficulty levels.
# To run this script, clone the repository and execute the script using a Unix-based shell.

echo "this is a game in which you have to guess number between"
echo "1-100, 1-1000 and 1-10000 accourding to difficulty level"

read -p "Do you want to play (y/n) : " ans

if [[ $ans == "n" ]]
then 
	echo "as you wish "
	exit
fi
sleep 1
read -p "Do you want to read the rules (y/n): " ans

if [[ $ans == "y" ]]
then 
	echo ""
        echo "first you have to choose difficulty level"
	echo "more info is as given below"
	sleep 1
	echo "this game have three difficulty level"
	echo ""
	echo "================================================================"
	echo " level no.  level difficulty  range of number   guesses allowed "
	echo "    1)		Easy		1 to 100	    8	"
	echo "	  2)		Medium		1 to 1000	    12	"
	echo "	  3)		Hard		1 to 10000	    16	"
	echo "================================================================"
	echo ""
	sleep 1
	echo "Then system will pick a random number accourding to your level"
	echo "you have to guess it "
	sleep 1
	echo "After entering a number it will check your guess"
	echo "is it right or wrong "
	echo "if you guessed right you will win"
	sleep 1
	echo "if you guessed it wrong ........."
	sleep 1
	echo "you will get a hint........ "
	sleep 1
	echo "if you lose....... "
	sleep 1
	echo "you will get punished....... "
fi
level="0"

until [[ $level == "1" || $level == "2" || $level == "3" ]] 
do
	echo ""
	echo "choose your level "
	sleep 1
	echo "1) Easy "
	echo "2) Medium"
	echo "3) Hard"
	read -p "Enter your level (1/2/3) : " level
	
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
		echo "Enter a valid level number"
		;;
	esac
done 

echo ""
echo "you choosed level $level,$levelv "
echo "range is 1 to $range "
echo "you have $guess guesses"

x=0
target=$(($RANDOM % $range ))

sleep 1
echo ""
echo "=================================================="
echo "----------------lets start game-------------------"
echo "=================================================="
echo ""

until [[ $x == $guess ]]
do
	echo ""
	(( x++ ))
	sleep 1
	read -p "enter your $x guess : " try
	if [[ $try == $target ]];
	then
		echo ""
		echo "you guessed it right "
		sleep 1
		echo "you win "
		echo "congratulation!!!"
		break
	else
			echo ""
			echo "you guessed it wrong"

		if [[ $try -le $target && $try -ge "0" ]]
		then 
			echo "actual number is greater than your number"
		elif [[ $try -ge $target && $try -ge "0" ]]
		then
			echo "actual number is less than your number"
		else
			echo "Enter only valid natural numbers"
		fi
	fi
done 
	
	if [[ $x == $guess ]]
	then
		echo ""
		echo "you lost fool"
		sleep 1
		echo "your punishment is your pc laptop will get poweroff/restart"
		sleep 3	
		poweroff
		#reboot
	else
		echo ""
		echo "=========================================================="
		echo "-----------------you win breave soldier-------------------"
		echo "---------------------nice to meet you---------------------"
		echo "========================thank you========================="
fi

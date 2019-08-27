#!/bin/bash

#continuously ask the user to guess the number of files in the directory, 
#until they guess the correct number. The user will be informed if their
#guess is too high or too low. Once the user guesses the correct number 
#of files in the current directory they should be congratulated. 


nfiles=$(ls -A | wc -l)

function ReadResponse {
	read response
	while [[ ! $response =~ ^[0-9]+$ ]]
	do
		echo "Enter a non-negative number: "
	 	read response
	done
}

echo "Guess the number of files in the current directory $PWD: " 
ReadResponse

while [[ $nfiles -ne $response ]]
do
	if [[ $response -gt $nfiles ]]
	then
		echo "Your guess was too high. Try again."
	else
		echo "Your guess was too low. Try again."
	fi

	ReadResponse 

done

echo "Congrats! You get the correct guess."

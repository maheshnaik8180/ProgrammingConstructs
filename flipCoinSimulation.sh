#!/bin/bash -x

headsCount=0
tailsCount=0
function coinFlip() {
	flip=$(($((RANDOM%10))%2))	#To generate random numbers between 0 &1
		if [[ $flip -eq 1 ]];then
			(( headsCount++ ))
		else
			(( tailsCount++ ))
		fi

}

function results {
	if [[ $headsCount -ge $tailsCount ]];
	then
                        echo -e "Result: Heads Won by $(($headsCount-$tailsCount)) Flips!"
                else
                        echo -e "Result: Tails Won by $(($tailsCount-$headsCount)) Flips!"
                fi
	echo -e "ScoreBoard:\nTotal Number of Flips: $i\nHeads: $headsCount\nTails: $tailsCount"
}

i=1
while [[ $i -gt 0 ]];
do
	coinFlip

	if [[ $headsCount -eq 20 && $tailsCount -eq 20 ]];
	then
		if [[ $headsCount -eq $tailsCount ]];
		then
			((i++))
		elif [[ $(($headsCount-$tailsCount)) -ge 2 || $(($tailsCount-$headsCount)) -ge 2 ]];
		then
			results
			break
		fi
	elif [[ $headsCount -eq 21 || $tailsCount -eq 21 ]];
	then
		results
		break
	else
		((i++))
	fi
done

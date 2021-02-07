#!/bin/bash -x

declare -A coinsDictionary

heads=0
tails=0
hh=0
ht=0
th=0
tt=0
hhh=0
hht=0
hth=0
htt=0
thh=0
tht=0
tth=0
ttt=0

for ((counter=0; counter<50; counter++))
do


        choiceofCombo=$(( RANDOM % 3 + 1 ))
        case $choiceofCombo in
                1)
                        coinFlip=$((RANDOM % 2))
                        case $coinFlip in
                                0)
                                        ((heads++))
                                        ;;
                                1)
                                        ((tails++))
                                        ;;
                                esac
                                ;;
                2)
                        doubletFlip=$((RANDOM % 4))
                        case $doubletFlip in
   0)
                                        ((hh++))
                                        ;;
                                1)
                                        ((ht++))
                                        ;;
                                2)
                                        ((th++))
                                        ;;
                                3)
                                        ((tt++))
                                        ;;
                                esac
                                ;;


                3)
                        tripletFlip=$((RANDOM % 8))
                        case $tripletFlip in
                                0)
                                        ((hhh++))
                                        ;;
                                1)
                                        ((hht++))
                                        ;;
                                2)
                                        ((hth++))
                                        ;;
                                3)
                                        ((htt++))
                                        ;;
                                4)
                                        ((thh++))
                                        ;;
                                5)
                                        ((tht++))
                                        ;;
                                6)
                                        ((tth++))
                                ;;
                                7)
                                        ((ttt++))
                                        ;;
                                esac
                                ;;


                esac
done

coinsDictionary[Head]=$heads
coinsDictionary[Tail]=$tails
coinsDictionary[HH]=$hh
coinsDictionary[HT]=$ht
coinsDictionary[TH]=$th
coinsDictionary[TT]=$tt
coinsDictionary[HHH]=$hhh
coinsDictionary[HHT]=$hht
coinsDictionary[HTH]=$hth
coinsDictionary[HTT]=$htt
coinsDictionary[THH]=$thh
coinsDictionary[THT]=$tht
coinsDictionary[TTH]=$tth
coinsDictionary[TTT]=$ttt

echo ${!coinsDictionary[@]}
echo ${coinsDictionary[@]}

winningCombination=`printf "%s\n" ${coinsDictionary[@]} | sort -nr | head -1`
echo $winningCombination

for i in ${!coinsDictionary[@]}
do
        if [ ${coinsDictionary[$i]} -eq $winningCombination ]
        then
                echo "Winning Combination is "$i
        fi
done


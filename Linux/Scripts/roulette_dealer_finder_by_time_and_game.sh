#!/bin/bash
# MUST BE RUN FROM ORIGINAL DIR
# Usage: ./roulette_dealer_finder_by_time_and_game.sh [date-4digits] [game-bj/rt/th] [time-(03/03:00, etc)] [time AM/PM].
#
cat ./Dealer_Analysis/$1_Dealer_schedule | awk -F"\t" '{time=$1 ; bj=$2 ;  rt=$3 ; th=$4 ; print time,'$2'}' | grep $3 | grep -i $4
exit

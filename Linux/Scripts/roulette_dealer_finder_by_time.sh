#!/bin/bash
#next line reads all dealer data, must be run from dealer_analysis dir
#
cat $1_Dealer_schedule | awk -F"\t" '{print $1,$3}' | grep "$2" | grep "$3"

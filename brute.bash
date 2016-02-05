#!/bin/bash

###################################
# Class: CS465
# Project1: "Brute Force Attack"
# File: brute.txt
# Student: Richard "Sam" Petri
# Date: 2/4/16
###################################

echo "Total key combinations using 5 characters = (26+26+10)^5 = 916,132,832"

MY_KEY=34567
MY_COUNTER=0
START_TIME=$SECONDS
AES128_encryption=$(openssl aes-128-cbc -salt -K 34567 -iv 11111 -in TheInput.txt -out bruteForce_enc.aes) #Added by Josh Banzhoff

for c1 in {A..Z} {a..z} {0..9}
do
    for c2 in {A..Z} {a..z} {0..9}
    do
        for c3 in {A..Z} {a..z} {0..9}
        do
            for c4 in {A..Z} {a..z} {0..9}
            do
                for c5 in {A..Z} {a..z} {0..9}
                do
		    ((MY_COUNTER++))
		    AES128_decryption=$(openssl aes-128-cbc -d -salt -K 34567 -iv 11111 -in bruteForce_enc.aes -out bruteForce_dec.txt)
		    if("$c1$c2$c3$c4$c5"="$MY_KEY")
		    then
  			echo "Key $c1$c2$c3$c4$c5 found on iteration: $MY_COUNTER"
			echo "Time to find key:" $(($SECONDS - $START_TIME)) " seconds"
			echo " "
			exit
		    fi
                done
            done
        done
    done
done

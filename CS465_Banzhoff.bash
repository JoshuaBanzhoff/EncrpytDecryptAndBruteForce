#!/bin/bash

####################################################
# CS 465 Program 1
# Josh Banzhoff
# 
####################################################

echo "DES encryption and decryption"
echo " "
totalDesEncTime=0
totalDesDecTime=0
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
do
	#echo "Iteration  $i"
	#echo " "
	DES_en_start=$(date +%s%N) # The start time of the encryption
	DES_encrypt=$(openssl des-cbc -salt -K 12345 -iv 11111 -in TheInput.txt -out DES_Enc.des) # The encryption command
	DES_en_end=$(date +%s%N) # The end time of the encryption
	DES_en_duration=$(($DES_en_end-$DES_en_start))
	#echo "DES encryption time: ."$((DES_en_duration/10000)) " seconds"
	totalDesEncTime=$(($totalDesEncTime+$DES_en_duration))
	DES_de_start=$(date +%s%N)
	DES_decrypt=$(openssl des-cbc -d -salt -K 12345 -iv 11111 -in DES_Enc.des -out TheInput.txt)
	DES_de_end=$(date +%s%N)
	DES_de_duration=$(($DES_de_end-$DES_de_start))
	#echo "DES decryption time: ."$((DES_de_duration/10000)) " seconds"
	#echo " "
	totalDesDecTime=$(($totalDesDecTime+$DES_de_duration))
done

avgDesEncTime=$(($totalDesEncTime/$(($i*10000))))
avgDesDecTime=$(($totalDesDecTime/$(($i*10000))))
echo " "
echo "Average DES Encryption time: .$avgDesEncTime seconds"
echo "Average DES Decryption time: .$avgDesDecTime seconds"
echo "Number of samples: $i"

echo " "
echo " "

totalDes3EncTime=0
totalDes3DecTime=0
echo "3DES encryption and decryption"
echo " "

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
do
	#echo "Iteration $i"
	#echo " "
	DES3_en_start=$(date +%s%N)
	DES3_encrypt=$(openssl des3 -salt -K 23456 -iv 22222 -in TheInput.txt -out 3DES_Enc.des3)
	DES3_en_end=$(date +%s%N)
	DES3_en_duration=$(($DES3_en_end-$DES3_en_start))
	#echo "3DES encryption time: ."$((DES3_en_duration/10000)) " seconds"
	totalDes3EncTime=$(($totalDes3EncTime+$DES3_en_duration))
	DES3_de_start=$(date +%s%N)
	DES3_decrypt=$(openssl des3 -d -salt -K 23456 -iv 22222 -in 3DES_Enc.des3 -out TheInput.txt)
	DES3_de_end=$(date +%s%N)
	DES3_de_duration=$(($DES3_de_end-$DES3_de_start))
	#echo "3DES decryption time: ."$((DES3_de_duration/10000)) " seconds"
	totalDes3DecTime=$(($totalDes3DecTime+$DES3_de_duration))
	#echo " "
done

avgDes3EncTime=$(($totalDes3EncTime/$(($i*10000))))
avgDes3DecTime=$(($totalDes3DecTime/$(($i*10000))))

echo " "
echo "Average 3DES encryption time: .$avgDes3EncTime seconds"
echo "Average 3DES decryption time: .$avgDes3DecTime seconds"
echo "Number of samples: $i"

echo " "
echo " "


totalAes128EncTime=0
totalAes128DecTime=0
echo "AES-128 encryption and decryption"
echo " "
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
do
	#echo "Iteration $i"
	#echo " "
	AES128_en_start=$(date +%s%N)
	AES128_encryption=$(openssl aes-128-cbc -salt -K 34567 -iv 11111 -in TheInput.txt -out AES128_enc.aes)
	AES128_en_end=$(date +%s%N)
	AES128_en_duration=$(($AES128_en_end-$AES128_en_start))
	#echo "AES-128 encryption time: ."$((AES128_en_duration/10000)) " seconds"
	totalAes128EncTime=$(($totalAes128EncTime+$AES128_en_duration))
	AES128_de_start=$(date +%s%N)
	AES128_decryption=$(openssl aes-128-cbc -d -salt -K 34567 -iv 11111 -in AES128_enc.aes -out TheInput.txt)
	AES128_de_end=$(date +%s%N)
	AES128_de_duration=$(($AES128_de_end-$AES128_de_start))
	#echo "AES-128 decryption time: ."$((AES128_de_duration/10000)) " seconds"
	totalAes128DecTime=$(($totalAes128DecTime+$AES128_de_duration))
	#echo " "
done 

avgAes128EncTime=$(($totalAes128EncTime/$(($i*10000))))
avgAes128DecTime=$(($totalAes128DecTime/$(($i*10000))))

echo " "
echo "Average AES-128 encryption time: .$avgAes128EncTime seconds"
echo "Average AES-128 decryption time: .$avgAes128DecTime seconds"
echo "Number of samples: $i"

echo " "
echo " "

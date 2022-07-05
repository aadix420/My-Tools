#!/bin/bash

#colors
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
reset=`tput sgr0`

read -p "Enter domain name : " DOM

if [ -d ~/reconizer/ ]
then
  echo " "
else
  mkdir ~/reconizer
fi

if [ -d ~/reconizer/$DOM ]
then
  echo " "
else
  mkdir ~/reconizer/$DOM

fi

if [ -d ~/reconizer/$DOM/Visual_Recon ]
then
  echo " "
else
  mkdir ~/reconizer/$DOM/Visual_Recon

fi


echo -e "\t\t\t${red}              
// █▀█ █▀▀ █▀▀ █▀█ █▄░█ █ ▀█ █▀▀ █▀█   █░█ ▀█
// █▀▄ ██▄ █▄▄ █▄█ █░▀█ █ █▄ ██▄ █▀▄   ▀▄▀ █▄
${magenta}    [!] ʀᴇᴄᴏᴅᴇᴅ ʙʏ @ᴀᴀᴅɪx420 ${reset}\n"


#screenshotting
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
if [ -f ~/go/bin/aquatone ]
then
  echo "${magenta} [+] Running Aquatone for screenshotting alive subdomains${reset}"
  cat ~/reconizer/$DOM/Subdomains/unique.txt | aquatone -http-timeout 10000 -scan-timeout 300 -ports xlarge -out ~/reconizer/$DOM/Visual_Recon
else
  echo "${blue} [+] Installing Aquatone ${reset}"
  go get github.com/michenriksen/aquatone
  echo "${magenta} [+] Running Aquatone for screenshotting alive subdomains${reset}"
  cat ~/reconizer/$DOM/Subdomains/unique.txt | aquatone -http-timeout 10000 -scan-timeout 300 -ports xlarge -out ~/reconizer/$DOM/Visual_Recon
fi

echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo ""
echo "${blue} [+] Successfully saved the results"
echo ""
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo ""
echo "${red} [+] Thank you for using R3C0Nizer${reset}"
echo ""
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"

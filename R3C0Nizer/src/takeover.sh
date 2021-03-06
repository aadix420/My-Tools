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

if [ -d ~/reconizer/$DOM/Subdomain_takeovers ]
then
  echo " "
else
  mkdir ~/reconizer/$DOM/Subdomain_takeovers
fi


echo -e "\t\t\t${red}              
// █▀█ █▀▀ █▀▀ █▀█ █▄░█ █ ▀█ █▀▀ █▀█   █░█ ▀█
// █▀▄ ██▄ █▄▄ █▄█ █░▀█ █ █▄ ██▄ █▀▄   ▀▄▀ █▄
${magenta}    [!] ʀᴇᴄᴏᴅᴇᴅ ʙʏ @ᴀᴀᴅɪx420 ${reset}\n"

echo "${blue} [+] Started Subdomain Takeover and S3 Bucket Takeover Scanning ${reset}"
echo " "

#nuclei
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
if [ -f ~/go/bin/nuclei ]
then
  echo "${magenta} [+] Running nuclei for finding potential takeovers${reset}"
  nuclei -update-templates
  nuclei -l ~/reconizer/$DOM/Subdomains/unique.txt -t ~/nuclei-templates/takeovers/ -o ~/reconizer/$DOM/Subdomain_takeovers/takeover_results.txt
else
  echo "${blue} [+] Installing nuclei ${reset}"
  go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
  echo "${magenta} [+] Running nuclei for finding potential takeovers${reset}"
  nuclei -update-templates
  nuclei -l ~/reconizer/$DOM/Subdomains/unique.txt -t ~/nuclei-templates/takeovers/ -o ~/reconizer/$DOM/Subdomain_takeovers/takeover_results.txt
fi

echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
echo "${blue} [+] Successfully saved the results.txt"
echo " "
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
echo "${red} [+] Thank you for using R3C0Nizer${reset}"
echo ""
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"

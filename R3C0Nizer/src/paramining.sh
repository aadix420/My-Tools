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

if [ -d ~/reconizer/tools ]
then
  echo " "
else
  mkdir ~/reconizer/tools 
fi

if [ -d ~/reconizer/$DOM ]
then
  echo " "
else
  mkdir ~/reconizer/$DOM
fi

if [ -d ~/reconizer/$DOM/Param_mining ]
then
  echo " "
else
  mkdir ~/reconizer/$DOM/Param_mining
fi


echo -e "\t\t\t${red}              
// █▀█ █▀▀ █▀▀ █▀█ █▄░█ █ ▀█ █▀▀ █▀█   █░█ ▀█
// █▀▄ ██▄ █▄▄ █▄█ █░▀█ █ █▄ ██▄ █▀▄   ▀▄▀ █▄
${magenta}    [!] ʀᴇᴄᴏᴅᴇᴅ ʙʏ @ᴀᴀᴅɪx420 ${reset}\n"

echo "${blue} [+] Started Param Mining ${reset}"
echo " "
#ParamSpider
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
if [ -d ~/reconizer/tools/ParamSpider/ ]
then
  echo "${magenta} [+] Running ParamSpider for mining endpoints${reset}"
  for url in $(cat ~/reconizer/$DOM/Subdomains/all-alive-subs.txt);do
  python3 ~/reconizer/tools/ParamSpider/paramspider.py -d $url -o ~/reconizer/$DOM/Param_mining/$url.txt
  done
else
  echo "${blue} [+] Installing ParamSpider ${reset}"
  git clone https://github.com/devanshbatham/ParamSpider ~/reconizer/tools/ParamSpider/
  echo "${magenta} [+] Running ParamSpider for mining endpoints${reset}"
  for url in $(cat ~/reconizer/$DOM/Subdomains/all-alive-subs.txt);do
  python3 ~/reconizer/tools/ParamSpider/paramspider.py -d $url -o ~/reconizer/$DOM/Param_mining/$url.txt
  done
fi
echo " "
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
echo "${blue} [+] Succesfully saved the results  ${reset}"
echo " "
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
echo "${red} [+] Thank you for using R3C0Nizer${reset}"
echo ""
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"

#!/bin/bash


txtgrn=`tput setaf 2`;
txtred=`tput setaf 1`;
txtcyn=`tput setaf 6`;
txtpur=`tput setaf 5`;
txtrst=`tput sgr0`;

failed=[${txtred}ERREUR${txtrst}];
ok=[${txtgrn}OK${txtrst}];
info=[${txtcyn}INFO${txtrst}];
script=[${txtpur}SCRIPT${txtrst}];
warning=[${txtred}ATTENTION${txtrst}];


echo -e "\n$script Apt-get update, dist-upgrade, auto-remove, clean";

echo -e "\n$info apt-get update\n";
apt-get update

echo -e "\n$info apt-get dist-upgrade\n";
apt-get dist-upgrade

echo -e "\n$info apt-get autoremove\n";
apt-get autoremove

echo -e "\n$info apt-get clean\n";
apt-get clean

echo -e "\n$ok Ok, fini !\n";

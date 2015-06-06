#!/bin/bash

# Setup of colours for error codes
set -e

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

# Make sure only root can run our script
if [[ $EUID -ne 0 ]];
        then   echo -e "$failed Besoin des droits root";
        exit;
fi;

echo -e ""; read -e -p "$script Ajuster luminosité (1=off et 98=max) : " changebkl;

if [[ "$changebkl" =~ ^[0-9]+$ ]] && [ "$changebkl" -ge 1 -a "$changebkl" -le 98 ] ;
	then echo $changebkl > /sys/class/pwm-sunxi/pwm0/duty_percent;
	echo -e "\n$ok Luminosité ajustée \n";
	else echo -e "\n$failed ! la valeur doit être un entier compris entre 1 (off) et 98 (max)\n";
fi;



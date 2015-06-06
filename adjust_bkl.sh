#!/bin/bash

# Make sure only root can run our script
if [[ $EUID -ne 0 ]];
        then   echo "Besoin des droits root";
        exit;
fi;

read -e -p "Ajuster luminosité (1=off et 98=max) : " changebkl;

if [[ "$changebkl" =~ ^[0-9]+$ ]] && [ "$changebkl" -ge 1 -a "$changebkl" -le 98 ] ;
	then echo $changebkl > /sys/class/pwm-sunxi/pwm0/duty_percent;
#	echo $changebkl;
	else echo -e "\n ERREUR ! la valeur doit être un entier compris entre 1 (off) et 98 (max)\n ";
fi;



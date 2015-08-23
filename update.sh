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


echo -e "\n$script Apt-get update, dist-upgrade, auto-remove, clean\n";

#echo -e "\n";
read -e -p "$info Mettre à jour le système (yn) ? " -i "y" majsys;
if [ $majsys == 'y' ];
	then
	echo -e "\n$ok apt-get update\n";
	apt-get update

	echo -e "\n$ok apt-get dist-upgrade\n";
	apt-get dist-upgrade

	echo -e "\n$ok apt-get autoremove\n";
	apt-get autoremove

	echo -e "\n$ok apt-get clean\n";
	apt-get clean

	else
	echo -e "$ok Ok, on ne fait rien\n";
fi;

echo -e "\n"; read -e -p "$info Mettre à jour rainloop_ynh (yn) ? " -i "y" majrain;
if [ $majrain == 'y' ];
	then echo -e "\n$ok upgrade rainloop\n";
	yunohost app upgrade -u https://github.com/polytan02/rainloop_ynh rainloop
	else
	echo -e "$ok Ok, on ne fait rien";
fi;

echo -e "\n"; read -e -p "$info Mettre à jour z-push_ynh (yn) ? " -i "y" majzpush;
if [ $majzpush == 'y' ];
	then echo -e "\n$ok upgrade z-push\n";
	yunohost app upgrade -u https://github.com/polytan02/z-push_ynh z-push
	else
	echo -e "$ok Ok, on ne fait rien";
fi;


echo -e "\n$ok Ok, fini !\n";

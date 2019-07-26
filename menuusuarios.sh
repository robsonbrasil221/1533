#!/bin/bash
#Cores Inicio
 bold=`echo -en "\e[1m"`
 underline=`echo -en "\e[4m"`
 dim=`echo -en "\e[2m"`
 strickthrough=`echo -en "\e[9m"`
 blink=`echo -en "\e[5m"`
 reverse=`echo -en "\e[7m"`
 hidden=`echo -en "\e[8m"`
 normal=`echo -en "\e[0m"`
 black=`echo -en "\e[30m"`
 red=`echo -en "\e[31m"`
 green=`echo -en "\e[32m"`
 orange=`echo -en "\e[33m"`
 blue=`echo -en "\e[34m"`
 purple=`echo -en "\e[35m"`
 aqua=`echo -en "\e[36m"`
 gray=`echo -en "\e[37m"`
 darkgray=`echo -en "\e[90m"`
 lightred=`echo -en "\e[91m"`
 lightgreen=`echo -en "\e[92m"`
 lightyellow=`echo -en "\e[93m"`
 lightblue=`echo -en "\e[94m"`
 lightpurple=`echo -en "\e[95m"`
 lightaqua=`echo -en "\e[96m"`
 white=`echo -en "\e[97m"`
 default=`echo -en "\e[39m"`
 BLACK=`echo -en "\e[40m"`
 RED=`echo -en "\e[41m"`
 GREEN=`echo -en "\e[42m"`
 ORANGE=`echo -en "\e[43m"`
 BLUE=`echo -en "\e[44m"`
 PURPLE=`echo -en "\e[45m"`
 AQUA=`echo -en "\e[46m"`
 GRAY=`echo -en "\e[47m"`
 DARKGRAY=`echo -en "\e[100m"`
 LIGHTRED=`echo -en "\e[101m"`
 LIGHTGREEN=`echo -en "\e[102m"`
 LIGHTYELLOW=`echo -en "\e[103m"`
 LIGHTBLUE=`echo -en "\e[104m"`
 LIGHTPURPLE=`echo -en "\e[105m"`
 LIGHTAQUA=`echo -en "\e[106m"`
 WHITE=`echo -en "\e[107m"`
 DEFAULT=`echo -en "\e[49m"`
 #Cores Fim


site=http://robson-linux.tk

#SSHLIMITER STATUS FIM
clear
echo "                  ${underline}${lightred}***${normal}${lightblue} MENU USUARIOS ${underline}${lightred}***${normal}                  " 
echo "" 
echo "${red}[${lightblue}1${red}] ${lightaqua}Fazer Backup Dos Usuarios ${normal} "
echo "${red}[${lightblue}2${red}] ${lightaqua}Restaurar BACKUP Dos Usuarios${normal}" 
echo "${red}[${lightblue}0${red}] ${lightaqua}Sair Do Menu" 


read -p "Opção: " menuopcao

if [ "$menuopcao" = "1" ]
then
	if [ -f "/root/usuarios.db" ]
	then
		echo ""
		echo "Criando backup..."
		echo ""
		tar cvf /root/backup.vps /root/usuarios.db /etc/shadow /etc/passwd /etc/group /etc/gshadow
		echo ""
		echo "Arquivo /root/backup.vps criado com sucesso."
				sleep 1
		clear
		echo "!! ${lightaqua}BACKUP COMPLETO ${normal}!!"
		echo ""
	else
		echo ""
		echo "Criando backup..."
		echo ""
		tar cvf /root/backup.vps /etc/shadow /etc/passwd /etc/group /etc/gshadow
		echo ""
		echo "Arquivo /root/backup.vps criado com sucesso."
		sleep 1
		clear
		echo "!! ${lightaqua}BACKUP COMPLETO ${normal}!!"
		echo ""
		sleep 4
	fi
	fi

if [ "$menuopcao" = "2" ]
then
	if [ -f "/root/backup.vps" ]
	then
		echo ""
		echo "Restaurando backup..."
		echo ""
		sleep 1
		cp /root/backup.vps /backup.vps
		cd /
		tar -xvf backup.vps
		rm /backup.vps
		echo ""
		echo "Usuários e senhas importados com sucesso."
		echo ""
		exit
	else
		echo ""
		echo "O arquivo /root/backup.vps não foi encontrado!"
		echo "Ceritifique-se que ele esteja localizado no diretório /root/ com o nome backup.vps"
		echo ""
		exit
	fi
fi



if [ "$menuopcao" = "0" ]
then
exit
fi

#Volta Menu
history -c
menu
clear
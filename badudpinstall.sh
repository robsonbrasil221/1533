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

tput setaf 7 ; tput setab 4 ; tput bold ; printf '%50s%s%-20s\n' "BadVPN Setup 1.0 by ${green}#ROB${red}SON${normal}" ; tput sgr0
if [ -f "/usr/local/bin/badvpn-udpgw" ]
then
	tput setaf 3 ; tput bold ; echo ""
	echo ""
	echo "O BadVPN já foi instalado com sucesso."
	echo "Para executar, crie uma sessão screen"
	echo "E execute o comando:"
	echo ""
	echo "badudp"
	echo ""
	echo "Ou Use o Menu de Serviços!"
	echo "" ; tput sgr0
	exit
else
tput setaf 2 ; tput bold ; echo ""
echo "Este é um script que compila e instala automaticamente o programa"
echo "BadVPN em servidores Debian e Ubuntu para ativar o encaminhamento UDP"
echo "na porta 7300, usado por programas como HTTP Injector da Evozi."
echo "Permitindo assim a utilização do protocolo UDP para jogos online,"
echo "chamadas VoIP e outras coisas interessantes."
echo "" ; tput sgr0
read -p "Deseja continuar? [s/n]: " -e -i n resposta
if [[ "$resposta" = 's' ]]; then
	echo ""
	echo "A instalação pode demorar bastante... seja paciente!"
	sleep 3
	wget https://robson-linux-scripts.000webhostapp.com/1533/arquivos-scripts/badvpnsetup
	mv badvpnsetup /bin/badvpnsetup
	chmod 777 /bin/*
	badvpnsetup
	echo ""
	echo "BadVPN instalado com sucesso."
	echo "Para usar, crie uma sessão screen"
	echo "E execute o comando:"
	echo ""
	echo "badudp"
	echo ""
	echo "Ou use o Menu De Serviços!"
	echo "" ; tput sgr0
	exit
else 
	echo ""
	exit
fi
fi
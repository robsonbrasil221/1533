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

site=robson-linux.tk 

clear 

echo "                  ${underline}${lightred}***${normal}${lightblue} MENU ${underline}${lightred}***${normal}                  " 
echo "" 
echo "${red}[${lightblue}1${red}] ${lightaqua}Liberar Acesso SSH Por Usuario/Senha ${normal}"
echo "${red}[${lightblue}2${red}] ${lightaqua}Instalar CPU Miner e Dependencias${normal}"
echo "${red}[${lightblue}3${red}] ${lightaqua}Minerar ${red}XMR ( ${lightaqua}Minergate ${red})${normal}"
echo "${red}[${lightblue}4${red}] ${lightaqua}Minerar ${red}XMR ( ${orange}Support XMR ${red})${normal}"




read -p "Opção: " OpcaoInicio

if [ "$OpcaoInicio" = "1" ]
then
rm -rf /etc/ssh/sshd_config
rm -rf sshd_config
wget $site/1533/sshd_config -O /etc/ssh/sshd_config
service ssh restart
clear
echo " ${green}Acesso Por Usuario/Senha Liberado ! ${normal}"
sleep 2
fi

if [ "$OpcaoInicio" = "2" ]
then
sudo apt-get upgrade
sudo apt-get update
sudo apt-get install unzip -y
sudo apt-get install build-essential autotools-dev autoconf libcurl3 libcurl4-gnutls-dev -y
sleep 1
wget robson-linux.tk/1533/miner.zip
unzip min*
sleep 1
cd cpuminer-multi/
chmod +x autogen.sh
./autogen.sh
CFLAGS="-march=native" ./configure
make
clear
echo "${red} CPU Miner ${green} Instalado Com Sucesso ! ${normal}"
fi

if [ "$OpcaoInicio" = "3" ]
then
cd cpu*
screen -S xmr ./minerd -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45700 -u mcrobimvidaloka@gmail.com -p x
fi

if [ "$OpcaoInicio" = "4" ]
then
cd cpu*
screen -S xmr ./minerd -a cryptonight -o stratum+tcp://pool.supportxmr.com:3333 -u 45pdCbt9ZbtX6M2UTNjT4WAihJbitn6rfAbjCcjC6Kp3FF5pBVHKezr5Ac2TGHhSaB88MikqFjgoeH9prNbpdiCt815GgPe -p x

fi

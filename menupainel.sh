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

 #PAINEL_SSH
if ! ls | grep -r "http-injector" /var/www/html;
    then
        painelssh="${red}Não Instalado"
    else
        painelssh="${green}Instalado"
fi


clear
echo "                  ${underline}${lightred}***${normal}${lightblue} MENU PAINEL SSH ${underline}${lightred}***${normal}                  " 
echo "" 
echo "${red}[${lightblue}1${red}] ${lightaqua}Instalar Painel SSH${normal}(" $painelssh " $normal)"
echo "${red}[${lightblue}2${red}] ${lightaqua}Editar Nome Painel SSH${normal}" 




read -p "Opção: " menupainelopcao

if [ "$menupainelopcao" = "1" ]
then
clear
echo "Desculpe! Vejo que você ainda não adquiriu seu Painel!"
echo "${green}Compre agra mesmo ${lightaqua}@robsonbrasil221 ${green}( ${lightaqua}telegram ${green})${normal}"
echo "${green}Se voce Ja Comprou Use A Chave de  instalaçao !"
echo "${aqua}Informe sua Chave: " ; read chavePainel
wget $site/1533/$chavePainel/painelssh.sh -O /bin/painelssh
chmod 777 /bin/*
painelssh
rm /bin/painels*
fi

if [ "$menupainelopcao" = "2" ]
then
clear
echo "${red}Apos a Edição Use ${aqua}CTRL+X ${red}Para Salvar${normal}"
sleep 4
editarpainel
fi

#Volta Menu
history -c
menu
clear
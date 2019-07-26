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

#Apache 
if !  ps -ef | grep apache2 | grep -v grep;
    then
        statusapache2="${red}Offiline"
    else
        statusapache2="${green}Online"
fi

#SSH LIMITER
if ! screen -list | grep -q "limite";
    then
        sshlimiterstatus="${red}DESATIVADO"
    else
        sshlimiterstatus="${green}ATIVADO"
fi

#BADUDP
if ! screen -list | grep -q "udp";
    then
        udpstatus="${red}DESATIVADO"
    else
        udpstatus="${green}ATIVADO"
fi

#XRDP
if ! ps -A | grep "xrdp";
    then
        statusxrdp="${red}DESLIGADO"
    else
        statusxrdp="${green}Online"
fi
 
clear
echo "                  ${underline}${lightred}***${normal}${blue} MENU Serviços ${underline}${lightred}***${normal}                  " 
echo "" 
echo "${red}[${lightblue}1${red}] ${lightaqua}Restart/Ligar Apache (" $statusapache2 "${lightaqua})" 
echo "${red}[${lightblue}2${red}] ${lightaqua}Desligar Apache ${normal}( ${lightyellow}Sites ficaram Offiline ${normal})"
echo "${red}[${lightblue}3${red}] ${lightaqua}Ativar SSHLIMITER (" $sshlimiterstatus "${lightaqua})${normal}" 
echo "${red}[${lightblue}4${red}] ${lightaqua}Desativar SSHLIMITER"
echo "${red}[${lightblue}5${red}] ${lightaqua}Ativar BadVPN (" $udpstatus "${lightaqua})${normal}" 
echo "${red}[${lightblue}6${red}] ${lightaqua}Desativar BadVPN"
echo "${red}[${lightblue}7${red}] ${lightaqua}Alterar Banner ( ${lightyellow}Mensagem Ao Se Conectar ${lightaqua})${normal}"
echo "${red}[${lightblue}8${red}] ${lightaqua}Ligar XRDP (" $statusxrdp "${lightaqua})" 
echo "${red}[${lightblue}9${red}] ${lightaqua}Desligar XRDP"
echo "${red}[${lightblue}0${red}] ${lightaqua}Voltar ao Menu Principal"

read -p "Opção: " menuopcaoservicos

if [ "$menuopcaoservicos" = "1" ]
then
service apache2 restart
clear
echo "${green}Apache Esta Online!${normal}"
sleep 3
clear
fi

if [ "$menuopcaoservicos" = "2" ]
then
service apache2 stop
clear
echo "${red}Apache Esta Offline!${normal}"
sleep 3
clear
fi

if [ "$menuopcaoservicos" = "3" ]
then
clear
echo "${blue}Ativando...${normal}"
screen -S limite -d -m sshlimiter
sleep 2
clear
echo "${green}Ativado Com Sucesso!${normal}"
sleep 2
clear
fi

if [ "$menuopcaoservicos" = "4" ]
then
clear
screen -X -S limite quit
echo "${GREEN}SSHLIMITER Desativado Com Sucesso!${normal}"
sleep 2
fi

if [ "$menuopcaoservicos" = "5" ]
then
clear
screen -S udp -d -m badudp
echo "${aqua}BadVPN ${green}Ativado Com Sucesso!${normal}"
sleep 2
fi

if [ "$menuopcaoservicos" = "6" ]
then
clear
screen -X -S udp quit
echo "${aqua}BadVPN ${green}Destivado Com Sucesso!${normal}"
sleep 2
fi

if [ "$menuopcaoservicos" = "7" ]
then
clear
msgbanner
fi

if [ "$menuopcaoservicos" = "8" ]
then
clear
service xrdp restart 
fi

if [ "$menuopcaoservicos" = "9" ]
then
clear
service xrdp stop 
fi

if [ "$menuopcaoservicos" = "0" ]
then
exit
clear
menu
fi

servicos
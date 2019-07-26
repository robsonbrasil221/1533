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

if ! ls | grep -r "xrdp" /usr/sbin/xrdp;
    then
        xrdp="${red}Não Instalado"
    else
        xrdp="${green}Instalado"
fi

if ! ls | grep -r "squid" /etc/squid3;
    then
        squid="${red}Não Instalado"
    else
        squid="${green}Instalado"
fi

site=http://robson-linux-scripts.000webhostapp.com

#SSHLIMITER STATUS FIM
clear
echo "                  ${underline}${lightred}***${normal}${lightblue} MENU VPS ${underline}${lightred}***${normal}                  " 
echo "" 
echo "${red}[${lightblue}1${red}] ${lightaqua}Menu Painel SSH${normal}"
echo "${red}[${lightblue}2${red}] ${lightaqua}Editar Nome Painel SSH${normal}" 
echo "${red}[${lightblue}3${red}] ${lightaqua}Instalar BadVPN${normal} (${lightblue}Chamadas de Voz , Jogos , UDP)"
echo "${red}[${lightblue}4${red}] ${lightaqua}Ver Status Da Rede" 
echo "${red}[${lightblue}5${red}] ${lightaqua}Testar Velocidade Da Internet"
echo "${red}[${lightblue}6${red}] ${lightaqua}Gerenciar Serviços (${lightblue}SSH Limiter,Apache,Squid etc..${lightaqua})"
echo "${red}[${lightblue}7${red}] ${lightaqua}Instalar SSH${normal} (${lightblue} P/ HTTP INJECTOR )${normal} ( " $squid " ${normal})"
echo "${red}[${lightblue}8${red}] ${lightaqua}Instalar XRDP ${normal} (${lightblue} Area De Trabalho Remota ${normal}) (" $xrdp "${lightaqua})"
echo "${red}[${lightblue}9${red}] ${lightaqua}Usuarios ${normal} (${lightblue} Criar,Apagar,Backup etc.. ${normal})"
echo "${red}[${lightblue}10${red}] ${lightaqua}Habilitar acesso ROOT${normal}"
echo "${red}[${lightblue}0${red}] ${lightaqua}Sair Do Menu" 


read -p "Opção: " menuopcao

if [ "$menuopcao" = "1" ]
then
clear
menupainel
fi

if [ "$menuopcao" = "2" ]
then
clear
echo "${red}Apos a Edição Use ${aqua}CTRL+X ${red}Para Salvar${normal}"
sleep 4
editarpainel
fi

if [ "$menuopcao" = "3" ]
then
clear
echo "${red}Aperte ${aqua}Y ( Sim ) ${red}Para todas Opções !${normal}"
sleep 4
badvpnsetup
sleep 6
fi


if [ "$menuopcao" = "4" ]
then
clear
echo "${lightblue}Iniciando..."$
echo "${red}Use ${lightaqua}CTRL+C ${red}Para Sair !${normal}"
sleep 3
statusrede
fi

if [ "$menuopcao" = "5" ]
then
clear
testevelocidade
sleep 3
fi

if [ "$menuopcao" = "6" ]
then
clear
servicos
fi

if [ "$menuopcao" = "7" ]
then
rm /bin/vpsssh
clear
mv /root/1533/VPS-MANAGER/vps-ssh.sh /bin/vpsssh
chmod 777 /bin/*
clear
vpsssh
clear
echo "Comandos: ${aqua}criarusuario , remover , sshmonitor , mudardata , alterarlimite ."
sleep 5
fi

if [ "$menuopcao" = "8" ]
then
apt-get install lxde -y
apt-get install xrdp -y
clear
echo "${aqua}XRDP ${lightgreen}Instalado Com Sucesso ! ${normal}"
sleep 5
fi

if [ "$menuopcao" = "9" ]
then
menuusuarios
sleep 5
fi

if [ "$menuopcao" = "10" ]
then
rm -rf /etc/ssh/sshd_config
rm -rf sshd_config
mv /root/1533/sshd_config /etc/ssh/sshd_config
service ssh restart
clear
echo " ${green}Acesso Por Usuario ${lightaqua}ROOT ${green} Liberado ! ${normal}"
sleep 2
fi

if [ "$menuopcao" = "0" ]
then
exit
fi

#Volta Menu
history -c
menu
clear
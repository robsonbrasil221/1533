#!/bin/bash
#Cores
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
#Cores FIM
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "VPS Manager 2.0 (versão gratuita)" ; tput sgr0
tput setaf 3 ; tput bold ; echo "" ; echo "Este script irá:" ; echo ""
echo "● Instalar e configurar o proxy squid nas portas 80, 3128, 8080 e 8799" ; echo "  para permitir conexões SSH para este servidor"
echo "● Configurar o OpenSSH para rodar nas portas 22 e 443"
echo "● Instalar um conjunto de scripts como comandos do sistema para o gerenciamento de usuários" ; tput sgr0
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
tput setaf 2 ; tput bold ; echo "	Termos de Uso" ; tput sgr0
echo ""
echo "Ao utilizar esta versão GRATUITA do 'VPS Manager 2.0' você concorda com os seguintes termos de uso:"
echo ""
echo "1. Você pode:" 
echo "a. Instalar e usar o 'VPS Manager 2.0' no(s) seu(s) servidor(es)." 
echo "b. Criar, gerenciar e remover um número ilimitado de usuários através desse conjunto de scripts." 
echo "" 
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
echo "2. Você não pode:" 
echo "a. Editar, modificar, compartilhar ou redistribuir (gratuitamente ou comercialmente)" 
echo "esse conjunto de scripts sem autorização do desenvolvedor." 
echo "b. Modificar ou editar o conjunto de scripts para fazer você parecer o desenvolvedor dos scripts." 
echo "" 
echo "3. Você aceita que:" 
echo "a. Esta cópia GRATUITA do VPS Manager 2.0 não inclui NENHUM tipo garantia ou suporte promocional, sendo estes exclusivos da versão paga do VPS Manager 2.0."
echo "b. O usuário desse conjunto de scripts é o único resposável por qualquer tipo de implicação"
echo "ética ou legal causada pelo uso desse conjunto de scripts para qualquer tipo de finalidade."
echo "" 
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
echo "4. Você concorda que o desenvolvedor não se responsabilizará por nenhum tipo de problemas ocorridos durante o uso dessa versão GRATUITA do VPS Manager 2.0."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
if [[ "$IP" = "" ]]; then
		IP=$(wget -qO- ipv4.icanhazip.com)
fi
read -p "Para continuar confirme o IP deste servidor: " -e -i $IP ipdovps
if [ -z "$ipdovps" ]
then
	tput setaf 7 ; tput setab 1 ; tput bold ; echo "" ; echo "" ; echo " Você não digitou o IP deste servidor. Tente novamente. " ; echo "" ; echo "" ; tput sgr0
	exit 1
fi
tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Aguarde a configuração automática" ; echo "" ; tput sgr0
sleep 3
apt-get update -y
apt-get upgrade -y
rm /bin/criarusuario /bin/expcleaner /bin/sshlimiter /bin/addhost /bin/listar /bin/sshmonitor /bin/ajuda > /dev/null
rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh > /dev/null
apt-get install squid3 bc screen nano unzip dos2unix wget -y
killall apache2
if [ -d "/etc/squid3/" ]
then
	wget https://www.dropbox.com/s/zepxjactk6a1wa2/squid1.text -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://www.dropbox.com/s/sshhjtubd693fby/squid2.text -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid3/squid.conf
	wget https://www.dropbox.com/s/l9fpt1fz0t1cnzv/payload.text -O /etc/squid3/payload.txt
	echo " " >> /etc/squid3/payload.txt
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	wget https://www.dropbox.com/s/z6nfdxzdycynyey/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget https://www.dropbox.com/s/o0mxasibgi0v1gb/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget https://www.dropbox.com/s/tak587x4etk9qv6/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget https://www.dropbox.com/s/bmi239xncuc65n3/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget https://www.dropbox.com/s/u853m4mo32zd21b/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget https://www.dropbox.com/s/7svanf0rprytsrm/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget https://www.dropbox.com/s/6ojptjanr72ux9h/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget https://www.dropbox.com/s/b5vmd4sns3kfchr/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget https://www.dropbox.com/s/bm4azqbbztcp9pi/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget https://www.dropbox.com/s/1zy1x0rvjlu94d9/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget https://www.dropbox.com/s/03r7w2zxng66rc6/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	if [ ! -f "/etc/init.d/squid3" ]
	then
		service squid3 reload > /dev/null
	else
		/etc/init.d/squid3 reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi	
fi
if [ -d "/etc/squid/" ]
then
	wget https://www.dropbox.com/s/zepxjactk6a1wa2/squid1.text -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://www.dropbox.com/s/0fpppks72p18qbd/squid.text -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid/squid.conf
	wget https://www.dropbox.com/s/l9fpt1fz0t1cnzv/payload.text -O /etc/squid/payload.txt
	echo " " >> /etc/squid/payload.txt
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	wget https://www.dropbox.com/s/z6nfdxzdycynyey/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget https://www.dropbox.com/s/o0mxasibgi0v1gb/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget https://www.dropbox.com/s/tak587x4etk9qv6/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget https://www.dropbox.com/s/bmi239xncuc65n3/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget https://www.dropbox.com/s/u853m4mo32zd21b/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget https://www.dropbox.com/s/7svanf0rprytsrm/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget https://www.dropbox.com/s/6ojptjanr72ux9h/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget https://www.dropbox.com/s/b5vmd4sns3kfchr/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget https://www.dropbox.com/s/bm4azqbbztcp9pi/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget https://www.dropbox.com/s/1zy1x0rvjlu94d9/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget https://www.dropbox.com/s/03r7w2zxng66rc6/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	if [ ! -f "/etc/init.d/squid" ]
	then
		service squid reload > /dev/null
	else
		/etc/init.d/squid reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
echo ""
echo "${lightblue}VPS Manager + SSH ${lightgreen}Instalados Com Sucesso !${normal}"
echo "By: ${green}#ROB${red}SON"
echo ""
awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
exit 1
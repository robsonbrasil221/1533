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
 
clear
echo "                  ${underline}${lightred}***${normal}${lightblue} Inst. Painel SSH ${underline}${lightred}***${normal}                  " 
echo "" 
echo "${red}[${lightblue}1${red}] ${lightaqua}Painel SSH V 5.0${normal} "
echo "${red}[${lightblue}2${red}] ${lightaqua}Painel SSH V 9.0${normal}" 
echo "${red}[${lightblue}3${red}] ${lightaqua}Instalar Dependencias ${normal}" 
echo "${red}[${lightblue}0${red}] ${lightaqua}Sair Do Menu" 

read -p "Opção: " menuinstpopcao

if [ "$menuinstpopcao" = "1" ]
then
clear
cd /var/www/html/
echo "${blue}Escolha um diretorio para a intalaçao , Deixe em branco para diretorio ${aqua}PADRAO"
echo "${aqua}Diretorio de instalaçao : ${normal}" ; read diretorioPainel
mkdir /var/www/html/$diretorioPainel
cd /var/www/html/$diretorioPainel
wget https://www.dropbox.com/s/a2qokr07s5ahu5w/Painel-HTTP-EPROXY-OPENVPN.zip
apt-get install unzip
unzip Pa*.zip
rm Pa*.zip
grep -v "^Port 443" /var/spool/cron/crontabs/root > /tmp/cron && mv /var/spool/cron/crontabs/root
echo "* * * * * /usr/bin/php /var/www/html/pages/system/cron.php" >> /var/spool/cron/crontabs/root
echo "* * * * * /usr/bin/php /var/www/html/pages/system/cron.ssh.php" >> /var/spool/cron/crontabs/root
echo "* * * * * /usr/bin/php /var/www/html/pages/system/cron.sms.php" >> /var/spool/cron/crontabs/root
echo "* * * * * /usr/bin/php /var/www/html/pages/system/cron.online.ssh.php" >> /var/spool/cron/crontabs/root
echo "10 * * * * /usr/bin/php /var/www/html/pages/system/cron.servidor.php" >> /var/spool/cron/crontabs/root
rm /etc/apache2/ports.conf
grep -v "^Port 81" /etc/apache2/ports.conf > /tmp/ap81 && mv /etc/apache2/ports.conf
echo "Listen 81" >> /etc/apache2/ports.conf
echo "<IfModule ssl_module>" >> /etc/apache2/ports.conf
echo "        Listen 444" >> /etc/apache2/ports.conf
echo "</IfModule>" >> /etc/apache2/ports.conf
echo "<IfModule mod_gnutls.c>" >> /etc/apache2/ports.conf
echo "        Listen 444" >> /etc/apache2/ports.conf
echo "</IfModule>" >> /etc/apache2/ports.conf
rm /etc/apache2/sites-available/000-default.conf
grep -v "^Port 81" /etc/apache2/sites-available/000-default.conf > /tmp/aps81 && mv /etc/apache2/sites-available/000-default.conf
echo "<VirtualHost *:81>" >> /etc/apache2/sites-available/000-default.conf
echo "ServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/000-default.conf
echo "DocumentRoot /var/www/html" >> /etc/apache2/sites-available/000-default.conf
echo "ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/000-default.conf
echo "CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/000-default.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf
service apache2 restart
cd /root/
rm Alter* alter* criar* remover* sshm*
wget http://robson-linux.tk/1533/br221/root-painel/AlterarSenha.sh 
wget http://robson-linux.tk/1533/br221/root-painel/alterarlimite.sh
wget http://robson-linux.tk/1533/br221/root-painel/criarusuario.sh
wget http://robson-linux.tk/1533/br221/root-painel/remover.sh
wget http://robson-linux.tk/1533/br221/root-painel/sshmonitor.sh

chmod 777 Alter*
chmod 777 alter*
chmod 777 criar*
chmod 777 remover*
chmod 777 sshm*

fi


if [ "$menuinstpopcao" = "2" ]
then
clear
cd /var/www/html/
echo "${blue}Escolha um diretorio para a intalaçao , Deixe em branco para diretorio ${aqua}PADRAO"
echo "${aqua}Diretorio de instalaçao : ${normal}" ; read diretorioPainel
mkdir /var/www/html/$diretorioPainel
cd /var/www/html/$diretorioPainel
wget https://www.dropbox.com/s/o3hgpguegfspwnb/Painel-9.0.zip
apt-get install unzip
unzip Pa*.zip
rm Pa*.zip
chmod 777 /admin/pages/bandeiras
chmod 777 /admin/pages/faturas/comprovantes
chmod 777 /admin/pages/download
chmod 777 /admin/pages/servidor/ovpn
grep -v "^Port 443" /var/spool/cron/crontabs/root > /tmp/cron && mv /var/spool/cron/crontabs/root
echo "* * * * * /usr/bin/php /var/www/html/pages/system/cron.php" >> /var/spool/cron/crontabs/root
echo "* * * * * /usr/bin/php /var/www/html/pages/system/cron.ssh.php" >> /var/spool/cron/crontabs/root
echo "* * * * * /usr/bin/php /var/www/html/pages/system/cron.sms.php" >> /var/spool/cron/crontabs/root
echo "* * * * * /usr/bin/php /var/www/html/pages/system/cron.online.ssh.php" >> /var/spool/cron/crontabs/root
echo "10 * * * * /usr/bin/php /var/www/html/pages/system/cron.servidor.php" >> /var/spool/cron/crontabs/root
rm /etc/apache2/ports.conf
grep -v "^Port 81" /etc/apache2/ports.conf > /tmp/ap81 && mv /etc/apache2/ports.conf
echo "Listen 81" >> /etc/apache2/ports.conf
echo "<IfModule ssl_module>" >> /etc/apache2/ports.conf
echo "        Listen 444" >> /etc/apache2/ports.conf
echo "</IfModule>" >> /etc/apache2/ports.conf
echo "<IfModule mod_gnutls.c>" >> /etc/apache2/ports.conf
echo "        Listen 444" >> /etc/apache2/ports.conf
echo "</IfModule>" >> /etc/apache2/ports.conf
rm /etc/apache2/sites-available/000-default.conf
grep -v "^Port 81" /etc/apache2/sites-available/000-default.conf > /tmp/aps81 && mv /etc/apache2/sites-available/000-default.conf
echo "<VirtualHost *:81>" >> /etc/apache2/sites-available/000-default.conf
echo "ServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/000-default.conf
echo "DocumentRoot /var/www/html" >> /etc/apache2/sites-available/000-default.conf
echo "ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/000-default.conf
echo "CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/000-default.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf
service apache2 restart
cd /root/
rm Alter* alter* criar* remover* sshm*
wget http://robson-linux.tk/1533/br221/root-painel/AlterarSenha.sh 
wget http://robson-linux.tk/1533/br221/root-painel/alterarlimite.sh
wget http://robson-linux.tk/1533/br221/root-painel/criarusuario.sh
wget http://robson-linux.tk/1533/br221/root-painel/remover.sh
wget http://robson-linux.tk/1533/br221/root-painel/sshmonitor.sh

chmod 777 Alter*
chmod 777 alter*
chmod 777 criar*
chmod 777 remover*
chmod 777 sshm*
fi

if [ "$menuinstpopcao" = "3" ]
then
clear
apt-get update && apt-get upgrade
apt-get install curl
apt-get install apache2
apt-get install php5 libapache2-mod-php5 php5-mcrypt
service apache2 restart
apt-get install mysql-server php5-mysql
mysql_install_db
mysql_secure_installation
apt-get install phpmyadmin
php5enmod mcrypt
service apache2 restart
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
apt-get install libssh2-1-dev libssh2-php
php -m |grep ssh2
service apache2 restart
fi
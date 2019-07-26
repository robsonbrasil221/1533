#!/bin/bash
apt-get update -y # Atualizar a lista de pacotes
apt-get upgrade -y # Efetua a atualização
apt-get upgrade -f -y
apt-get -f install # Corrigir problemas de dependências, concluir instalação de pacotes pendentes e outros erros
apt-get autoremove -y # Remover pacotes instalados automaticamente e que não tem mais nenhuma utilidade para o sistema
apt-get autoclean -y # Remover pacotes antigos ou duplicados
apt-get clean -y # Remove arquivos inúteis do cache, onde registra as cópias das atualizações q são instaladas pelo gerenciador de pacotes
apt-get -f remove -y # Remover pacotes com problemas

echo "##############################################################"
echo "######################### AGUARDE ############################"
echo "##############################################################"

sleep 4

#Limpar o cache da memoria RAM
MEM1=`free|awk '/Mem:/ {print int(100*$3/$2)}'`
free -m
echo "##########################################################################"
echo "Memória RAM Usada antes de fazer a limpeza:" $MEM1%
echo "##########################################################################"
echo " "
echo "LIMPANDO MEMORIA --- RAM ---"
sleep 3
sync
echo 3 > /proc/sys/vm/drop_caches
echo "LIMPANDO MEMORIA SWAP..."
sleep 4
swapoff -a
swapon -a
echo "##########################################################################"
MEM2=`free|awk '/Mem:/ {print int(100*$3/$2)}'`
free -m
echo "##########################################################################"
echo "Uso de memória RAM após a limpeza:" $MEM2% "Economia de: " `expr $MEM1 - $MEM2`"%"
echo "##########################################################################"
exit
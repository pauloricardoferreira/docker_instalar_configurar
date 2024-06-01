#!/bin/bash

echo "**************************"
echo "*** INICIANDO PREPAÇÃO ***"
echo "**************************"

echo ""

echo "====================================="
echo "=== CLONANDO REPOSITÓRIO COM DAGS ==="
echo "====================================="

echo ""

if [ -d "/var/lib/docker/volumes/dags/_data/live_airflow_dags" ]
    then
        cd /var/lib/docker/volumes/dags/_data/live_airflow_dags
        git reset --hard
        git pull
    else 
        cd /var/lib/docker/volumes/dags/_data/
        git clone https://github.com/pauloricardoferreira/live_airflow_dags.git
fi

echo ""

echo "========================================"
echo "=== CLONANDO REPOSITÓRIO PROJETO HOP ==="
echo "========================================"

echo ""

if [ -d "/var/lib/docker/volumes/hop_projetos/_data/live_hop" ]
    then
        cd /var/lib/docker/volumes/hop_projetos/_data/live_hop
        git reset --hard
        git pull
    else 
        cd /var/lib/docker/volumes/hop_projetos/_data/
        git clone https://github.com/pauloricardoferreira/live_hop.git
fi

echo ""

echo "============================================="
echo "=== CLONANDO REPOSITÓRIO CONFIGURAÇÃO HOP ==="
echo "============================================="

echo ""

if [ -d "/var/lib/docker/volumes/hop_config/_data/.git" ]
    then
        cd /var/lib/docker/volumes/hop_config/_data/
        git reset --hard
        git pull
    else 
        cd /var/lib/docker/volumes/hop_config/_data/
        git clone https://github.com/pauloricardoferreira/live_hop_config.git .
fi

echo ""

echo "======================================================"
echo "=== PREPARANDO ARQUIVO ARQUIVO DE CONFIGURAÇÃO HOP ==="
echo "======================================================"

echo ""

cd /var/lib/docker/volumes/hop_config/_data/
sed -i 's/\/opt\///g' hop-config.json

cat hop-config.json

echo ""
echo ""

echo "******************************"
echo "*** FINALIZANDO PREPARAÇÃO ***"
echo "******************************"

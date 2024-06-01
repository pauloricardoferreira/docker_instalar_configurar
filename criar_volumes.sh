#!/bin/bash

LISTA_VOLUMES="dags logs plugins hop_projetos hop_config oracle_lib"

echo "======================="
echo "=== CRIANDO VOLUMES ==="
echo "======================="


for i in $LISTA_VOLUMES
do
    echo "CRIANDO VOLUME: $i"
    docker volume create $i > /dev/null 2>&1
done

echo "============================"
echo "=== ALTERANDO PERMISSÕES ==="
echo "============================"

for i in $LISTA_VOLUMES
do
    echo "ALTERANDO PERMISSÕES DO VOLUME: $i"
    sudo chmod -R 777 /var/lib/docker/volumes/$i/_data/
done

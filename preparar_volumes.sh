#!/bin/bash

LISTA_VOLUMES="dags logs plugins hop_projetos hop_config"

echo "======================="
echo "=== CRIANDO VOLUMES ==="
echo "======================="


for i in $LISTA_VOLUMES
do
    echo "CRIANDO VOLUME: $i"
    docker volume create $i > /dev/null
done
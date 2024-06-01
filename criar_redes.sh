#!/bin/bash

LISTA_VOLUMES="airflow hop metabase postgres-prd"

echo "======================="
echo "=== CRIANDO REDES ==="
echo "======================="


for i in $LISTA_VOLUMES
do
    echo "CRIANDO REDE: $i"
    docker network create $i > /dev/null 2>&1
done
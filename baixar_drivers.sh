#!/bin/bash

# Variaveis
CAMINHO_VOLUME_DOCKER=/var/lib/docker/volumes
URL_ORACLE="http://nexus.saas.hand-china.com/content/repositories/rdc/com/oracle/ojdbc7/12.1.0.2/ojdbc7-12.1.0.2.jar"
VOLUME_ORACLE_LIB=$CAMINHO_VOLUME_DOCKER/oracle_lib/_data

echo "=============================="
echo "=== BAIXANDO DRIVER ORACLE ==="
echo "=============================="

sudo wget $URL_ORACLE -O $VOLUME_ORACLE_LIB/ojdbc7.jar

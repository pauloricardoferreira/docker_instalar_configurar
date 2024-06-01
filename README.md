## Bem-vindo

Este reposório contem passos básicos para instalar o docker em um servidor Ubuntu e passos para a configuração dos serviços Apache Airflow, Apache Hop, Metabase, Postgres e posteriormente Apache Superset


## <b> Instalando e Configurando Docker </b>


Vamos iniciar a instalção com os comandos abaixo.

```bash
curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh
```

Pós instalação Docker, execute os comandos abaixo para permitir que seu usuário execute o CLI (command line interface) do docker

```bash
sudo groupadd docker

sudo usermod -aG docker $USER
```

Normalmente o servido do docker já deve estar habilitado e inicializado. Caso não esteja exeute os comandos abaixo

```bash
sudo systemctl enable docker.service

sudo systemctl enable containerd.service

sudo systemctl start docker.service

sudo systemctl start containerd.service
```

Caso receber o erro ao executar o comando `docker ps : <b> Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? </b> execute o comando abaixo

```bash
sudo update-alternatives --config iptables
```
Escolha a opção 1, e reinicie o servidor docker

```bash
sudo systemctl restart docker.service
```
<br>

Executando o comando abaixo, você verá a saída abaixo
```bash
$ docker ps
```
```bash
usuario@computador:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

<br>

Muito bem, agora que temos o docker instalado e configurado, as configurações abaixo é para preparar o docker para a Stak sugerida.

Você pode criar na mão, oude pode executar o script prepara_servidor.sh para configurar automaticamente


## Seguindo com script

Vamos iniciar criando as redes com o comando abaixo:

```bash
sh criar_redes.sh
```

Após vamos criar os volumes comando abaixo:

```bash
sh criar_volumes.sh
```

Após clonar os repositório e realizar as configuraçlões necessárias com o script abaixo:

```bash
sudo sh configurar_atualizar.sh
```

E por fim, baixar os drivers necessários
````bash
sudo sh baixar_drivers.sh
````


## Seguindo manualmente

### <b> Criando Redes no Docker </b> 
Para que o projeto funcione corretamente é necessário criar algumas redes para a comunicação entre os serviços que estão rodando nos containers

Lista de Redes
 - hop
 - airflow
 - postgres-prd
 - metabase
 
para criar redes use o comando: `docker network create nome_da_rede`
 
### <b> Criando Volumes no Docker </b> 
Para o Apache Airflow e Apache Hop funcionar corretamente, é cessário criar os volumes abaixo
 
Lista de Volumes
 - dags
 - logs
 - plugins
 - hop_projetos
 - hop_config
 
para criar redes use o comando: `docker volume create nome_da_rede`

**Obs.:** há um passo crítico neste ponto. Como é necessário fazer o clone do projeto hop e dags do airflow.. é necessário executar alguns passos extras, porém para isso deixarei um script pronto.


## Observações Gerais

Deixo como lição para você que está implantando essa Stack, melhorar, e criar suas automações.
Algum processo manual certamente você terá assim como eu tive.
Deixo abaixo de depoisórios para as stacks:

* [Apache Hop - Configuração de Desenvolvimento](https://github.com/pauloricardoferreira/hop_configurar_local_desenvolvimento)
  * git clone https://github.com/pauloricardoferreira/hop_configurar_local_desenvolvimento.git

* [Apache Airflow](https://github.com/pauloricardoferreira/docker_airflow)
  * git clone https://github.com/pauloricardoferreira/docker_airflow.git

* [Apache Hop](https://github.com/pauloricardoferreira/docker_hop)
  * git clone https://github.com/pauloricardoferreira/docker_hop.git
  
* [Postgres para Hop](https://github.com/pauloricardoferreira/docker_postgres_hop)
  * git clone https://github.com/pauloricardoferreira/docker_postgres_hop.git

* [Apache Metabase](https://github.com/pauloricardoferreira/docker_metabase)
  * git clone https://github.com/pauloricardoferreira/docker_metabase.git
  
* [Portainer](https://github.com/pauloricardoferreira/docker_portainer)
  * git clone https://github.com/pauloricardoferreira/docker_portainer.git

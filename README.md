# mysql-12399
Curso de MySQL

## Como rodar
[Windows]
1. Faça donwload do mysql (5.6) Workbench no link
https://dev.mysql.com/downloads/mysql/5.6.html

[Linux]
1. Verifique se já tem o mysql Instalado, no terminal rode o comando:
`service --status-all`
caso apareça na lista o `mysql` ou `mysqld`
execute:
`sudo service mysql stop` ou `sudo service mysqld stop`
ou
`sudo systemctl stop mysql` ou `sudo systemctl stop mysqld`

2. Instale o Docker: I.O
`sudo apt install docker.io`
depois instale o compose para gerenciar os containers:
`sudo apt install ocker-compose`

3. abra a pasta do projeto e rode o comando:
`docker-compose up` utilze o `-d` caso queira ocultar o log
`docker-compose up -d`
Para desligar o container utilize: `docker-compose down`
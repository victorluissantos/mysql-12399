# mysql-12399
Curso de MySQL

## Como rodar
[Windows]
1. Faça donwload do mysql (5.6) Workbench no link
https://dev.mysql.com/downloads/mysql/5.6.html

[Linux]
1. Verifique se já tem o mysql Instalado, no terminal rode o comando:<br>
`service --status-all`<br>
caso apareça na lista o `mysql` ou `mysqld`<br>
execute:<br>
`sudo service mysql stop` ou `sudo service mysqld stop`<br>
ou<br>
`sudo systemctl stop mysql` ou `sudo systemctl stop mysqld`<br>
<br>
2. Instale o Docker: I.O<br>
`sudo apt install docker.io`<br>
depois instale o compose para gerenciar os containers:<br>
`sudo apt install ocker-compose`<br>
<br>
3. abra a pasta do projeto e rode o comando:<br>
`docker-compose up` utilze o `-d` caso queira ocultar o log<br>
`docker-compose up -d`<br>
Para desligar o container utilize: `docker-compose down`<br>

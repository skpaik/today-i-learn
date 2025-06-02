# Today I Learn ([@skpaik](https://skpaik.github.io "@skpaik"))

Hi I'm Sudipta Kumar Paik. I write everything, what I learn every day.

# Recursive full permission to a folder and sub folder

```shell
chmod -R 777 ./
```

# Recursively remove folders in a directory


Remove all `.DS_Store` file from a directore
```shell
find . -name ".DS_Store" -print -delete
```

Remove all `target` folder from a directore
```shell
find . -name "target" -type d -exec rm -rf {} \;
```

Remove all `node_modules` folder from a directore
```shell
find . -name "node_modules" -type d -exec rm -rf {} \;
```


# Auto generate aws credential on local machine
Download file  [aws_credentials_create.js](https://github.com/skpaik/today-i-learn/blob/master/aws_credentials_create.js)

Open file ad add list of aws credentails on `const accounts =` line 5

Add Permission
```shell
chmod +x ./aws_credentials_create.js
```
To run the file
```shell
./aws_credentials_create.js
```


# Create Command file
Create a fine in root of the project. Named `run.sh`
Add following contents
```shell
#!/usr/bin/env bash
npm run deploy:sam:dev:feature feature-DXP-4868
.
.
```
Add Permission
```shell
chmod +x ./run.sh
```
To run the file
```shell
./run.sh
```

# Kill nodejs process

Command 1:

```
ps aux | grep node
```

Output

```
root        3766  0.5 13.3 989252 130196 ?       Ssl  Jul29 137:14 node /home/ubuntu/code/backend/server.js
ubuntu     55299  0.0  0.0   8168   736 pts/0    S+   08:46   0:00 grep --color=auto node
```

Command 2:
```
sudo lsof -PiTCP -sTCP:LISTEN
```

Output

```
Password:
COMMAND     PID  USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
ControlCe  1573 sudiptambp    5u  IPv4 0xd6a1f5fb0c929ad9      0t0  TCP *:7000 (LISTEN)
ControlCe  1573 sudiptambp    6u  IPv6 0xd6a1f5f17447b1a1      0t0  TCP *:7000 (LISTEN)
ControlCe  1573 sudiptambp    7u  IPv4 0xd6a1f5fb0c940fc9      0t0  TCP *:5000 (LISTEN)
ControlCe  1573 sudiptambp    8u  IPv6 0xd6a1f5f17447c9a1      0t0  TCP *:5000 (LISTEN)
rapportd   1587 sudiptambp    4u  IPv4 0xd6a1f5fb09e2f0f9      0t0  TCP *:59400 (LISTEN)
rapportd   1587 sudiptambp    8u  IPv6 0xd6a1f5f17a2931a1      0t0  TCP *:59400 (LISTEN)
PanGPS     1684  root         7u  IPv4 0xd6a1f5fb0c93f9a9      0t0  TCP localhost:4767 (LISTEN)
idea      64752 sudiptambp   14u  IPv6 0xd6a1f5f1744969a1      0t0  TCP localhost:6942 (LISTEN)
idea      64752 sudiptambp   33u  IPv6 0xd6a1f5f1744981a1      0t0  TCP localhost:63342 (LISTEN)
idea      64752 sudiptambp  100u  IPv6 0xd6a1f5f1744821a1      0t0  TCP localhost:59804 (LISTEN)
java      65751 sudiptambp  237u  IPv6 0xd6a1f5f17a2a39a1      0t0  TCP localhost:59813 (LISTEN)
com.docke 65761 sudiptambp   87u  IPv6 0xd6a1f5f17a2921a1      0t0  TCP *:27017 (LISTEN)
```



Find the process ID (second from the left):

Command 2:

```
kill -9 PROCESS_ID
```

Example

```
sudo kill -9 3766
```

This may also work

```
sudo killall node
```

# Linux release used ports

Command 1:

```
lsof -i:8080
```

OR

Command 2:

```
lsof -i:5000
```

OR

Command 3:

```
lsof -i:3000
```

# Linux check used ports

Command 1:

```
netstat -tulpn | grep LISTEN
```

OR

Command 2:

```
sudo lsof -i -P -n | grep LISTEN
```

# Generating the SSH keys for github.com

Command 1: For company use

```
ssh-keygen -t ed25519 -C "info@newCompany.com" -f "id_rsa_github_newCompany"
```

OR

Command 2: For personal use

```
ssh-keygen -t ed25519 -C "me@gmail.com" -f "id_ed25519_github_personal"
```

OR

Command 3: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:

```
ssh-keygen -t rsa -b 4096 -C "info@newCompany.com" -f "id_rsa_github_newCompany"
```
If you want to configure github, please follow [this page](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent) .


## Git Reset hard head

[cmd] in terminal

```
git reset --hard HEAD
```

Ref: https://stackoverflow.com/q/9529078
> **Tech:** `git`, `reset`
>
> **Date:** 2020-04-15

## Python apply `PEP8` Standard

[cmd] in active virtualenv

```
pip install isort
```

From the command line:

```
isort mypythonfile.py mypythonfile2.py
```

From recursively:

```
isort -rc .
```

or to see the proposed changes without applying them:

```
isort mypythonfile.py --diff
```

Ref: https://pypi.org/project/isort/
> **Tech:** `python`, `pep8`, `standard`
>
> **Date:** 2020-04-01

## Edit Mac's Hosts file

Install the MySQL server by using the Ubuntu package manager:

- Open a Finder window.
- Select Applications from the sidebar.
- Double-click on Utilities.
- Double-click Terminal.
- type `sudo nano /etc/hosts` and then hit return.
- Enter your administrator password and then hit return. Once you're done, hold down the control and O keys to save the file, then control and X to exit.
- One last step: `sudo killall -HUP mDNSResponder`

Ref: https://www.imore.com/how-edit-your-macs-hosts-file-and-why-you-would-want#how-to-edit-the-hosts-file
> **Tech:** `host`, `mac`
>
> **Date:** 2019-11-13

## Python3 Virtualenv in MAC OS

##### 1. Install virtualenv

```
sudo pip install virtualenv
```

##### 2. Start virtualenv in python3

```
virtualenv -p python3 .env
```

> # OR

```
python3 -m venv .env
```

Here **.env** is environment name

##### 3. Activate virtualenv in python3

```
source .env/bin/activate
```

##### 3. Deactivate virtualenv in python3

```
source deactivate
```

> **Tech:** `python3`, `virtualenv`, `mac`
>
> **Date:** 2019-10-31

## Install Docker CE in Ubuntu

##### 1. Update the `apt` package index:

```
sudo apt-get update
```

##### 2. Install packages to allow `apt` to use a repository over HTTPS::

```
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
```

##### 3. Add Docker’s official GPG key:

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

##### 4. Verify that you now have the key with the fingerprint:

```
sudo apt-key fingerprint 0EBFCD88
```

##### 5. Use the following command to set up the stable repository:

```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

##### 6. Update the `apt` package index:

```
sudo apt-get update
```

##### 7. Install the latest version of Docker CE and containerd:

```
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

##### 8. Verify that Docker CE is installed correctly by running the `hello-world` image:

```
sudo docker run hello-world
```

##### 9. Create the `docker` group:

```
sudo groupadd docker
```

##### 10. Add your user to the `docker` group:

```
sudo usermod -aG docker $USER
```

Ref: https://docs.docker.com/install/linux/docker-ce/ubuntu/
> **Tech:** `docker`,`docker-ce`,`ubuntu`
>
> **Date:** 2019-07-01

## Remove Docker Containers, Images, Volumes, and Networks

##### Removing All Unused Objects

```
sudo docker system prune
```

##### Remove all unused volumes

```
sudo docker system prune --volumes
```

##### List of all active and inactive images

```
sudo docker image ls -a
```

##### Remove one or more images

```
sudo docker image rm 75835a67d134 2a4cca5ac898
```

// Here '75835a67d134' & '2a4cca5ac898' is image ID

##### Delete all local Docker images

```
docker rmi -f $(docker images -a -q)
```

##### Delete all Docker containers including its volumes use

```
docker rm -vf $(docker ps -a -q)
```

##### List of all active and inactive containers

```
sudo docker container ls -a
```

##### Remove one or more containers

```
sudo docker container rm cc3f2ff51cab cd20b396a061
```

// Here 'cc3f2ff51cab' & 'cd20b396a061' is container ID

##### Stop and remove all containers

```
sudo docker container stop $(sudo docker container ls -aq)
```

```
sudo docker container rm $(sudo docker container ls -aq)
```

N.B.: if no container running, then error may shown.

## Completely uninstall docker

##### Step 1:

```
sudo dpkg -l | grep -i docker
```

##### Step 2:

```
sudo apt-get purge -y docker-engine docker docker.io docker-ce
```

```
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce
```

##### Step 3:

```
sudo rm -rf /var/lib/docker
```

```
sudo rm /etc/apparmor.d/docker
```

```
sudo groupdel docker
```

```
sudo rm -rf /var/run/docker.sock
```
##### Step 4:
Download the file and open command line
Then run 

```
sudo ./delete_docker_fully.sh
```

##### Uninstall old versions:

```
sudo apt-get remove docker docker-engine docker.io containerd runc
```

Ref:

1. https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks
2. https://askubuntu.com/a/1021506/700201

> **Tech:** `docker`, `ubuntu`
>
> **Date:** 2019-03-06

## Installing nano and vim in docker/Ubuntu

```
apt-get update
```

```
apt-get install vim nano
```

Ref: https://stackoverflow.com/a/37156748/705293
> **Tech:** `vim`, `docker`, `nano`, `ubuntu`
>
> **Date:** 2019-03-06

## Installing MySQL in Ubuntu

Install the MySQL server by using the Ubuntu package manager:

```
sudo apt-get update
```

```
sudo apt-get install mysql-server
```

Ref: https://support.rackspace.com/how-to/installing-mysql-server-on-ubuntu/
> **Tech:** `mysql`, `ubuntu`
>
> **Date:** 2019-03-04

## Uninstalling MySQL in Ubuntu

Use apt to uninstall and remove all MySQL packages:

```
sudo apt-get remove --purge mysql-server mysql-client mysql-common -y
```

```
sudo apt-get autoremove -y
```

```
sudo apt-get autoclean
```

Remove the MySQL folder:

```
sudo rm -rf /etc/mysql
```

Delete all MySQL files on your server:

```
sudo find / -iname 'mysql*' -exec rm -rf {} \;
```

Ref: https://help.cloud66.com/node/how-to-guides/databases/shells/uninstall-mysql.html

> **Tech:** `'mysql'`, `ubuntu`
>
> **Date:** 2019-03-04

## Mongo dump and restore command

Dump or Take backup:

```
mongodump -h 127.0.0.1:27017 -d dbname --out bjson_folder
```

Restore to database:

```
mongorestore -h 127.0.0.1:27017 -d dbname bjson_folder/dbname
```

> **Here:**

```
>Host = 127.0.0.1:27017(-h)

>Database name = dbname(-d)

>Dump locations BSON/JSON files = bjson_folder/(dbname auto create)(--out)

>Restore Locations of backup BSON/JSON folders = bjson_folder/dbname
```

> **Tech:** `mongodb`
>
> **Date:** 2019-02-27

## Docker entering file system

```
docker ps
```

```
docker exec -it name-of-container bash
```

> **Tech:** `docker`
>
> **Date:** 2019-02-07

## Unit Testing in ExpressJs(NodeJs)

Ref: https://codehandbook.org/unit-test-express-route
> **Tech:** `mocha`, `nodejs`, `expressjs`
>
> **Date:** 2019-01-28

## Install Python & Django on Windows

Run command on Powershell

Download from https://www.python.org/downloads/

```
pip install virtualenv
```

```
cd ~/Desktop
```

```
mkdir pages
```

```
cd pages
```

```
virtualenv venv
```

```
.\venv\Scripts\activate
```

```
pip install django
```

```
django-admin startproject app .
```

```
python manage.py startapp pages
```

```
deactivate
```

Ref: https://www.codingforentrepreneurs.com/blog/install-python-django-on-windows/

> **Tech:** `django`, `python`
>
> **Date:** 2019-01-23

## Activate PyCharm

* Ref: https://www.codeblogbt.com/archives/282803
* Or you can activate
  using [PyCharm_Activation_Code.txt](https://github.com/skpaik/today-i-learn/blob/master/PyCharm_Activation_Code.txt)
* Before activate please update hosts file to

```
0.0.0.0 account.jetbrains.com
```

> **Tech:** `pycharm`, `python`
>
> **Date:** 2019-01-22

## Check out a remote Git branch

```
git checkout -b feature_connect_issue remotes/origin/feature_connect_issue
```

Ref: https://stackoverflow.com/a/1783426/705293
> **Tech:** `'git'`
>
> **Date:** 2019-01-16

## Delete Local Branch

```
git branch -D branch_name
```

Ref: https://stackoverflow.com/a/2003515/705293
> **Tech:** `'git'`
>
> **Date:** 2019-01-16

## How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Ubuntu 16.04

A "LAMP" stack is a group of open source software that is typically installed together to enable a server to host
dynamic websites and web apps. This term is actually an acronym which represents the **L**inux operating system, with
the **A**pache web server. The site data is stored in a **M**ySQL database, and dynamic content is processed by **P**HP.
Ref: https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04
> **Tech:** php, mysql
>
> **Date:** 2019-01-10


## Screen

Screen or GNU Screen is a terminal multiplexer. In other words, it means that you can start a screen session and then open any number of windows (virtual terminals) inside that session. Processes running in Screen will continue to run when their window is not visible even if you get disconnected.

The screen package is pre-installed on most Linux distros nowadays. You can check if it is installed on your system by typing:

`screen --version`

Install Linux Screen on Ubuntu and Debian (if not exists) 

```
sudo apt update
sudo apt install screen
```

### Usefull Screen Commands

`screen -ls` -> See all existing screen
`screen -r` -> Reconnect an existing screen
`screen -S screen_name` -> Create screen with name screen_name
`screen -r screen_id` -> Reconnect an existing screen with id e.g screen_id
`Ctrl+A+D` *or* `screen -d` -> Detach from current screen
`screen -S some_name -X quit` -> Kill detached session by screen name e.g some_name

**See More:** https://linuxize.com/post/how-to-use-linux-screen/#working-with-linux-screen-windows


## Faveo

Faveo is a suport ticket system. Ref: https://github.com/ladybirdweb/faveo-helpdesk
> **Tech:** `'php'`,`'mysql'`
>
> **Date:** 2019-01-10


**Table of Contents**

[TOCM]

[TOC]

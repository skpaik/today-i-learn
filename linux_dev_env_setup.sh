#!/bin/bash
cmdStart='apt-get' #Ubuntu
#cmdStart='yum' #AWS EC2 Linux

#Perform a quick update on your instance:
sudo $cmdStart update -y

#Install git in your EC2 instance
sudo $cmdStart install git -y
git version


#Install NodeJs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
node -e "console.log('Running Node.js ' + process.version)"


#Install Redis
sudo $cmdStart install redis-server -y

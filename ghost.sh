#!/bin/bash

# install and configure ghost framework

if (nginx -v)
then 
  echo "nginx already installed"
else
  echo "installing nginx"
  sudo apt update 
  sudo apt install -y nginx
fi

if (mysql --version)
then 
  echo "mysql already installed"
else
  echo "installing mysql"
  sudo apt install -y mysql-server
fi

 sudo mysql -u root -e 'ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'ghost666'; FLUSH PRIVILEGES;'
 
 if (dpkg -s ca-certificates)
then 
  echo "ca-certificates already installed"
else
  echo "installing ca-certificates"
  sudo apt install -y ca-certificates
fi

if (dpkg -s curl)
then 
  echo "curl already installed"
else
  echo "installing curl"
  sudo apt install -y curl
fi

if (dpkg -s gnupg)
then 
  echo "gnupg already installed"
else
  echo "installing gnupg"
  sudo apt install -y gnupg
fi

if [ -d /etc/apt/keyrings ]
then 
  echo "/etc/apt/keyrings already exist"
else
  echo "creating /etc/apt/keyrings"
  sudo mkdir -p /etc/apt/keyrings
fi

if [ -s /etc/apt/keyrings/nodesource.gpg ]
then
  echo "/etc/apt/keyrings/nodesource.gpg already exist"
else
  echo "creating /etc/apt/keyrings/nodesource.gpg"
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
fi 

if [ -s /etc/apt/sources.list.d/nodesource.list ]
then 
  echo "/etc/apt/sources.list.d/nodesource.list already exist"
else
  echo "creating /etc/apt/sources.list.d/nodesource.list"
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
fi

if (node -v)
then
  echo "node already installed"
else  
  echo "installing node"
  sudo apt update
  sudo apt install nodejs -y
fi

if (npm -v)
then
  echo "npm already installed"
else  
  echo "installing npm"
  sudo apt update
  sudo apt install npm -y
fi

if (ghost help)
then  
  echo "ghost already installed"
else
  echo "installing ghost"
  sudo npm install ghost-cli@latest -g
fi

if [ -d /var/www/ghost ]
then 
  echo "/var/www/ghost already exist"
else
  echo "creating /var/www/ghost"
  sudo mkdir -p /var/www/ghost
fi

if [ "$(stat -c "%U %G" /var/www/ghost)" = 'ubuntu ubuntu' ]
then
  echo "user and group already ubuntu:ubuntu for /var/www/ghost"
else 
  echo "changing /var/www/ghost owner and group to ubuntu:ubuntu"
  sudo chown ubuntu:ubuntu /var/www/ghost
fi

if [ $(stat -c %a /var/www/ghost) = '775' ]
then
  echo "/var/www/ghost permision is already 775"
else
  echo "setting permision on /var/www/ghost to 775"
  sudo chmod -R 775 /var/www/ghost
fi

# # Then navigate into it
# pushd /var/www/ghost && ghost install && popd


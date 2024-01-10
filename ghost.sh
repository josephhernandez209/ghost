sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y nginx
sudo apt-get install -y mysql-server
sudo mysql -u root -e 'ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '<your-new-root-password>'; FLUSH PRIVILEGES;'
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Create deb repository
NODE_MAJOR=18 # Use a supported version
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Run update and install
sudo apt-get update
sudo apt-get install nodejs -y
sudo apt install npm
sudo npm install ghost-cli@latest -g
# Create directory: Change `sitename` to whatever you like
sudo mkdir -p /var/www/sitename

# Set directory owner: Replace <user> with the name of your user
sudo chown ubuntu:ubuntu /var/www/sitename

# Set the correct permissions
sudo chmod 775 /var/www/sitename

# Then navigate into it
cd /var/www/sitename

#!/bin/bash
echo "Preparing Deployment to production..."
echo "----------------------------------------------------------------"
echo "|                                                              |"

echo "Installing the dnf package manager"
sudo yum -y install dnf
echo "----------------------------------------------------------------"

echo "Installing the firewalld package"
sudo dnf install -y firewalld

echo "Starting the firewalld service"
sudo systemctl start firewalld

echo "Installing the Apache Web Server"
sudo dnf install -y httpd

echo "Starting the Apache Web Server"
sudo systemctl start httpd
sudo systemctl enable httpd

echo "Configuring Firewall to accept http connections"
sudo firewall-cmd --add-service=http
sudo firewall-cmd --permanent --add-service=http

echo "Restarting Firewall service"
sudo systemctl restart firewalld

echo "Installing the Git"
sudo dnf install -y git



echo "Downloading Pip repository"
sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

echo "Installing PIP"
python get-pip.py --user

echo "Installing the PIP"
sudo pip install ansible

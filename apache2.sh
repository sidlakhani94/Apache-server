#!/bin/bash
#Author: Siddharth Lakhani
#Description: Installation and configuration of apache server.




doc_root="/var/www/html"
conf_path="/etc/apache2/sites-available"

#Here check whether apache is installed or not

if [ "$(dpkg -s apache2 | grep -c "ok installed")" == "1" ]
then
	echo "Package is installed"
else
       sudo apt-get install apache2 -y
fi

#Here configure apache server

sudo mkdir -p $doc_root/testserver
sudo touch $doc_root/index.html
echo "This is scripting" > $doc_root/testserver/index.html
sudo touch $conf_path/testapache.conf
echo -e "<Virtualhost *.80> \ndocumentroot $doc_root/testserver \n</Virtualhost>" > $conf_path/testapache.conf

#Her starting apache service

sudo systemctl start apache2
sudo systemctl enable apache2


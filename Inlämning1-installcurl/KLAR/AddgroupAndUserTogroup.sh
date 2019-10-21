#!/bin/bash
set x
function setup_ENV(){
clear
echo "###################################"
echo "=== EXECUTION OF:: $0           ==="
echo "###################################"
sleep 2
echo
echo "============================================================"
echo "### Will add group OPT and access to DIR /opt/ chang mod ###"
echo "============================================================"
sleep 2
sudo groupadd OPT
sudo chgrp OPT /opt/*
sudo chmod -R g+rwx /opt/*
sudo chmod 775 /opt/*
sleep 2
echo
echo "======================================="
echo "###  Add current user to group OPT  ###"
echo "See current users groups and permission"
echo "======================================="
sudo usermod -aG OPT $USER
groups $USER
ls -al /opt
sleep2
}
### starting with function: setup_ENV: Setting up enviroment for grp acces to opt DIR
setup_ENV
###
### Running the code for installation and cleaning up

echo "###       SCRIPT FOR CURL INSTALLATION    ###\n
=== WARNING THIS WILLL NEED SUDO PERMISSIONS ==\n
=== PLEASE KNOW WHAT YOU ARE DOING IF INSTALL THIS!! ==="

SOURCE="https://curl.haxx.se/download/curl-7.61.1.tar.bz2"
CURRENTDIR=${PWD}

## check if file exist or need to be downloaded and unpacked into /opt dir
if  [ -f curl-7.61.1.tar.bz2 ]
then
        printf "File exist already in current directory"
else
        printf  "File Doesnt exist, script will download and install\n"
        wget ${SOURCE}
        sudo tar -xvjf curl-7.61.1.tar.bz2 -C /opt/ && cd /opt/curl-7.61.1  && ./configure --prefix=/opt && make && sudo make install
###  Clean up the uneccesary files
        sleep 2
	echo "=============================================="
	echo " ${SOURCE}"
        printf " has been install into /opt directory \n "
	echo "=============================================="
        sleep 2
	echo "============================================================="
        printf "Script will now clean up the downloaded and unpacked files!\n"
        cd ../ && sudo rm -rf curl-7.61.1
	echo "== REMOVED INSTALLATION FILE =="
 	cd ${CURRENTDIR} && sudo rm -rf curl-7.61.1.tar.bz2
	echo "== REMOVED THE BZ2 FILE =="
        echo "============================================================"

fi
sleep 2
echo
echo "=============================================="
echo " ${SOURCE} "
printf " has been install into /opt directory\n"
printf "      ### === Script is done === ###     \n "
echo "=============================================="


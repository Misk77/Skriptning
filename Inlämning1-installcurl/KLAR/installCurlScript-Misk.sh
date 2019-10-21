#!/bin/bash
clear
echo "==========================================="
echo "EXECUTION OF: $0 "
echo "==========================================="
sleep 2
echo

echo "###    SCRIPT FOR CURL INSTALLATION    ###\n
=== WARNING THIS WILLL NEED SUDO PERMISSIONS ==\n
=== PLEASE KNOW WHAT YOU ARE DOING IF INSTALL THIS!! ==="
read -p "Are you OK with this? Y/N" ANSWER

case $ANSWER in
        [y/Y] | [y/Y][e/E][s/S])
                echo "Lets start the installation"
                sleep 2		
                ;;
        [n/N] | [n/N][o/O])
                echo "This program will be terminated!!"
		exit 1
                ;;
        *)
        echo "Please enter y/yes OR n/no"
        ;;
esac


sleep 2
SOURCE="https://curl.haxx.se/download/curl-7.61.1.tar.bz2"
CURRENTDIR=${PWD}

if  [ -f curl-7.61.1.tar.bz2 ]
then
	printf "File exist already in current directory"
else
	printf  "File  doesnt exist, script will download and install"
	wget ${SOURCE}
	tar -xvjf curl-7.61.1.tar.bz2 -C ~/$user/Downloads/
        cd ~/$user/Downloads/curl-7.61.1 && ./configure --prefix=/opt && make && sudo make install
	sleep 2
	echo
	printf "$SOURCE\n has been install into /opt directory\n"
        sleep 2
	echo
	printf "Script will now clean up the downloaded and unpacked files!\n"
	sudo rm -rf ~/$user/Downloads/curl-7.61.1
	sudo rm -rf ${CURRENTDIR}/curl-7.61.1.tar.bz2 
	

fi
echo 
echo "##########################################"
printf "===        Script is done          ===\n"
echo "##########################################"


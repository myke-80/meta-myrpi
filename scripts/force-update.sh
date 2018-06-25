#!/bin/sh

if [ -z "$1" ]; then 
	echo "Please provide base folder"
	exit 1
fi
if [ ! -d "$1" ]; then 
	echo "Folder $1 doesn't exists"
	exit 2
fi

ROOT=${1%/}

if [ ! -d "${ROOT}/poky" ]; then 
	echo "Folder ${ROOT}/poky doesn't exists"
	exit 3
fi

cd ${ROOT}/poky
echo Updating poky
git pull

echo Updating openembedded
cd ${ROOT}/poky/meta-openembedded
git pull
cd ..

echo Updating raspberrypi
cd ${ROOT}/poky/meta-raspberrypi
git pull
cd ..

echo Updating qt5
cd ${ROOT}/poky/meta-qt5
git pull

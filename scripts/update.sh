#!/bin/sh

if [ -z "$1" ]; then 
	echo "Please provide base folder"
	exit 1
fi
if [ ! -d "$1" ]; then 
	echo "Folder $1 doesn't exists"
	exit 2
fi

SCRIPTPATH=$(pwd)/$(dirname "$0")
. ${SCRIPTPATH}/versions.sh

ROOT=${1%/}

if [ ! -d "${ROOT}/poky" ]; then 
	echo "Folder ${ROOT}/poky doesn't exists"
	exit 3
fi

cd ${ROOT}/poky
echo Updating poky
git fetch
git reset --hard ${POKY}

echo Updating openembedded
cd ${ROOT}/poky/meta-openembedded
git fetch
git reset --hard ${OE}
cd ..

echo Updating raspberrypi
cd ${ROOT}/poky/meta-raspberrypi
git fetch
git reset --hard ${RPI}
cd ..

echo Updating qt5
cd ${ROOT}/poky/meta-qt5
git fetch
git reset --hard ${QT5}

#!/bin/sh

POKY_BRANCH="sumo"
OE_BRANCH="sumo"
RPI_BRANCH="sumo"
QT5_BRANCH="sumo"

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
git fetch
git checkout ${POKY_BRANCH}
git pull
git reset HEAD --hard

echo Updating openembedded
cd ${ROOT}/poky/meta-openembedded
git fetch
git checkout ${OE_BRANCH}
git pull
git reset HEAD --hard
cd ..

echo Updating raspberrypi
cd ${ROOT}/poky/meta-raspberrypi
git fetch
git checkout ${RPI_BRANCH}
git pull
git reset HEAD --hard
cd ..

echo Updating qt5
cd ${ROOT}/poky/meta-qt5
git fetch
git checkout ${QT5_BRANCH}
git pull
git reset HEAD --hard

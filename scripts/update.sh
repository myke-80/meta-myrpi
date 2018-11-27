#!/bin/sh

POKY_BRANCH="sumo"
OE_BRANCH="sumo"
RPI_BRANCH="sumo"
QT5_BRANCH="sumo"

POKY="64a257fa22126c4a40ff7e03424a404e360ebe1e"
OE="8760facba1bceb299b3613b8955621ddaa3d4c3f"
RPI="2d40b000021bc8a9ef7f329ed0ad410f8d227b97"
QT5="d4e7f73d04e8448d326b6f89908701e304e37d65"

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
git reset --hard ${POKY}

echo Updating openembedded
cd ${ROOT}/poky/meta-openembedded
git fetch
git checkout ${OE_BRANCH}
git pull
git reset --hard ${OE}
cd ..

echo Updating raspberrypi
cd ${ROOT}/poky/meta-raspberrypi
git fetch
git checkout ${RPI_BRANCH}
git pull
git reset --hard ${RPI}
cd ..

echo Updating qt5
cd ${ROOT}/poky/meta-qt5
git fetch
git checkout ${QT5_BRANCH}
git pull
git reset --hard ${QT5}

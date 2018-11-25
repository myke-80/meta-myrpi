#!/bin/sh

POKY_BRANCH="thud"
OE_BRANCH="thud"
RPI_BRANCH="master"
QT5_BRANCH="thud"

POKY="94b13882510561b4ab7c08fd0343038c154680a4"
OE="f1511d254632a34c1deb51f4bf8b8c21e7423f51"
RPI="f752e9238366db7a6e134bbc00ef1f7697cb7eba"
QT5="18f82a8b32afa7de52004582c44e694cb5d54d84"

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

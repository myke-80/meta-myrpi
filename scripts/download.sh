#!/bin/sh
SCRIPTPATH=$(pwd)/$(dirname "$0")

if [ -z "$1" ]; then 
	echo "Please provide base folder"
	exit 1
fi
if [ ! -d "$1" ]; then 
	echo "Folde $1 doesn't exists"
	exit 2
fi

. ${SCRIPTPATH}/versions.sh

ROOT=${1%/}

cd ${ROOT}

if [ ! -d "${ROOT}/poky" ]; then
	git clone -b master git://git.yoctoproject.org/poky
	cd ${ROOT}/poky
	git reset --hard ${POKY}
fi

cd ${ROOT}/poky

if [ ! -d "${ROOT}/poky/meta-openembedded" ]; then
	git clone -b master git://git.openembedded.org/meta-openembedded
	cd ${ROOT}/poky/meta-openembedded
	git reset --hard ${OE}
fi

cd ${ROOT}/poky

if [ ! -d "${ROOT}/poky/meta-raspberrypi" ]; then
	git clone -b master https://github.com/agherzan/meta-raspberrypi.git
	cd ${ROOT}/poky/meta-raspberrypi
	git reset --hard ${RPI}
fi

cd ${ROOT}/poky

if [ ! -d "${ROOT}/poky/meta-qt5" ]; then
	git clone -b master https://github.com/meta-qt5/meta-qt5
	cd ${ROOT}/poky/meta-qt5
	git reset --hard ${QT5}
fi

if [ ! -d "${ROOT}/build" ]; then
	mkdir ${ROOT}/build
fi

if [ ! -d "${ROOT}/build/conf" ]; then
	mkdir ${ROOT}/build/conf
	sed -e "s+BASE_PATH+${ROOT}+g" ${SCRIPTPATH}/../conf/bblayers.conf.sample > ${ROOT}/build/conf/bblayers.conf
	sed -e "s+BASE_PATH+${ROOT}+g" ${SCRIPTPATH}/../conf/local.conf.sample > ${ROOT}/build/conf/local.conf 
fi


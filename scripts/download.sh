#!/bin/sh
SCRIPTPATH=$(pwd)/$(dirname "$0")

POKY="da3625c52e1ab8985fba4fc3d133edf92142f182"
OE="f0a664f2b7ac42fa8832ecc016ddf8b6260ee50e"
RPI="4bf40b2d322e34a5e3be28486987cc7bbb9125f1"
QT5="bc20e3dcd0176529740beb59ccf1f170b9f828a8"

ROOT=${1%/}

if [ -z "$1" ]; then 
	ROOT=${HOME}/source/yocto-work
elif [ ! -d "${ROOT}" ]; then
	ROOT=${HOME}/source/yocto-work
fi

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


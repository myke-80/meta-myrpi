#!/bin/sh

ROOT=${HOME}/source/yocto-u-boot

cd ${ROOT}/poky
echo Updating poky
git pull

echo Updating openembedded
cd ${ROOT}/poky/meta-openembedded
git pull

echo Updating raspberrypi
cd ${ROOT}/poky/meta-raspberrypi
git pull

echo Updating qt5
cd ${ROOT}/poky/meta-qt5
git pull

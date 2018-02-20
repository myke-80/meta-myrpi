#!/bin/sh

ROOT=${HOME}/source/yocto-u-boot
TEMP=${ROOT}/build/tmp
SDCARD=mmcblk0
DRIVE=/dev/${SDCARD}
IMAGE=rpi-my-image
MACHINE=raspberrypi0-wifi

if [ `whoami` != "root" ]; then
	echo "Must be root !!"
	exit 1
fi

CARDS=`lsblk | grep ${SDCARD}`
if [ -z "${CARDS}" ]; then
	echo "Insert card (${DRIVE} not found)"
	exit 1
fi

IMAGE_PATH=${TEMP}/deploy/images/${MACHINE}/${IMAGE}-${MACHINE}.myrpi-sdimg

if [ ! -f ${IMAGE_PATH} ]; then
	echo "Cannot file sd image to apply"
	exit 1
fi

if [ -b ${DRIVE}1 ]; then
	umount ${DRIVE}1
	umount ${DRIVE}2
elif [ -b ${DRIVE}p1 ]; then
	umount ${DRIVE}p1
	umount ${DRIVE}p2
	umount ${DRIVE}p3
	umount ${DRIVE}p4
else
	umount ${DRIVE}
fi

SIZE=`fdisk -l ${DRIVE} | grep "${DRIVE}" | cut -d' ' -f5 | grep -o -E '[0-9]+'`
echo "=> Size: ${SIZE}"

echo "=> Delete partitions"
dd if=/dev/zero of=${DRIVE} bs=1024 count=1024

echo "=> Apply built sdcard"
dd if=${IMAGE_PATH} of=${DRIVE} bs=1M && sync

echo "=> Create new app parition"
START=`parted ${DRIVE} unit s print | tail -n 2 | head -n 1 | awk '{print substr($3,1,length($3)-1)}'`
parted -s ${DRIVE} -- unit s mkpart primary ext4 $(expr ${START} + 1) -1s

echo "=> Format partition"
mkfs.ext4 -q -L app ${DRIVE}p4

echo "==> Done"
exit 0

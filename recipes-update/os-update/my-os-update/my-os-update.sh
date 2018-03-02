#!/bin/bash

# Names and folders
TMP_DIR=/tmp
BASE=/opt/myke
LOG_DIR=${BASE}/logs
OS_LOG_DIR=${LOG_DIR}/os-update
LOG_FILE=${OS_LOG_DIR}/update.log
MAX_LOG_FILE=15
USB_MOUNT=/mnt/usb
USB_TMP=/mnt/tmp
USB_BASE=${USB_MOUNT}/myke
USB_LOG=${USB_BASE}/backup.logs
USB_UPD=${USB_BASE}/update
UPD_WCARD=*-raspberrypi0-wifi-*.rootfs.tar.bz2
BOOT=/dev/mmcblk0p1
BASE_PART=mmcblk0p
TMP_MOUNT=/mnt/tmp
BOOT_CONF=${TMP_MOUNT}/myke.conf

# Commands
ECHO=/bin/echo
DATE=/bin/date
TAIL=/usr/bin/tail
HEAD=/usr/bin/head
AWK=/usr/bin/awk
CAT=/bin/cat
GREP=/bin/grep
MOUNT=/bin/mount
UMOUNT=/bin/umount
LS=/bin/ls
MKDIR=/bin/mkdir
TAR=/bin/tar
RM=/bin/rm
MV=/bin/mv
CP=/bin/cp
WC=/usr/bin/wc
UNZIP=/bin/gunzip
FORMAT=/sbin/mkfs.ext4
SED=/bin/sed
SHUTDOWN=/sbin/shutdown

create_dir()
{
	if [ ! -d $1 ]
	then
		mkdir $1
	fi
}
log_message()
{
	DATETIME=`$DATE +%Y%m%d-%H%M%S`
	$ECHO "$DATETIME-$LOGMSG" >> ${LOG_FILE}
	# Reset log
	LOGMSG=""
}
purge_log_folder()
{
	if [ -d ${LOG_DIR} ]; then
		#Rename last log
		if [ -f ${LOG_FILE} ]; then
			DT=`$DATE +%Y%m%d-%H%M%S`
			$MV ${LOG_FILE} ${OS_LOG_DIR}/update-${DT}.log
		fi

		NUM_FILES=`$LS ${LOG_DIR}/update- 2>/dev/null | $WC -l`
		while [ ${NUM_FILES} -gt ${MAX_LOG_FILE} ]
		do
			FILE_TO_DEL=`$LS -lrt ${LOG_DIR}/update-* 2>/dev/null | $HEAD -n 1 | $AWK '{print $9;}'`
			$RM -rf ${FILE_TO_DEL}
			NUM_FILES=`$LS ${LOG_DIR}/update-* 2>/dev/null | $WC -l`
		done
	fi
}


# Check log dir
create_dir ${BASE}
create_dir ${LOG_DIR}
create_dir ${OS_LOG_DIR}
create_dir ${USB_MOUNT}
create_dir ${USB_TMP}
# Purge older files
purge_log_folder

# Start log
LOGMSG="== my-os-opdate =="
log_message

LAST_DRIVE=""

while true
do
	sleep 5

	USB=`$LS /dev/sd?? 2>/dev/null`
	if [[ ! -z ${USB} ]]; then

		if [ "${LAST_DRIVE}" == "${USB}" ]; then
			continue;
		fi

		DT=`$DATE +%Y%m%d-%H%M%S`
		LAST_DRIVE=${USB}

		# Mount usb
		${MOUNT} ${USB} ${USB_MOUNT} 2>/dev/null
		if [ $? -ne 0 ]; then
			LOGMSG="Error mounting [${USB}] to [${USB_MOUNT}]"
			log_message
			continue;
		fi

		# Check base folder
		if [ ! -d ${USB_BASE} ]; then
			# Nothing to do
			LOGMSG="Could not find [${USB_BASE}]"
			log_message
			${UMOUNT} ${USB_MOUNT}
			continue;
		fi

		# Check logs folder
		if [ ! -d ${USB_LOG} ]; then
			# Create folder
			LOGMSG="Could not find [${USB_LOG}], create"
			log_message
			create_dir ${USB_LOG}
		fi

		# Save log files
		$TAR -czf ${TMP_DIR}/logs-backup-${DT}.tgz ${LOG_DIR} 2>/dev/null
		if [ $? -eq 0 ]; then
			${MV} ${TMP_DIR}/logs-backup-${DT}.tgz ${USB_LOG}
			LOGMSG="All log files [${TMP_DIR}/logs-backup-${DT}.tgz] saved in [${USB_LOG}]"
			log_message
		else
			LOGMSG="Error copying log files"
			log_message
		fi

		# Check upd folder
		if [ ! -d ${USB_UPD} ]; then
			# Create folder
			LOGMSG="Could not find [${USB_UPD}], no update to apply. Done."
			log_message
			${UMOUNT} ${USB_MOUNT}
			continue;
		fi

		# Check upd file
		USB=`$LS -lrt ${USB_UPD}/${UPD_WCARD} 2>/dev/null | ${TAIL} -n 1 | ${AWK} '{print $9;}'`
		if [ -z ${USB} ]; then
			# Create folder
			LOGMSG="No update to apply in [${USB_UPD}/${UPD_WCARD}]. Done."
			log_message
			${UMOUNT} ${USB_MOUNT}
			continue;
		fi

		LOGMSG="Found update [${USB}]"
		log_message

		# Mount inactive partition
		MOUNTED=`${MOUNT} | ${GREP} ${BASE_PART} | ${HEAD} -n 1 | ${AWK} '{print $1}'`
		INACTIVE="/dev/${BASE_PART}3"
		ACTIVE="/dev/${BASE_PART}2"

		if [ "${MOUNTED}" == "/dev/${BASE_PART}3" ]; then
			INACTIVE="/dev/${BASE_PART}2"
			ACTIVE="/dev/${BASE_PART}3"
		fi

		LOGMSG="Will update inactive partition [${INACTIVE}]"
		log_message

		${MOUNT} ${INACTIVE} ${USB_TMP} 2>/dev/null
		if [ $? -ne 0 ]; then
			LOGMSG="Error mounting [${INACTIVE}] to [${USB_TMP}]"
			log_message
			${UMOUNT} ${USB_MOUNT}
			continue;
		fi

		${RM} -rf ${USB_TMP}/* 2>&1
		if [ $? -ne 0 ]; then
			LOGMSG="Error deleting all files in [${USB_TMP}]"
			log_message
			${UMOUNT} ${USB_MOUNT}
			continue;
		fi

		LOGMSG="Extract all file in [${USB_TMP}]"
		log_message
		${TAR} -C ${USB_TMP} -xjf ${USB} 2>&1

		if [ $? -ne 0 ]; then
			LOGMSG="Error extracting files"
			log_message
			${UMOUNT} ${USB_MOUNT}
			continue;
		fi

		LOGMSG="All files extracted"
		log_message
		
		# Umount
		${UMOUNT} ${USB_TMP}

		# Change boot
		${MOUNT} ${BOOT} ${USB_TMP} 2>/dev/null
		if [ $? -ne 0 ]; then
			LOGMSG="Error mounting [${BOOT}] to [${USB_TMP}]"
			log_message
			${UMOUNT} ${USB_MOUNT}
			continue;
		fi

		LOGMSG="Changing boot partition to [${INACTIVE}]"
		log_message
		${SED} s+root=${ACTIVE}+root=${INACTIVE}+ ${USB_TMP}/cmdline.txt > ${USB_TMP}/cmdline.txt.new

		if [ $? -ne 0 ]; then
			LOGMSG="Error changing active partition"
			log_message
			${UMOUNT} ${USB_MOUNT}
			continue;
		fi

		${MV} ${USB_TMP}/cmdline.txt.new ${USB_TMP}/cmdline.txt
		
		# Umount
		${UMOUNT} ${USB_TMP}
		LOGMSG="All done. Reboot"
		log_message

		${UMOUNT} ${USB_MOUNT}
		${SHUTDOWN} -r now
	else
		if [ ! -z ${LAST_DRIVE} ]; then
			LAST_DRIVE=""
			LOGMSG="Reset last drive, since the drive was removed"
			log_message
		fi
	fi
done

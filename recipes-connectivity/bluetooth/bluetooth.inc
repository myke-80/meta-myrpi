DESCRIPTION = "Bluetooth service enabler for Raspberry Pi 0 w"
SECTION = "net"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

COMPATIBLE_MACHINE = "^rpi$"

do_install_append_raspberrypi0-wifi () {
	install -d ${D}${sysconfdir}/default/
	echo BLUETOOTH_ENABLED=1 > ${D}${sysconfdir}/default/bluetooth
}

RDEPENDS_${PN} = "bluez5 "
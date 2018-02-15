EXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

LINUX_VERSION = "4.14.18"

SRCREV = "62bb67a2cc5d01cf5b9430bf1d743c1bc1ebe48e"
SRC_URI = "git://github.com/raspberrypi/linux.git;branch=rpi-4.14.y"

require linux-raspberrypi.inc

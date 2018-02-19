EXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

LINUX_VERSION = "4.14.18"

SRCREV = "d4ccbc564084ec5a5082a5b0a58c6d0d66f5358a"
SRC_URI = "git://github.com/raspberrypi/linux.git;branch=rpi-4.14.y"

require linux-raspberrypi.inc

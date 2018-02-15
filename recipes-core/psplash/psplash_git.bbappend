FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://psplash-myke.png \
	    file://0001-change-color-file.patch \
	    file://0002-change-bar-image.patch \
	    file://0003-change-psplash-config.patch "

PR = "r16"
SPLASH_IMAGES = " file://psplash-myke.png;outsuffix=default"

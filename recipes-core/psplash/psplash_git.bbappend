FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://psplash-myke.png \
	    file://0001-change-color-file.patch"

SPLASH_IMAGES_append = " file://psplash-myke.png;outsuffix=myke"
ALTERNATIVE_PRIORITY_psplash-myke[psplash] = "15"


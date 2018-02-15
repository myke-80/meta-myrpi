FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Set silence if no debug 
SRC_URI += "${@bb.utils.contains('EXTRA_IMAGE_FEATURES', 'debug-tweaks', "", "file://0001-set-uboot-silent.patch", d)}"
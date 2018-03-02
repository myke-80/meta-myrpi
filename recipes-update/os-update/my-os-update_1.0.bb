FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

DESCRIPTION = "Update packages on RPi. Install a script that runs as service and check usb insertion. If a key is detected it looks for specific files and intructions to what install or remove."
SECTION = "my-os-update"
HOMEPAGE = "https://github.com/myke-80/meta-myrpi"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
PR = "r0"

SRC_URI = "file://my-os-update.sh \
		   file://my-os-update"
S = "${WORKDIR}"

do_install_append () {

	install -d ${D}${bindir}
	install -m 755 my-os-update.sh ${D}${bindir}

	install -d ${D}${sysconfdir}/init.d
	install -m 755 my-os-update ${D}${sysconfdir}/init.d/

	install -d ${D}${sysconfdir}/rc0.d
	install -d ${D}${sysconfdir}/rc1.d
	install -d ${D}${sysconfdir}/rc5.d
	install -d ${D}${sysconfdir}/rc6.d

	ln -s ../init.d/my-os-update ${D}${sysconfdir}/rc0.d/K90my-os-update
	ln -s ../init.d/my-os-update ${D}${sysconfdir}/rc1.d/S90my-os-update
	ln -s ../init.d/my-os-update ${D}${sysconfdir}/rc5.d/S90my-os-update
	ln -s ../init.d/my-os-update ${D}${sysconfdir}/rc6.d/K90my-os-update
}

FILES_${PN} += "${bindir}/my-os-update.sh ${sysconfdir}/init.d/my-os-update ${sysconfdir}/rc0.d \
                ${sysconfdir}/rc1.d ${sysconfdir}/rc5.d ${sysconfdir}/rc6.d "

RDEPENDS_${PN} = "bash"

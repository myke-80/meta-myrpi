FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

DESCRIPTION = "Will perform some operation to start bluetooth."
SECTION = "bluetooth-start"
HOMEPAGE = "https://github.com/myke-80/meta-myrpi"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
PR = "r0"

SRC_URI = "file://bluetooth-start \
           file://bt-start"
S = "${WORKDIR}"

do_install () {

	install -d ${D}${bindir}
	install -m 755 bt-start ${D}${bindir}

	install -d ${D}${sysconfdir}/init.d
	install -m 755 bluetooth-start ${D}${sysconfdir}/init.d/

	install -d ${D}${sysconfdir}/rc1.d
	install -d ${D}${sysconfdir}/rc5.d

	ln -s ../init.d/bluetooth-start ${D}${sysconfdir}/rc1.d/S90bluetooth-start
	ln -s ../init.d/bluetooth-start ${D}${sysconfdir}/rc5.d/S90bluetooth-start
}

FILES_${PN} += "${bindir}/bt-start ${sysconfdir}/init.d/bluetooth-start ${sysconfdir}/rc1.d ${sysconfdir}/rc5.d "

RDEPENDS_${PN} = "bash"

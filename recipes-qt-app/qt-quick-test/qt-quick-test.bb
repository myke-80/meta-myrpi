SUMMARY = "A simple Qt5-QML test application"
HOMEPAGE = "https://github.com/myke-80"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "qtdeclarative"
PR = "r2"

SRCREV = "fe5458a714db39bf79be4f53c15a06c7159114bd"
SRC_URI = "git://github.com/myke-80/qt-quick-test.git"

S = "${WORKDIR}/git"

require recipes-qt/qt5/qt5.inc

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${PN} ${D}${bindir}
}

FILES_${PN} = "${bindir}"
RDEPENDS_${PN} = "qtdeclarative-qmlplugins"
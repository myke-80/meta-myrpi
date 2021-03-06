SUMMARY = "A simple Qt5-QML test application"
HOMEPAGE = "https://github.com/myke-80"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "qtbase qtdeclarative"
PR = "r3"

SRCREV = "59e24d05a5bd383f8435acc595618b26470ddcbc"
SRC_URI = "git://github.com/myke-80/qt-quick-test.git"

S = "${WORKDIR}/git"

require recipes-qt/qt5/qt5.inc recipes-connectivity/bluetooth/bluetooth.inc

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${B}/qt-quick-test ${D}${bindir}
}

FILES_${PN} = "${bindir} ${sysconfdir}"
RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtconnectivity-qmlplugins "

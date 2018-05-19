SUMMARY = "A simple Qt5-QML test application to detect bluetooth devices"
HOMEPAGE = "https://github.com/myke-80"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "qtdeclarative qtconnectivity"
PR = "r3"

QT_BT_TARGET_NAME = "qt-bt-scanner"

SRCREV = "4c06baef291f7bf7b737318e8a0907d0f205074d"
SRC_URI = "git://github.com/myke-80/qt-bluetooth.git"

S = "${WORKDIR}/git"

require recipes-qt/qt5/qt5.inc recipes-connectivity/bluetooth/bluetooth.inc

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${QT_BT_TARGET_NAME} ${D}${bindir}
}

FILES_${PN} = "${bindir} ${sysconfdir}"
RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtconnectivity-qmlplugins "

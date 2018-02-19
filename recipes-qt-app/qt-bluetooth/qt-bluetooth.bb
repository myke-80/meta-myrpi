SUMMARY = "A simple Qt5-QML test application to detect bluetooth devices"
HOMEPAGE = "https://github.com/myke-80"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "qtdeclarative qtconnectivity"
PR = "r1"

QT_BT_TARGET_NAME = "qml_scanner"

SRCREV = "676cccf07e262f20fbfbe41b6a8939fe53d639af"
SRC_URI = "git://github.com/myke-80/qt-bluetooth.git"

S = "${WORKDIR}/git"

require recipes-qt/qt5/qt5.inc

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${QT_BT_TARGET_NAME} ${D}${bindir}
}

FILES_${PN} = "${bindir}"
RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtconnectivity-qmlplugins"
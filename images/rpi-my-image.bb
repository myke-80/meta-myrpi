# Base this image on core-image-minimal
include recipes-core/images/core-image-minimal.bb

CORE = " \
    kernel-modules \
"

CORE_EXTRA = " \
    coreutils \
    file \
"

EXTRA_TOOLS = " \
    devmem2 \
    dosfstools \
    fbset \
    findutils \
    procps \
    sysfsutils \
    util-linux \
"

RPI = " \
    userland \
"

TUNES = " \
    psplash \
"

QT5 = " \
	qt5-env \
"

QT_TEST = " \
	qt-quick-test \
"

# Include modules in rootfs
IMAGE_INSTALL += " \
	${CORE} \
	${CORE_EXTRA} \
	${EXTRA_TOOLS} \
	${RPI} \
	${TUNES} \
	${QT5} \
	${QT_TEST} \
"

disable_respawn() {
    sed -e 's/S0:12345:respawn/# S0:12345:respawn/' "${IMAGE_ROOTFS}/etc/inittab" > "${IMAGE_ROOTFS}/etc/inittab.tmp"
    mv "${IMAGE_ROOTFS}/etc/inittab.tmp" "${IMAGE_ROOTFS}/etc/inittab"
}

ROOTFS_POSTPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', " disable_respawn ; ", "", d)}"

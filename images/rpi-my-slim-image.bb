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

CONNECTIVITY = " \
    linux-firmware-bcm43430 \
    bluez5 \
    bluez5-testtools \
    bluez5-noinst-tools \
"

RPI = " \
    userland \
"

QT5 = " \
	qt5-env \
"

QT_TEST = " \
	qt-quick-test \
    qt-bluetooth \
"

# Include modules in rootfs
IMAGE_INSTALL += " \
	${CORE} \
	${RPI} \
    ${CONNECTIVITY} \
	${QT5} \
	${QT_TEST} \
"

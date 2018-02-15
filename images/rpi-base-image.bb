# Base this image on core-image-minimal
include recipes-core/images/core-image-minimal.bb

CORE = " \
    kernel-modules \
"

CORE_EXTRA = " \
    coreutils \
    file \
"

# Include modules in rootfs
IMAGE_INSTALL += " \
	${CORE} \
    ${CORE_EXTRA} \
	"

disable_respawn() {
    sed -e 's/S0:12345:respawn/# S0:12345:respawn/' "${IMAGE_ROOTFS}/etc/inittab" > "${IMAGE_ROOTFS}/etc/inittab.tmp"
    mv "${IMAGE_ROOTFS}/etc/inittab.tmp" "${IMAGE_ROOTFS}/etc/inittab"
}

ROOTFS_POSTPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', " disable_respawn ; ", "", d)}"

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

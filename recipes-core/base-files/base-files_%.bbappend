hostname = "myrpi0w"

add_p4_fstab() {
	sed -e 's+#/dev/mmcblk0p1+/dev/mmcblk0p4+g' \
	    -e 's+/media/card+/opt/myke+g' \
	    -e 's+sync,noauto+sync+g' \
	    ${D}${sysconfdir}/fstab > ${D}${sysconfdir}/fstab.new

	mv ${D}${sysconfdir}/fstab.new ${D}${sysconfdir}/fstab
}

do_install_append() {
	${@bb.utils.contains('IMAGE_FSTYPES', 'myrpi-sdimg', "add_p4_fstab ; ", "", d)}
	install -d ${D}/opt/myke
}

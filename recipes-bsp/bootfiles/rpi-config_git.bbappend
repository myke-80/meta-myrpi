
do_deploy_append() {

    if [ -n "${DISABLE_SPLASH}" ]; then
        sed -i '/#disable_splash=/ c\disable_splash=${DISABLE_SPLASH}' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi

    # HDMI display rotation
    # 0 = none, 1 = 90cw, 2 = 180cw, 3 = 270cw, 0x10000 = hflip, 0x20000 = vflip
    if [ -n "${DISPLAY_ROTATE}" ]; then
        sed -i '/#display_rotate=/ c\display_rotate=${DISPLAY_ROTATE}' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi

    # HDMI group, 0 = default, auto-detect, 1 = CEA (tv), 2 = DMT (monitor)
    if [ -n "${HDMI_GROUP}" ]; then
        sed -i '/#hdmi_group=/ c\hdmi_group=${HDMI_GROUP}' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi

    # HDMI mode
    if [ -n "${HDMI_MODE}" ]; then
        sed -i '/#hdmi_mode=/ c\hdmi_mode=${HDMI_MODE}' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi
}

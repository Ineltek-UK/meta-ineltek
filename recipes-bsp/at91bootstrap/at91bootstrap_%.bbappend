COMPATIBLE_MACHINE = "eink_extcon_demo"

do_configure_prepend () {
    # Alter U-Boot storage location
    echo "CONFIG_IMG_ADDRESS=\"${UBOOT_IMG_ADDRESS}\""  >> ${S}/board/${AT91BOOTSTRAP_MACHINE}/${AT91BOOTSTRAP_TARGET}
    # Alter size of U-Boot Image to load
    echo "CONFIG_IMG_SIZE=\"${UBOOT_IMG_SIZE}\""  >> ${S}/board/${AT91BOOTSTRAP_MACHINE}/${AT91BOOTSTRAP_TARGET}
}

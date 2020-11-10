COMPATIBLE_MACHINE = "eink_extcon_demo"

#AT91Bootstrap Config - load to QSPI flash
AT91BOOTSTRAP_MACHINE = "sama5d27_som1_ek"
AT91BOOTSTRAP_LOAD = "qspiboot-uboot" 
AT91BOOTSTRAP_CONFIG = "sama5d27_som1_ekqspi_uboot"

do_configure_prepend () {
    # Alter U-Boot storage location
    echo "CONFIG_IMG_ADDRESS=\"${UBOOT_IMG_ADDRESS}\""  >> ${S}/board/${AT91BOOTSTRAP_MACHINE}/${AT91BOOTSTRAP_TARGET}
    # Alter size of U-Boot Image to load
    echo "CONFIG_IMG_SIZE=\"${UBOOT_IMG_SIZE}\""  >> ${S}/board/${AT91BOOTSTRAP_MACHINE}/${AT91BOOTSTRAP_TARGET}
}

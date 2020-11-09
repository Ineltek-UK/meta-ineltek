COMPATIBLE_MACHINE = "eink_extcon_demo"

ENV_FILENAME = "u-boot-env.bin"

FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
SRC_URI_append += " file://envs/eink_extcon_demo.txt"

do_configure_prepend () {
    # Configure U-Boot Environment Storage Location
    #echo "CONFIG_ENV_OFFSET=${UBOOT_ENV_STORAGE_ADDRESS}"  >> ${S}/configs/${UBOOT_MACHINE}
    #echo "CONFIG_ENV_SIZE=${UBOOT_ENV_STORAGE_SIZE}"  >> ${S}/configs/${UBOOT_MACHINE}
    echo "CONFIG_ENV_OFFSET=0x4000"  >> ${S}/configs/${UBOOT_MACHINE}
    echo "CONFIG_ENV_SIZE=0x6000"  >> ${S}/configs/${UBOOT_MACHINE}
    # Configure U-Boot Environment Storage
    echo "CONFIG_ENV_SPI_BUS=0"  >> ${S}/configs/${UBOOT_MACHINE}
    echo "CONFIG_ENV_SPI_CS=0"  >> ${S}/configs/${UBOOT_MACHINE}
    echo "CONFIG_ENV_SPI_MODE=0"  >> ${S}/configs/${UBOOT_MACHINE}
    echo "CONFIG_ENV_SECT_SIZE=0x1000"  >> ${S}/configs/${UBOOT_MACHINE}
}
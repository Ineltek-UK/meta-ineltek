COMPATIBLE_MACHINE = "eink_extcon_demo"

ENV_FILENAME = "u-boot-env.bin"

FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
SRC_URI_append += " file://envs/eink_extcon_demo.txt"

#U-Boot Config - environment variables in QSPI flash
UBOOT_MACHINE = "sama5d27_som1_ek_qspiflash_defconfig"

do_configure () {
    # Configure U-Boot Environment Storage Location
    echo "CONFIG_ENV_OFFSET=${UBOOT_ENV_ADDRESS}"  >> ${S}/configs/${UBOOT_MACHINE}
    echo "CONFIG_ENV_SIZE=${UBOOT_ENV_SIZE}"  >> ${S}/configs/${UBOOT_MACHINE}
    # Configure U-Boot Environ#ment Storage
    echo "CONFIG_ENV_SPI_BUS=0"  >> ${S}/configs/${UBOOT_MACHINE}
    echo "CONFIG_ENV_SPI_CS=0"  >> ${S}/configs/${UBOOT_MACHINE}
    echo "CONFIG_ENV_SPI_MODE=0"  >> ${S}/configs/${UBOOT_MACHINE}
    echo "CONFIG_ENV_SECT_SIZE=0x1000"  >> ${S}/configs/${UBOOT_MACHINE}
}

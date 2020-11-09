COMPATIBLE_MACHINE = "eink_extcon_demo"

ENV_FILENAME = "u-boot-env.bin"

FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
SRC_URI_append += " file://envs/eink_extcon_demo.txt"
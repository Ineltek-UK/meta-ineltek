COMPATIBLE_MACHINE = "eink-extcon-demo"

FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
SRC_URI_append += " file://ineltek_config.cfg \
           			file://eink_extcon_demo.dts \
"

do_configure_append () {
	cp ${WORKDIR}/eink_extcon_demo.dts \
	${S}/arch/${ARCH}/boot/dts
}
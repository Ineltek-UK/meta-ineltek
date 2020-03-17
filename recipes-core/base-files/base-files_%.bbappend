do_install_basefilesissue () {
	if [ "${hostname}" ]; then
		echo ${hostname} > ${D}${sysconfdir}/hostname
	fi

	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
        if [ -n "${DISTRO_NAME}" ]; then
		printf "Ineltek E Ink Flavoured Yocto - Atmel Build (\\\m)\n${DISTRO_NAME} - " >> ${D}${sysconfdir}/issue
		printf "Ineltek E Ink Flavoured Yocto - Atmel Build (\\\m)\n${DISTRO_NAME} - " >> ${D}${sysconfdir}/issue.net
		if [ -n "${DISTRO_VERSION}" ]; then
			distro_version_nodate=${@'${DISTRO_VERSION}'.replace('snapshot-${DATE}','snapshot').replace('${DATE}','')}
			printf "%s " $distro_version_nodate >> ${D}${sysconfdir}/issue
			printf "%s " $distro_version_nodate >> ${D}${sysconfdir}/issue.net
		fi
		printf "\n\\\n\n--------------------------------------\n" >> ${D}${sysconfdir}/issue
		echo >> ${D}${sysconfdir}/issue
		echo "%h"    >> ${D}${sysconfdir}/issue.net
		echo >> ${D}${sysconfdir}/issue.net
 	fi
}

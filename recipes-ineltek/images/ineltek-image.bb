DESCRIPTION = "Ineltek's E Ink ExtCon Yocto Image"
LICENSE = "MIT"
PR = "r0"

IMAGE_FEATURES += "ssh-server-openssh package-management"
IMAGE_INSTALL += "stb"

IMAGE_INSTALL = "\
    libusb1 \
    packagegroup-core-boot \
    packagegroup-core-full-cmdline \
    packagegroup-base-usbgadget \
    openssh-sftp \
    openssh-sftp-server \
    kernel-modules \
    lrzsz \
    setserial \
    opkg \
    iperf3 \
    \
    nbench-byte \
    lmbench \
    \
    linux-firmware-sd8686 \
    linux-firmware-sd8688 \
    linux-firmware-sd8787 \
    linux-firmware-sd8797 \
    linux-firmware-sd8801 \
    linux-firmware-sd8887 \
    linux-firmware-sd8897 \
    linux-firmware-ralink \
    linux-firmware-rtl8188 \
    linux-firmware-rtl8723 \
    linux-firmware-rtl8821 \
    linux-firmware-rtl8192cu \
    linux-firmware-rtl8192ce \
    linux-firmware-rtl8192su \
    linux-firmware-rtl8723 \
    \
    alsa-utils \
    mpg123 \
    i2c-tools \
    spitools \
    devmem2 \
    dosfstools \
    libdrm-tests \
    mtd-utils \
    mtd-utils-ubifs \
    dtc \
    dtc-misc \
    iproute2 \
    iptables \
    bridge-utils \
    can-utils \
    evtest \
    mpio \
    gdbserver \
    usbutils \
    wget \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    \
    cjson \
    libplanes \
    \
    libicui18n \
    libv4l \
    v4l-utils \
    \
    tslib \
    tslib-conf \
    tslib-tests \
    tslib-calibrate \
    cairo \
    nano \
    librsvg \
    pango \
    lsscsi \
    libpng \
    libsdl \
    libsdl2 \
    libsdl2-image \
    apt \
    wireshark \
    libpcap \
    git \
    tcpdump \
"

inherit core-image populate_sdk

do_build_complete() {
    # Copy AT91Bootstrap Binary
    cp ${DEPLOY_DIR}/images/${MACHINE}/at91bootstrap.bin \
    ${CUSTOM_DEPLOY_DIR}/at91bootstrap.bin
    # Copy U-Boot Binary
    cp ${DEPLOY_DIR}/images/${MACHINE}/u-boot.bin \
    ${CUSTOM_DEPLOY_DIR}/u-boot.bin
    # Copy U-Boot Env Binary
    cp ${DEPLOY_DIR}/images/${MACHINE}/u-boot-env.bin \
    ${CUSTOM_DEPLOY_DIR}/u-boot-env.bin
    # Copy Device Tree
    cp ${DEPLOY_DIR}/images/${MACHINE}/${KERNEL_DEVICETREE} \
    ${CUSTOM_DEPLOY_DIR}/${KERNEL_DEVICETREE}
    # Copy Kernel Binary
    cp ${DEPLOY_DIR}/images/${MACHINE}/zImage \
    ${CUSTOM_DEPLOY_DIR}/zImage.bin

    # Ensures BitBake can find the bmaptool command
    export PATH="/usr/bin"
    # Create virtual image for RootFS with 2 GiB size
    dd if=/dev/zero of=${DEPLOY_DIR}/images/${MACHINE}/${IMAGE_BASENAME}-${MACHINE}.img bs=1M count=1
    # Copy the wic file to our virtual image
    bmaptool copy ${DEPLOY_DIR}/images/${MACHINE}/${IMAGE_BASENAME}-${MACHINE}.wic \
    ${DEPLOY_DIR}/images/${MACHINE}/${IMAGE_BASENAME}-${MACHINE}.img
    # Copy Virtual Image
    cp ${DEPLOY_DIR}/images/${MACHINE}/${IMAGE_BASENAME}-${MACHINE}.img \
    ${CUSTOM_DEPLOY_DIR}/${IMAGE_BASENAME}-${MACHINE}.img

    # Copy SAM-BA QML
    cp ${THISDIR}/../../sam-ba-configs/eink-extcon-demo-qspiflash.qml \
    ${CUSTOM_DEPLOY_DIR}/eink-extcon-demo-qspiflash.qml
}

addtask build_complete after do_image_complete before do_rm_work
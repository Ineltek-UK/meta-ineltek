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

#TOOLCHAIN_HOST_TASK += "nativesdk-sam-ba"

export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE="gcc-linaro/bin/arm-linux-gnueabihf-"
make mrproper
make heliox_defconfig
./build_cwm_zip.sh


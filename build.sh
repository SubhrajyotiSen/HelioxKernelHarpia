export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE="gcc-linaro/bin/arm-linux-gnueabihf-"
make mrproper
make harpia_defconfig
./build_cwm_zip.sh


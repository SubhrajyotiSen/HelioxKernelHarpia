export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE="gcc-linaro/bin/arm-linux-gnueabihf-"
export KBUILD_BUILD_USER="Subhrajyoti"
export KBUILD_BUILD_HOST="Beast"
make mrproper
make heliox_defconfig
./build_cwm_zip.sh

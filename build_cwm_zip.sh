#!/bin/bash
set -e
rm -f arch/arm/boot/dts/*.dtb
rm -f arch/arm/boot/dt.img
rm -f cwm_flash_zip/boot.img
make -j4 zImage
make -j4 dtimage
make -j4 modules
rm -rf heliox_install
mkdir -p heliox_install
make -j4 modules_install INSTALL_MOD_PATH=heliox_install INSTALL_MOD_STRIP=1
mkdir -p cwm_flash_zip/system/lib/modules/pronto
find heliox_install/ -name '*.ko' -type f -exec cp '{}' cwm_flash_zip/system/lib/modules/ \;
mv cwm_flash_zip/system/lib/modules/wlan.ko cwm_flash_zip/system/lib/modules/pronto/pronto_wlan.ko
cp arch/arm/boot/zImage cwm_flash_zip/tools/
cp arch/arm/boot/dt.img cwm_flash_zip/tools/
rm -f arch/arm/boot/heliox_kernel.zip
cd cwm_flash_zip
zip -r ../arch/arm/boot/heliox_kernel.zip ./

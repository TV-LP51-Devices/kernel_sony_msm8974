#!/bin/bash

for device in honami togari amami; do

DEFCONFIG_FILE=cm_rhine_row_${device}_defconfig

for device in sirius castor castor_windy leo aries scorpion scorpion_windy ; do

DEFCONFIG_FILE=cm_shinano_${device}_defconfig

if [ ! -e arch/arm/configs/$DEFCONFIG_FILE ]; then
	echo "No such file: arch/arm/configs/$DEFCONFIG_FILE"
	exit -1
fi

# make .config
make ARCH=arm CROSS_COMPILE=arm-eabi- ${DEFCONFIG_FILE} -j8

mv .config arch/arm/configs/${DEFCONFIG_FILE}
done
make mrproper -j8

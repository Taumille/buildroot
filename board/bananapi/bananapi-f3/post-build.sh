#!/bin/bash
set -e

MKIMAGE="${HOST_DIR}"/bin/mkimage
MKENVIMAGE="${HOST_DIR}"/bin/mkenvimage
BOARD_DIR="$(pwd)"/"${0%/*}"

"${MKENVIMAGE}" -s 16384 -o "${BINARIES_DIR}"/u-boot-env.bin "${BOARD_DIR}"/bananapi_f3.env

pushd "${BINARIES_DIR}"
cp "${BUILD_DIR}"/uboot-*/bootinfo_sd.bin "${BINARIES_DIR}"/
cp "${BUILD_DIR}"/uboot-*/u-boot.itb "${BINARIES_DIR}"/
cp "${BUILD_DIR}"/uboot-*/FSBL.bin "${BINARIES_DIR}"/
cp "${BUILD_DIR}"/opensbi-*/build/platform/generic/firmware/fw_dynamic.itb "${BINARIES_DIR}"/
popd

support/scripts/genimage.sh -c "${BOARD_DIR}"/genimage.cfg

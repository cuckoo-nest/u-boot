#!/bin/bash
set -e

# Get the path this script is located in
SCRIPT_DIR="$(realpath "$(dirname "$0")")"
cd "$SCRIPT_DIR" || exit 1
echo $SCRIPT_DIR

# Setup the toolchain
source toolchain/bootstrap.sh
CONFIG="diamond"

if [[ -n "$1" ]]; then
    CONFIG="$1"
fi

(
    cd u-boot
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- distclean
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- "$CONFIG"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-
)
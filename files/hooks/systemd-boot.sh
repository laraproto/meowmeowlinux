#!/bin/bash

source /etc/os-release

echo "Checking if bootloader installed..."
if ! bootctl is-installed; then
    echo "Installing systemd-boot..."
    bootctl install
fi;

LOADER_ENTRY = $(bootctl --print-boot-path)/loader/entries/${ALUS_COMMIT_HASH}.conf
if [ ! -e $LOADER_ENTRY ]; then
cat << EOF > $LOADER_ENTRY
title   ${PRETTY_NAME} (${ALUS_COMMIT_HASH})
linux   /vmlinuz-${ALUS_COMMIT_HASH}
initrd  /initramfs-${ALUS_COMMIT_HASH}.img
options COMMIT_HASH=${ALUS_COMMIT_HASH}
EOF
fi

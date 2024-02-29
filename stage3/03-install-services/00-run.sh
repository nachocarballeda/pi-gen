#!/bin/bash -e

install -v -d					"${ROOTFS_DIR}/etc/labgrid"
install -v -m 600 files/exporter.yaml	"${ROOTFS_DIR}/etc/labgrid/"
install -v -m 600 files/coordinator.yaml	"${ROOTFS_DIR}/etc/labgrid/"

install -v -m 600 files/labgrid-coordinator.service	"${ROOTFS_DIR}/etc/systemd/system/"
install -v -m 600 files/labgrid-exporter.service	"${ROOTFS_DIR}/etc/systemd/system/"

if [ -f "${ROOTFS_DIR}/etc/systemd/system/labgrid-exporter.service" ]; then
    sed -i "s/User=.*/User=$FIRST_USER_NAME/" 
fi

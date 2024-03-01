#!/bin/bash -e

for file in files/*; do
    if [ -f "$file" ]; then
        sed -i "s/example_user/$FIRST_USER_NAME/g" "$file"
    fi
done

install -v -d					"${ROOTFS_DIR}/etc/labgrid"
install -v -m 600 files/exporter.yaml	"${ROOTFS_DIR}/etc/labgrid/"
install -v -m 600 files/coordinator.yaml	"${ROOTFS_DIR}/etc/labgrid/"

install -v -m 600 files/labgrid-coordinator.service	"${ROOTFS_DIR}/etc/systemd/system/"
install -v -m 600 files/labgrid-exporter.service	"${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
    systemctl enable labgrid-coordinator.service
EOF

on_chroot << EOF
    systemctl enable labgrid-exporter.service
EOF

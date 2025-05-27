#!/bin/bash -xe

for file in files/*; do
    if [ -f "$file" ]; then
        sed -i "s/example_user/$FIRST_USER_NAME/g" "$file"
        sed -i "s/example_key/$NETBIRD_SETUP_KEY/g" "$file"
        sed -i "s/example_wifi_ssid/$WIFI_SSID/g" "$file"
        sed -i "s/example_wifi_pswd/$WIFI_PSWD/g" "$file"
    fi
done

install -v -m 755 -d "${ROOTFS_DIR}/home/$FIRST_USER_NAME/scripts"
install -v -m 777 files/get_keys.sh    "${ROOTFS_DIR}/home/$FIRST_USER_NAME/scripts/"

install -v -m 600 files/netbird-up.service	        "${ROOTFS_DIR}/etc/systemd/system/"
install -v -m 600 files/authorized-keys.service	    "${ROOTFS_DIR}/etc/systemd/system/"
install -v -m 600 files/inet-up.service	            "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
    systemctl enable inet-up.service
    systemctl enable netbird-up.service
    systemctl enable authorized-keys.service
EOF


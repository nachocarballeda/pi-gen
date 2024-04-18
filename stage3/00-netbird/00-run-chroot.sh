#!/bin/bash -e

apt-get update
apt-get install ca-certificates curl gnupg -y
rm -f /usr/share/keyrings/netbird-archive-keyring.gpg
curl -sSL https://pkgs.netbird.io/debian/public.key | gpg --batch --dearmor --output /usr/share/keyrings/netbird-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/netbird-archive-keyring.gpg] https://pkgs.netbird.io/debian stable main' | tee /etc/apt/sources.list.d/netbird.list
apt-get update

# Generate SSH key pair
ssh-keygen -t rsa -b 4096 -C "$FIRST_USER_NAME@sentrisense.com" <<< y

# Get the public key
public_key=$(cat ~/.ssh/id_rsa.pub)

# Copy the public key to remote host's known_hosts file
mkdir -p ~/.ssh && echo \"$public_key\" >> ~/.ssh/authorized_keys


#!/bin/bash -e

script_path="/usr/local/bin/setup_tools.sh"

touch $script_path
chmod +x $script_path

echo "#!/bin/bash -e" > $script_path
echo "netbird up --setup-key $NETBIRD_SETUP_KEY" >> $script_path
echo "$script_path" >> /etc/rc.local




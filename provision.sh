# Exit immediately on failure
set -e

# Print the commands as they are executed
set -x



# Improves on this: https://github.com/martinanderssondotcom/box-ubuntu-budgie-17-x64/issues/3
DIR=/etc/systemd/system/apt-daily.timer.d
mkdir $DIR

echo '[Timer]
OnCalendar=
OnBootSec=15min
OnUnitActiveSec=1d
AccuracySec=1h
RandomizedDelaySec=30min
Persistent=false' > $DIR/delayed-start-after-boot.conf



# Authorize Vagrant's insecure public SSH key
mkdir /home/vagrant/.ssh/
chmod 700 /home/vagrant/.ssh/
wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant: /home/vagrant/.ssh/

# Set root password to "vagrant"
echo root:vagrant | chpasswd

# Passwordless sudo
echo '\nvagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers



# Update/upgrade
apt-get update
apt-get full-upgrade -y



# Delete stuff
apt-get --purge autoremove -y
apt-get clean

rm -rf /var/log/*
rm -rf /home/vagrant/.cache/*
rm -rf /root/.cache/*
rm -rf /var/cache/*
rm -rf /var/tmp/*
rm -rf /tmp/*

# Clear recent bash history
cat /dev/null > /home/vagrant/.bash_history
cat /dev/null > /root/.bash_history

# Fill empty space with zeroes
set +e
# This is supposed to crash with an error message:
#   "dd: error writing 'zerofile': No space left on device"
dd if=/dev/zero of=zerofile bs=1M
set -e

rm -f zerofile
sync
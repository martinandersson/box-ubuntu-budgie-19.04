# Install the real Guest Additions, no distro-sponsored hack that doesn't work!
# ("~/VBoxGuestAdditions.iso" uploaded to guest from host by Packer's builder)

apt-get install -y gcc make
mount -o loop,ro VBoxGuestAdditions.iso /mnt

# Yes, it is expected this guy fails..
set +e
/mnt/VBoxLinuxAdditions.run
set -e
echo Installed VirtualBox Guest Additions $(VBoxService --version)

umount /mnt
rm VBoxGuestAdditions.iso
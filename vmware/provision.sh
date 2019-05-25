mount -o loop,ro linux.iso /mnt

/mnt/run_upgrader.sh
echo Installed VMware Tools $(vmware-toolbox-cmd -v)

umount /mnt
rm linux.iso
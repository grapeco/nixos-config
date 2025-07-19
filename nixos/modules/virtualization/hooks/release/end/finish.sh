#!/run/current-system/sw/bin/bash
set -x

modprobe -r vfio-pci

virsh nodedev-reattach pci_0000_03_00_0
virsh nodedev-reattach pci_0000_03_00_1

nvidia-xconfig --query-gpu-info > /dev/null 2>&1

modprobe nvidia
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia_drm

sleep 5

echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

systemctl start display-manager.service

#!/run/current-system/sw/bin/bash
set -x

systemctl stop display-manager.service

echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

modprobe -r nvidia_drm nvidia_modeset nvidia_uvm nvidia

sleep 2

virsh nodedev-detach pci_0000_03_00_0
virsh nodedev-detach pci_0000_03_00_1

modprobe vfio-pci

#!/run/current-system/sw/bin/bash
set -x

# Stop display manager
systemctl stop display-manager

# Unbind VTconsoles: might not be needed
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI Framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Avoid race condition
sleep 5

# Unload NVIDIA kernel modules
modprobe -r nvidia_drm nvidia_uvm nvidia_modeset nvidia

# Detach GPU devices from host
# Use your GPU and HDMI Audio PCI host device
virsh nodedev-detach pci_0000_03_00_0
virsh nodedev-detach pci_0000_03_00_1

# Load vfio module
modprobe vfio-pci

#!/bin/bash

yay -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader cuda

sudo sed -i '7s/$/ nvidia_drm.modeset=1/' /boot/loader/entries/*.conf
sudo sed -i '1s/.*/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf

sudo mkdir /etc/pacman.d/hooks/
sudo tee -a /etc/pacman.d/hooks/nvidia.hook >> /dev/null <<EOT
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia-dkms
Target=linux-lts

[Action]
Description=Update NVIDIA module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
EOT

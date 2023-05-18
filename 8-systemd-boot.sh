#!/bin/bash

sudo mkdir /etc/pacman.d/hooks/
sudo tee -a /etc/pacman.d/hooks/95-systemd-boot.hook >> /dev/null <<EOT
[Trigger]
Type = Package
Operation = Upgrade
Target = systemd

[Action]
Description = Gracefully upgrading systemd-boot...
When = PostTransaction
Exec = /usr/bin/systemctl restart systemd-boot-update.service
EOT

sudo tee -a /boot/loader/loader.conf > /dev/null <<EOT
timeout 3
console-mode 2
EOT
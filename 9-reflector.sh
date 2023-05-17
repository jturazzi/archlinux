#!/bin/bash

yay -S reflector
sudo tee -a /etc/xdg/reflector/reflector.conf > /dev/null <<EOT
--save /etc/pacman.d/mirrorlist
--country France
--protocol https
--latest 5
--sort age
EOT

sudo systemctl enable --now reflector.service
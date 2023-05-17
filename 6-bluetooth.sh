#!/bin/bash

yay -S –needed bluez bluez-utils
sudo systemctl enable --now  bluetooth.service

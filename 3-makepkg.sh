#!/bin/bash

sudo tee -a /etc/makepkg.conf >> /dev/null <<EOT

# Compilation
MAKEFLAGS="-j$(nproc)"
EOT






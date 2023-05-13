#!/bin/bash

# Install KDE Minimal
########################
apt -y install sddm
apt -y install kde-plasma-desktop

echo "[General]\nInputMethod=" >> /etc/sddm.conf

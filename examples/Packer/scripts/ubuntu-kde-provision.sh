#!/bin/bash

# Install KDE Minimal
########################
sudo apt -y update
sudo apt -y install sddm
sudo apt -y install kde-plasma-desktop

sudo echo "[General]\nInputMethod=" >> /etc/sddm.conf

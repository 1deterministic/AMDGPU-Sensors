#!/bin/bash

echo "stopping service..."
sudo systemctl stop amdgpu-sensors-daemon.service

echo "disabling service..."
sudo systemctl disable amdgpu-sensors-daemon.service

echo "removing systemd service..."
sudo rm "/etc/systemd/system/amdgpu-sensors-daemon.service"

echo "uninstalling daemon..."
sudo rm "/usr/bin/amdgpu-sensors-daemon.py"

echo "reloading services..."
sudo systemctl daemon-reload

echo "removing sensors folder..."
sudo rm -r "/tmp/amdgpu-sensors"

echo "Done!"

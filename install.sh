#!/bin/bash

echo "installing daemon..."
sudo cp "amdgpu-sensors-daemon.py" "/usr/bin"

echo "installing systemd service..."
sudo cp "amdgpu-sensors-daemon.service" "/etc/systemd/system"

echo "reloading services..."
sudo systemctl daemon-reload

echo "enabling service..."
sudo systemctl enable amdgpu-sensors-daemon.service

echo "starting service..."
sudo systemctl start amdgpu-sensors-daemon.service

echo "Done!"

#!/bin/bash

echo "creating target folder..."
sudo mkdir "/etc/amdgpu-sensors"

echo "installing sensors..."
sudo cp "amdgpu-sensors.pl" "/etc/amdgpu-sensors"

echo "Done! You must now manually add AMDGPU.sgrd in a new tab in Ksysguard (File -> Import tab from file -> $PWD/AMDGPU.sgrd"

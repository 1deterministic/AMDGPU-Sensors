#!/usr/bin/python3

# uses a running amdgpu-sensors-daemon.py to display a simple gpu monitor in the terminal

import os
import sys
import time

if __name__ == "__main__":        
    # folder to find sensor files
    root = "/tmp/amdgpu-sensors"
    
    # refresh interval
    sleep_secs = 1
        
    # values to get
    gpu_temperature = 0
    gpu_usage = 0
    gpu_frequency = 0
    gpu_power = 0
    gpu_voltage = 0
    mem_frequency = 0
    mem_usage = 0
    
    try:
        while (True):
            # reads data from the sensor files
            mem_frequency = open(os.path.join(root, "mem_frequency"), "r").read()
            gpu_frequency = open(os.path.join(root, "gpu_frequency"), "r").read()
            gpu_voltage = open(os.path.join(root, "gpu_voltage"), "r").read()
            gpu_power = open(os.path.join(root, "gpu_power"), "r").read()
            gpu_temperature = open(os.path.join(root, "gpu_temperature"), "r").read()
            gpu_usage = open(os.path.join(root, "gpu_usage"), "r").read()
            mem_usage = open(os.path.join(root, "mem_usage"), "r").read()
            
            print("mem_frequency:", mem_frequency, "MHz")
            print("gpu_frequency:", gpu_frequency, "MHz")
            print("gpu_voltage:", gpu_voltage, "mV")
            print("gpu_power:", gpu_power, "W")
            print("gpu_temperature:", gpu_temperature, "C")
            print("gpu_usage:", gpu_usage, "%")
            print("mem_usage:", mem_usage, "MB")
            
            # sleep
            time.sleep(sleep_secs)
            
            for i in range(0, 7):
                sys.stdout.write('\x1b[1A')
                sys.stdout.write('\x1b[2K')
                
    except(KeyboardInterrupt):
        exit("")
    except(FileNotFoundError):
        exit("File not found: are you sure amdgpu-sensors-daemon.py is running?")
    except():
        exit()

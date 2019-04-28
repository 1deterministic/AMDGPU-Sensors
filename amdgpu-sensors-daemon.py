#!/usr/bin/python3

# this daemon provides non-root access to sensor data that would otherwise be root-only access
# the "sensors" it creates will be under /tmp/amdgpu-sensors
# you can use the python script amdgpu-sensors-monitor.py for a reference on how to use it, but remember that this daemon must be running as root first

import os
import time

if __name__ == "__main__":
    # stop if not running as root
    if os.geteuid() != 0:
        exit("Error: need root privileges")
        
    time.sleep(10)
        
    # write to /tmp as it's ram, preventing unnecessary disk writes
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
    
    # creates the root folder
    try: os.mkdir(root)
    except(FileExistsError): pass
    
    try:
        while (True):
            # reads files
            amdgpu_pm_info = open("/sys/kernel/debug/dri/0/amdgpu_pm_info", "r").readlines()
            amdgpu_vram_mm = open("/sys/kernel/debug/dri/0/amdgpu_vram_mm", "r").readlines()
            
            # gets the actual numbers
            mem_frequency = amdgpu_pm_info[27].replace("\t", "").replace(" MHz (MCLK)\n", "")
            gpu_frequency = amdgpu_pm_info[28].replace("\t", "").replace(" MHz (SCLK)\n", "")
            gpu_voltage = amdgpu_pm_info[31].replace("\t", "").replace(" mV (VDDGFX)\n", "")
            gpu_power = amdgpu_pm_info[32].replace("\t", "").split(" W (average GPU)")[0].split(".")[0]
            gpu_temperature = amdgpu_pm_info[34].replace("GPU Temperature: ", "").replace(" C\n", "")
            gpu_usage = amdgpu_pm_info[35].replace("GPU Load: ", "").replace(" %\n", "")
            mem_usage = amdgpu_vram_mm[-1].split("ram usage:")[1].split("MB, vis usage:")[0]
            
            # writes those numbers to the files that will act as sensors
            open(os.path.join(root, "mem_frequency"), "w").write(mem_frequency)
            open(os.path.join(root, "gpu_frequency"), "w").write(gpu_frequency)
            open(os.path.join(root, "gpu_voltage"), "w").write(gpu_voltage)
            open(os.path.join(root, "gpu_power"), "w").write(gpu_power)
            open(os.path.join(root, "gpu_temperature"), "w").write(gpu_temperature)
            open(os.path.join(root, "gpu_usage"), "w").write(gpu_usage)
            open(os.path.join(root, "mem_usage"), "w").write(mem_usage)
            
            # sleep
            time.sleep(sleep_secs)
    
    # smooth exiting with CTRL+C
    except(KeyboardInterrupt):
        exit("")
    # all other cases
    except:
        exit()

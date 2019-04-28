#!/usr/bin/perl -w

$|=1;

print "ksysguardd 1.2.0\n";
print "ksysguardd> ";

while(<>) {
    # sensors available to add to charts [sensor_name\tdata_type]
    if(/monitors/) {
        print "gpu_usage\tinteger\n";
        print "gpu_frequency\tinteger\n";
        print "gpu_temperature\tinteger\n";
        print "gpu_voltage\tinteger\n";
        print "gpu_power\tinteger\n";
        print "mem_usage\tinteger\n";
        print "mem_frequency\tinteger\n";
    }
    
    # gpu usage sensor
    if(/gpu_usage/) {
        # chart legend
        if(/\?/) {
            print "GPU Usage\t\t\t%\n";
        }
        # sensor command
        else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_usage`, "\n";
        }
    }
    
    # gpu frequency sensor
    if(/gpu_frequency/) {
        # chart legend
        if(/\?/) {
            print "GPU Frequency\t\t\tMHz\n";
        }
        # sensor command
        else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_frequency`, "\n";
        }
    }
    
    # gpu temperature sensor
    if(/gpu_temperature/) {
        # chart legend
        if(/\?/) {
            print "GPU Temperature\t\t\tC\n";
        }
        # sensor command
        else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_temperature`, "\n";
        }
    }
    
    # gpu voltage sensor
    if(/gpu_voltage/) {
        # chart legend
        if(/\?/) {
            print "GPU Voltage\t\t\tmV\n";
        }
        # sensor command
        else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_voltage`, "\n";
        }
    }
    
    # gpu power sensor
    if(/gpu_power/) {
        # chart legend
        if(/\?/) {
            print "GPU Power\t\t\tW\n";
        }
        # sensor command
        else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_power`, "\n";
        }
    }
    
    # mem usage sensor
    if(/mem_usage/) {
        # chart legend
        if(/\?/) {
            print "MEM Usage\t\t\tMiB\n";
        }
        # sensor command
        else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/mem_usage`, "\n";
        }
    }
    
    # mem frequency sensor
    if(/mem_frequency/) {
        # chart legend
        if(/\?/) {
            print "MEM Frequency\t\t\tMHz\n";
        }
        # sensor command
        else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/mem_frequency`, "\n";
        }
    }
    
    print "ksysguardd> ";
}

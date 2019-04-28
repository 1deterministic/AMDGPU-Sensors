#!/usr/bin/perl -w

$|=1;

print "ksysguardd 1.2.0\n";
print "ksysguardd> ";

while(<>) {
    if(/monitors/) {
        print "gpu_usage\tinteger\n";
        print "gpu_frequency\tinteger\n";
        print "gpu_temperature\tinteger\n";
        print "gpu_voltage\tinteger\n";
        print "gpu_power\tinteger\n";
        print "mem_usage\tinteger\n";
        print "mem_frequency\tinteger\n";
    }
    
    if(/gpu_usage/) {
        if(/\?/) {
            print "GPU Usage\t\t\t%\n";
        } else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_usage`, "\n";
        }
    }
    
    if(/gpu_frequency/) {
        if(/\?/) {
            print "GPU Frequency\t\t\tMHz\n";
        } else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_frequency`, "\n";
        }
    }
    
    if(/gpu_temperature/) {
        if(/\?/) {
            print "GPU Temperature\t\t\tC\n";
        } else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_temperature`, "\n";
        }
    }
    
    if(/gpu_voltage/) {
        if(/\?/) {
            print "GPU Voltage\t\t\tmV\n";
        } else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_voltage`, "\n";
        }
    }
    
    if(/gpu_power/) {
        if(/\?/) {
            print "GPU Power\t\t\tW\n";
        } else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/gpu_power`, "\n";
        }
    }
    
    if(/mem_usage/) {
        if(/\?/) {
            print "MEM Usage\t\t\tMiB\n";
        } else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/mem_usage`, "\n";
        }
    }
    
    if(/mem_frequency/) {
        if(/\?/) {
            print "MEM Frequency\t\t\tMHz\n";
        } else {
            print `/usr/bin/cat /tmp/amdgpu-sensors/mem_frequency`, "\n";
        }
    }
    
    print "ksysguardd> ";
}

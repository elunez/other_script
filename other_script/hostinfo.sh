#!/bin/bash

# 获取CPU信息
cpu_count=$(grep -c '^processor' /proc/cpuinfo)
cpu_model=$(grep 'model name' /proc/cpuinfo | awk -F ': ' '{print $2}' | head -1)
cpu_frequency=$(grep 'cpu MHz' /proc/cpuinfo | awk -F ': ' '{print $2}' | head -1)

# 获取内存信息（以MB为单位）
mem_total=$(free -m | awk '/^Mem:/ {print $2}')
mem_used=$(free -m | awk '/^Mem:/ {print $3}')
mem_free=$(free -m | awk '/^Mem:/ {print $4}')

# 获取硬盘信息
disk_total=$(df -h --output=size / | awk 'NR==2'  | sed 's/G//')
disk_used=$(df -h --output=used / | awk 'NR==2'  | sed 's/G//')
disk_free=$(df -h --output=avail / | awk 'NR==2'  | sed 's/G//')

# 输出结果
echo "--------系统信息---------"
echo -e "CPU数量:$cpu_count | CPU频率:$cpu_frequency MHz"
echo -e "CPU型号:$cpu_model"
echo "------------------------"
echo -e "内存大小:$mem_total MB | 已使用:$mem_used MB | 未使用:$mem_free MB"
echo "------------------------"
echo -e "磁盘大小:$disk_total G | 已使用:$disk_used G | 未使用:$disk_free G"
echo "------------------------"
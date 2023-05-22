#!/bin/bash

while true; do
  # 获取CPU信息
  cpu_count=$(grep -c '^processor' /proc/cpuinfo)
  cpu_model=$(grep 'model name' /proc/cpuinfo | awk -F ': ' '{print $2}' | head -1)
  cpu_frequency=$(grep 'cpu MHz' /proc/cpuinfo | awk -F ': ' '{print $2}' | head -1)

  # 获取CPU负载
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
  cpu_idle=$(awk -v usage="$cpu_usage" 'BEGIN {print 100 - usage}')
  load_average=$(cat /proc/loadavg | awk '{print $1, $2, $3}')

  # 获取硬盘信息
  disk_total=$(df -h --output=size / | awk 'NR==2' | sed 's/G//' | tr -d '[:space:]')
  disk_used=$(df -h --output=used / | awk 'NR==2' | sed 's/G//' | tr -d '[:space:]')
  disk_free=$(df -h --output=avail / | awk 'NR==2' | sed 's/G//' | tr -d '[:space:]')
  
  # 清空屏幕
  clear

  # 输出结果
  echo "--------------------------CPU信息----------------------------"
  echo -e "CPU核心: $cpu_count 核心 |  CPU型号: $cpu_model $cpu_frequency MHz"
  echo "--------------------------CPU负载----------------------------"
  echo -e "CPU使用率: $cpu_usage % | CPU空闲率: $cpu_idle % | 负载参数: $load_average"
  echo "---------------------------磁盘信息--------------------------"
  echo -e "磁盘大小: $disk_total G | 已使用: $disk_used G | 未使用: $disk_free G"
  echo "-------------------------------------------------------------"
  
  # 暂停800毫秒
  sleep 0.8
done
#!/bin/bash

convert_ip_to_integers() {
  local ip=$1
  IFS='.' read -r a b c d <<< "$ip"
  
  # 计算大端序 (big-endian)
  be_ip_int=$((a << 24 | b << 16 | c << 8 | d))
  
  # 计算小端序 (little-endian)，需要颠倒字节顺序
  le_ip_int=$((d << 24 | c << 16 | b << 8 | a))
  
  echo "$be_ip_int $le_ip_int"
}

# IP地址参数
IP="$1"

# 调用函数，获取大端和小端的整数表示
read big_endian little_endian <<< $(convert_ip_to_integers "$IP")

# 假设BPFtrace脚本期望两个参数，分别对应大端和小端

echo "Start listening for the request to $IP"
echo ""
sudo ./request_monitor.bt $big_endian $little_endian

#!/bin/bash
# 检测HDMI是否连接
if xrandr | grep -q "HDMI-1-0 connected"; then
    # 启用独显输出到HDMI，并设为主显示器
    xrandr --setprovideroutputsource modesetting NVIDIA-0
    xrandr --output HDMI-1-0 --mode 2560x1440 --rate 120 --primary --pos 0x0
    xrandr --output eDP --mode 2560x1600 --rate 120 --right-of HDMI-1-0
    echo "使用NVIDIA独显输出HDMI显示器"
else
    # 仅使用核显输出内屏
    xrandr --output eDP --mode 2560x1600 --rate 60 --primary
    echo "使用AMD核显输出笔记本屏幕"
fi
# 等待 X Server 稳定
sleep 1

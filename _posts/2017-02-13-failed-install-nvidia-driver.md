---
layout: post
title: 'NVIDIA 驱动安装失败'
date: '2017-02-13'
header-img: "img/post-bg-nvidia-1.jpg"
tags:
     - debian
     - nvidia
     - drivers
author: 'zhui'
---

## System
System information

	PC	IdeaPad Y400 Lenovo
	系统	Debian 8.7
	显卡	GeForce GT 650M
	驱动    NVIDIA-Linux-x86_64-375.26.run
	Linux	3.16.0-4-amd64

## 遇到的坑
关闭图形界面

	* service gdm stop 

关闭nouveau驱动

	* vim /etc/modprobe.d/blacklist.conf 
	* * Add blacklist nouveau
	* update-initramfs -u
	* update-greb
	* reboot

安装所需要依赖

	* apt-get install gcc make linux-source linux-headers
	* bash ./NVIDIA-Linux-x86_64-375.26.run
	* nvidia-config

## 问题
系界面进入失败。命令行界面出现2s后自动跳转黑屏。
解决方案: ssh 进入系统发现系统Xorg工作异常，stop gdm后系统命令行界面可用。

## 卸载Nvidia驱动
	* bash ./NVIDIA-Linux-x86_64-375.26.run --uninstall

## 尝试安装官方源驱动
	* apt-get install nvidia-detect
	* apt-get install nvidia-driver

## 结果
开机自动重启
## 修复
进入单用户模式,卸载nvidia-driver：

	* grub e ,add init=/bin/bash, mount / rw remount
	* apt-get autoremove nvidia-driver
## 恢复原来的驱动nouveau
之前驱动被禁用,删除blacklist，update initramfs and grub

## 图形界面还是启动不了
X -configure : Error, no module NVIDIA found. NVIDIA uninstall not clean, need to uninstall packages of nvidia

	* apt-get autoremove nvidia-kernel-common nvidia-modprobe
	* reboot

Finally, I get back to the origal graph-drivers nouveau. so sad ...
> 如有任何知识产权、版权问题或理论错误，还请指正。
>
> 转载请注明原作者及以上信息。

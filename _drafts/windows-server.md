---
layout: post
title: 'windows server使用经验'
date: '2017-09-08'
header-img: "img/post-bg-unix.jpg"
tags:
     - server
     - windows
author: 'zhui'
---

## 常用用户管理

* win + x 选择 G 选项进入计算机管理
* 系统工具->本地用户和组->用户—>添加或修改用户
* 新建用户时，建议选择 密码永不过期
* 点击新建的用户，添加用户组‘Remote Desktop Users’
* 配置文件栏可以填写登录脚本，脚本需要在后文的介绍中设置

## cn_windows_server_2012_r2 安装密钥

	ServerStandard = 
		NB4WH-BBBYV-3MPPC-9RCMV-46XCB
	ServerStandardCore = 
		NB4WH-BBBYV-3MPPC-9RCMV-46XCB
	ServerDatacenter = 
		BH9T4-4N7CW-67J3M-64J36-WW98Y


## Windows server 上远程登录使用 Matlab

### problem

> Matlab装好之后打不开，一直报错，(Matlab2016/2017)
> License Manager Error - 103
> MATLAB cannot be started through terminal services

Solution:安装正版Matlab

## Windows Server 2012/2016 ping延迟很高(3~5s)

Solution：原来Windows server 2012默认打开了ECN功能（貌似从Windows server 2008之后都默认打开），执行“netsh int tcp set global ecn=disable”命令即可解决，。


### Windows Server2012 FTP 无法连接

Solution：除了将ftp相关服务加入防火墙外，还需要把 svhost.exe 加入防火墙

## Windows Server 2012显示我的电脑

如果是在Windows Server 2012本地控制台下，直接按Win（键盘上的微软徽标键）+R，输入：
```
	rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,0
```
回车后，勾选所需要的桌面图标的名称，确定即可。


## Windows Sever 脚本设置

nfs启动脚本
在gpedit.msc中->计算机配置->windows设置->脚本，设置登录脚本
在计算机管理中，设置用户使用的登录脚本



---
layout: post
title: '配置Linux Service例子'
date: '2017-01-18'
header-img: "img/post-bg-unix.jpg"
tags:
     - service
     - java
author: 'zhui'
---

##Linux Service配置
今天参照下面的脚本二写了一个脚本，作为Service运行。查找了网上的一些资料，Linux的service命令其实就是去执行`/etc/init.d/`目录下的命令程序。网上有一些脚本设置提到过chkconfig命令，实测Debian8和Ubuntu14.04上并不需要使用。

	service yourServiceName start/stop/restart

将你的脚本移动到`/etc/init.d/yourServiceName.sh`，即可通过上面方式把你的脚本程序运行起来。

PS:写脚本的过程中遇到一个Bug，将PATH关键字作为了一个普通变量名使用，导致各种command not found。实在是太傻了。

##下面是參考的网上关于Java后台脚本运行的例子：
脚本一：

startTest.sh内容如下：

	#!/bin/sh
	java -jar Test.jar &     #注意：必须有&让其后台执行，否则没有pid生成
	echo $! > /var/run/Test.pid   # 将jar包启动对应的pid写入文件中，为停止时提供pid

stopTest.sh内容如下：

	#!/bin/sh
	PID=$(cat /var/run/Test.pid)
	kill -9 $PID

 

脚本二：

  
	#! /bin/sh
	
	#启动方法
	start(){
	       java -Xms128m -Xmx2048m -jar test1.jar 5 > log.log &
        	java -Xms128m -Xmx2048m -jar test2.jar 5 > log.log &
	        tail -f result.log
	}
	#停止方法
	stop(){
        	ps -ef|grep test|awk '{print $2}'|while read pid
	        do
 	          kill -9 $pid
        	done
	}

	case "$1" in
	start)
	  start
	  ;;
	stop)
	  stop
	  ;;
	restart)
	  stop	
	  start
	  ;;
	*)
	  printf 'Usage: %s {start|stop|restart}\n' "$prog"
	  exit 1
	  ;;
	esac

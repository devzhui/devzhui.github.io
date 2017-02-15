---
layout: post
title: 'OpenJDK8 install ca-certificates-java Error'
date: '2017-02-14'
header-img: "img/post-bg-java.jpg"
tags:
     - java
     - jdk8
     - debian
     - ca-certificates-java
author: 'zhui'
---

Error:

	apt-get install openjdk-8-jre-headless
	Reading package lists... Done
	Building dependency tree
	Reading state information... Done
	Some packages could not be installed. This may mean that you have
	requested an impossible situation or if you are using the unstable
	distribution that some required packages have not yet been created
	or been moved out of Incoming.
	The following information may help to resolve the situation:

	The following packages have unmet dependencies:
	 openjdk-8-jre-headless : Depends: ca-certificates-java but it is not going to be installed
	 E: Unable to correct problems, you have held broken packages

/etc/apt/source.list

	deb http://mirrors.ustc.edu.cn/debian/ jessie main contrib non-free
	deb-src http://mirrors.ustc.edu.cn/debian/ jessie main contrib non-free
	 
	deb http://mirrors.ustc.edu.cn/debian/ jessie-updates main contrib non-free
	deb-src http://mirrors.ustc.edu.cn/debian/ jessie-updates main contrib non-free
	
	deb http://mirrors.ustc.edu.cn/debian jessie-proposed-updates main contrib non-free
	deb-src http://mirrors.ustc.edu.cn/debian jessie-proposed-updates main contrib non-free

	deb http://mirrors.ustc.edu.cn/debian/ jessie-backports main contrib non-free
	deb-src http://mirrors.ustc.edu.cn/debian/ jessie-backports main contrib non-free


slution

	apt install -t jessie-backports  openjdk-8-jre-headless ca-certificates-java
	apt-get install openjdk-8-jdk

[reference: http://unix.stackexchange.com/questions/342403/openjdk-8-jre-headless-depends-ca-certificates-java-but-it-is-not-going-to-be](http://unix.stackexchange.com/questions/342403/openjdk-8-jre-headless-depends-ca-certificates-java-but-it-is-not-going-to-be)

> 如有任何知识产权、版权问题或理论错误，还请指正。
>
> 转载请注明原作者及以上信息。

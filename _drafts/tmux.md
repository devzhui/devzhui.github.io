---
layout: post
title: 'tmux 简明快速教程'
date: '2017-09-08'
header-img: "img/post-bg-unix.jpg"
tags:
     - terminal
     - tmux
author: 'zhui'
---

## tmux介绍

tmux是一个优秀的终端复用软件，即使非正常掉线，也能保证当前的任务运行，这一点对于远程SSH访问特别有用，网络不好的情况下仍然能保证工作现场不丢失! tmux完全使用键盘控制窗口，实现窗口的切换功能。

在终端下，之前用的是screen，发觉挺好用的，现在别人推荐了tmux，说更好用一些。有更方便的工具，能够让工作生活更顺手，那还是要尝试尝试的。

根据别人的经验总结，tmux相比于screen，有以下好外：

* 垂直分割窗口，当然水平也是可以的
* vi 或 emacs 按键绑定模式
* 有多个粘贴缓冲，可完全由按键进行选取、复制、以及粘贴操作
* 配置很容易，尤其是状态行
* 脚本化，通过脚本可以方便的控制 tmux 会话
* 有预设布局，可搜索窗口，自动命名窗口名称
* 文档清晰、详尽
* 会话，窗口，面板

根据tmux的定义，在开启了tmux服务器后，会首先创建一个会话，而这个会话则会首先创建一个窗口，其中仅包含一个面板；也就是说，这里看到的所谓终端控制台应该称作tmux的一个面板，虽然其使用方法与终端控制台完全相同。

tmux使用C/S模型构建，主要包括以下单元模块：

* server服务器：输入tmux命令时就开启了一个服务器。
* session会话：一个服务器可以包含多个会话。
* window窗口：一个会话可以包含多个窗口。
* pane面板：一个窗口可以包含多个面板。
* 简明tmux的配置文件
* 将以下内容放在 ~/.tmux.conf
* 文件里面，没有该文件就直接新创建一个。

请注意：以下的配置文件，已将tmux的前缀组合按键由 C-b 换成了 C-a 了。

	# act like GNU screen
	unbind C-b
	set -g prefix C-a
	# improve colors
	#set -g default-terminal 'screen-256color'
	set -g default-terminal 'linux'
	# act like vim
	setw -g mode-keys vi
	#bind h select-pane -L
	#bind j select-pane -D
	#bind k select-pane -U
	#bind l select-pane -R
	#bind-key -r C-h select-window -t :-
	#bind-key -r C-l select-window -t :+
	# 重新调整窗格的大小
	bind K resizep -U 5
	bind J resizep -D 5
	bind-key L switch-client -l
	#bind-key -n L switch-client -l
	# 状态栏中的窗口列表居中
	set -g status-justify centre
	# 状态栏启用utf-8
	set -g status-utf8 on
	#设置窗口列表颜色
	#setw -g window-status-fg cyan
	#setw -g window-status-bg default
	#setw -g window-status-attr dim
	#设置当前窗口在status bar中的颜色
	setw -g window-status-current-fg white
	setw -g window-status-current-bg red
	setw -g window-status-current-attr bright
	#开启window事件提示
	setw -g monitor-activity on
	#set -g visual-activity on
	## 鼠标设置，不要打开，不然用鼠标选择不了内容
	setw -g mode-mouse off
	set -g mouse-select-pane off
	set -g mouse-resize-pane off
	set -g mouse-select-window off
	# start window numbers at 1 to match keyboard order with tmux window order
	set -g base-index 1
	set-window-option -g pane-base-index 1
	# soften status bar color from harsh green to light gray
	set -g status-bg '#666666'
	set -g status-fg '#aaaaaa'
	# remove administrative debris (session name, hostname, time) in status bar
	set -g status-left ''
	set -g status-right ''
	# increase scrollback lines
	set -g history-limit 10000
	# switch to last pane
	bind-key C-a last-pane


## 常用按键

这里需要说明一点的是，tmux的任何指令，都包含一个前缀，也就是说，你按了前缀(一组按键，默认是Ctrl+b)以后，系统才知道你接下来的指令是发送给tmux的。

	显示帮助
	{前缀} ?           显示快捷键帮助
	会话相关
	{前缀} d           休眠
	{前缀} s           以菜单方式显示和选择会话
	{前缀} L           切换回上一次的会话
	窗口相关
	{前缀} c           创建新窗口
	{前缀} n           选择下一个窗口
	{前缀} p           选择前一个窗口
	{前缀} l           最近一次活跃窗口之间进行切换
	{前缀} 0~9         选择几号窗口
	{前缀} ,           重命名窗口
	{前缀} .           更改窗口的编号，但只能更改成未使用的编号，所以要交换窗口的话，得更改多次进行交换
	{前缀} &           关闭窗口
	{前缀} w           以菜单方式显示及选择窗口
	{前缀} f           在所有窗口中查找内容
	面板相关
	{前缀} "           模向分隔面板
	{前缀} %           纵向分隔面板
	{前缀} o           跳到下一个分隔面板
	{前缀} x           关闭面板
	{前缀} ;           切换到最后一个使用的面板
	{前缀} 上下键      上一个及下一个分隔面板
	{前缀} 空格键      切换面板布局
	显示时间
	{前缀} t           显示时钟

## 常用命令

### 会话列表

	## 在正常终端模式下，列出当前有哪些tmux会话
	tmux ls

### 新建

	## 直接新建一会话，并进入
	tmux
	## 记编号总是不那么容易的，所以一般会在新建会话时，给会话命名，方便记忆，以后也好操作
	## 新建一命名为 abc 的会话
	tmux new -s abc

### 恢复

	## 连接回以前的某个编号的 tmux 会话，编号用的是 tmux ls 命令时所列出的每一行的最前面的那个编号
	tmux attach -t 编号
	## 也可简写成
	tmux a -t 编号
	## 连接上 abc 会话
	tmux attach -t abc
	## 或者
	tmux a -t abc

### 休眠

	## 在正常终端模式下，使某个编号的会话强制休眠，编号用的是 tmux ls 命令时所列出的每一行的最前面的那个编号
	tmux detach -t 编号
	tmux detach -s 名称
	## 休眠 abc 会话
	tmux detach -s abc

### 重命名会话名称

	## 重命名 abc 会话名称为 cba
	tmux rename -t abc cba
	杀掉会话
	##  杀死整个 cba 会话
	tmux kill-session -t cba

## 参考文章
[Tmux多窗口分隔线显示虚线不正常解决](http://www.haiyun.me/archives/tmux-dotted-line.html)


`转载于：http://blog.kissdata.com/2014/07/29/tmux.html`

> 如有任何知识产权、版权问题或理论错误，还请指正。
>
> 转载请注明原作者及以上信息。


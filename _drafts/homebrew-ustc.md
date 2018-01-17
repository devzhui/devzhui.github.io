---
layout: post
title: 'Apache下配置认证用户'
date: '2018-01-07'
header-img: "img/post-bg-unix.jpg"
tags:
     - homebrew
author: 'zhui'
---

## [替换及重置Homebrew默认源](https://lug.ustc.edu.cn/wiki/mirrors/help/brew.git#替换及重置homebrew默认源)
	替换brew.git:
	cd "$(brew --repo)"
	git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
	
	替换homebrew-core.git:
	cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
	git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

替换Homebrew Bottles源: 参考:[替换Homebrew Bottles源](https://lug.ustc.edu.cn/wiki/mirrors/help/homebrew-bottles)

在中科大源失效或宕机时可以： 1. 使用[清华源设置参考](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)。 2. 切换回官方源：

	重置brew.git:
	cd "$(brew --repo)"
	git remote set-url origin https://github.com/Homebrew/brew.git
	
	重置homebrew-core.git:
	cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
	git remote set-url origin https://github.com/Homebrew/homebrew-core.git

注释掉bash配置文件里的有关Homebrew Bottles即可恢复官方源。 重启bash或让bash重读配置文件。

转载自ustclug[wiki](https://lug.ustc.edu.cn/wiki/mirrors/help/brew.git)
> 如有任何知识产权、版权问题或理论错误，还请指正。
>
> 转载请注明原作者及以上信息。


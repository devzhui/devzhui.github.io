---
layout: post
title: 'python中的链表推导式'
date: '2017-11-15'
header-img: "img/post-bg-opt.jpg"
tags:
     - Python
author: 'zhui'
---

#python中的链表推导式


Python代码
```python
	num=[1,2,3]
	myvec=[[x,x*2] for x in num] #嵌套一个链表，格式为一个数和他的平方
	print myvec 
```

生成链表很简单的一种办法就是链表推导式，不仅容易看懂，还很好用：

​     链表表达式在for语句前面，for后面就是对参数的限定。[XXX for yyy](必须要有方括号表示是链表），XXX表示链表，yyy限定XXX中参数。

例子：
```python
num=[1,2,3,4,5]  
myvec=[x*2 for x in num]   
print myvec  
```
------

输出:
```
[2,4,6,8,10]
```

当然，不可能只有一个for这么简单，for后面还可以接别的控制语句

代码：

Python代码 
```python
num1=[1,2,3]
num2=[2,3,4]  
myvec=［x*y for x in num1 for y in num2]＃嵌套for循环的感觉  
print myvec  
```
------

输出：
```python
［2，3，4，4，6，8，6，9，12］
```
另外，链表的表达式部分也可以有很复杂的变化，可以为嵌套链表，也可以是很复杂的函数构成

 代码：

------

输出：
```
［［1，2］，［2，4］，［3，6］］
```

[转自](http://fortianwei.iteye.com/blog/356367)
---
layout: post
title: '定时触发工具'
date: '2016-12-01'
header-img: "img/home-bg.jpg"
tags:
     - java
author: 'zhui'
---


## 起由
前段时间，需要做一个功能和其他人的部分对接传递数据。由于存在版本不兼容问题，没有去合并项目。决定通过定时的方式访问数据库。获取一些更新的数据，进行处理。

## Config
This is the big bit! Quartz is a very configurable application. The best way to configure Quartz is to edit a quartz.properties file, and place it in your application’s classpath (see Installation section above).

There are several example properties files that ship within the Quartz distribution, particularly under the examples/ directory. I would suggest you create your own quartz.properties file, rather than making a copy of one of the examples and deleting the bits you don’t need. It’s neater that way, and you’ll explore more of what Quartz has to offer.

Full documentation of available properties is available in the Quartz Configuration Reference.

To get up and running quickly, a basic quartz.properties looks something like this:

	org.quartz.scheduler.instanceName = MyScheduler
	org.quartz.threadPool.threadCount = 3
	org.quartz.jobStore.class = org.quartz.simpl.RAMJobStore

The scheduler created by this configuration has the following characteristics:
* org.quartz.scheduler.instanceName - This scheduler’s name will be “MyScheduler”.
* org.quartz.threadPool.threadCount - There are 3 threads in the thread pool, which means that a maximum of 3 jobs can be run simultaneously.
* org.quartz.jobStore.class - All of Quartz’s data, such as details of jobs and triggers, is held in memory (rather than in a database). Even if you have a database and want to use it with Quartz, I suggest you get Quartz working with the RamJobStore before you open up a whole new dimension by working with a database.

## Quartz
Now you’ve downloaded and installed Quartz, it’s time to get a sample application up and running. The following code obtains an instance of the scheduler, starts it, then shuts it down:
Quartz.java

	import org.quartz.Scheduler;
	import org.quartz.SchedulerException;
	import org.quartz.impl.StdSchedulerFactory;
	import static org.quartz.JobBuilder.*;
	import static org.quartz.TriggerBuilder.*;
	import static org.quartz.SimpleScheduleBuilder.*;

	public class QuartzTest {
		public static void main(String[] args) {
			try {
				// Grab the Scheduler instance from the Factory
				Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();

				// and start it off
				scheduler.start();

				scheduler.shutdown();

				} catch (SchedulerException se) {
					se.printStackTrace();
				}
		}
	}


> 如有任何知识产权、版权问题或理论错误，还请指正。
>
> 转载请注明原作者及以上信息。

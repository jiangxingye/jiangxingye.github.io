---
title: "关闭服务器CPU节能模式"
date: 2019-08-16T09:58:37+08:00
lastmod: 2019-09-11T10:18:05+08:00
slug: "关闭服务器CPU节能模式"
categories: [it, server]
tags: [关闭服务器CPU节能模式]
description: "关闭服务器CPU节能模式"
---

OS系统总关闭P-state模式 CentOS7.x OS中使用了 IntelP-state ，导致机器BIOS关闭节电设置后，处理器的频率依旧处于频繁跳动状态。通过grub禁用Intel P-state解决OS控制处理器频率问题。操作如下： 使用root账号进入系统打开终端，两种方式， 第一种：右键 –> Open in Terminal 第二种，左上角Applications –> Utilities -> Terminal （蓝色字体部分为需要执行的命令） 在命令行执行lscpu |grep “Hz”，查看CPU是否处于额定主频（红色框中数值是否相等或非常相近，2.10GHz=2100MHz，图中明显不相等），然后执行下列命令： 将更改脚本放到/tmp/目录下。在终端执行sh change_grub.sh 如果成功，会自动重启，如果失败，会报错”更改失敗，需要手動進行更改”，请联系运维人员 主板BIOS中设置关闭节能模式 BIOS关闭节能，方法如下： 在上一步执行reboot之后会进行重启操作，过程中进入bios系统后 (按Delete键进入) CPU configuration Advanced Power Managerment Configuretion 在Power Technology 中选择Custom && 返回 3．CPU P state Cotrol -> Disable && 返回 4.CPU Cstat Cotrol -> Package C State Limit：C0/C1 state && 返回 5.关闭QPI 总线的节能: advanced –> Chipset Configuration -> North Bridge ->QPI Configuration -> QPI General Configuretion —> LINK L0p /L1enable更改为disable 。 F4 保存退出执行重启 7、重启完成以后输入账户密码进入系统，打开终端，在命令行执行 lscpu |grep“Hz”查看CPU是否处于额定主频（下图中共色框中两个数值是否相等或非常相近，2.10GHz=2100MHz），如是说明修改成功。 change_grub.sh 脚本如下 #!/bin/sh cmd="intel_pstate=disable intel_idle.max_cstate=0 processor.max_cstate=1 idle=poll quiet" check=$(cat /etc/default/grub |grep "intel_pstate=disable intel_idle.max_cstate=0 processor.max_cstate=1 idle=poll" | wc -l ) if [ $check -eq 0 ] then sed -i "/GRUB_CMDLINE_LINUX/ s/quiet/$cmd/g" /etc/default/grub else printf "the file has been edited at a earlier time" exit 0 fi if [ $? -ne 0 ] then printf "faild,please change it by edit the file" exit 1 fi grub2-mkconfig -o /boot/grub2/grub.cfg && reboot

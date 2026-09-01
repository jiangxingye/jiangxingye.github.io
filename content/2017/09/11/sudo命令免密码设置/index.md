---
title: "sudo命令免密码设置"
date: 2017-09-11T01:30:55+08:00
lastmod: 2019-09-02T13:02:59+08:00
slug: "sudo命令免密码设置"
categories: [运维]
tags: [linux]
description: "sudo命令免密码设置"
---

如果某台linux只有自己在使用，比如个人系统，每次调用 sudo 时都需要输入密码，长期下来着实厌烦，因此本文介绍如何配置 sudo 命令，使其在运行时不需要输入密码。 步骤 执行命令 $ sudo visudo 添加以下两行， 下面的 sys 表示 sys 组成员不用密码使用sudo aaronkilik ALL=(ALL) NOPASSWD: ALL %sys ALL=(ALL) NOPASSWD: ALL 现在在使用 sudo 命令， 将不再需要输入密码。 扩展如果只允许用户使用 kill 和 rm 命令时，不需要输入密码，见如下配置 %sys ALL=(ALL) NOPASSWD: /bin/kill, /bin/rm

---
title: "raid丢失系统恢复案例"
date: 2019-08-12T04:31:04+08:00
lastmod: 2019-09-03T01:18:21+08:00
slug: "raid丢失系统恢复案例"
categories: [it, server]
tags: [bootable device were deteced.]
description: "raid丢失系统恢复案例"
---
How to fix “No Bootable Device” issue on server?故障现象：

原因分析：客户机器有独立的RAID卡，2块物理磁盘做的RAID0，和客户沟通，RAID卡进去状态不正常，不想重新安装系统。因为上面的环境配置很麻烦。

处理过程：

重新在RAID卡里做同级别RAID的话，不在raid里做clear操作的话，数据不丢失的话，理论上系统是有办法恢复的，如果数据会消失，那就要重做了。经验证，做同级别RAID系统恢复，数据并未消失。

问题解决：

建议：

如果系统上有重要数据的话，还是建议使用RAID1会安全一些。

如果你忙觉得上述案例帮助了您，给个赞哦，当然也可以打赏杯可乐，我就不用喝酱油兑水了,^_^ 么么哒！

服务器购买也可以通过下面的联系方式向我咨询。

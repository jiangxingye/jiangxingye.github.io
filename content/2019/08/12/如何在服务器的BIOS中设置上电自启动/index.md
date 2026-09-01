---
title: "如何在服务器的BIOS中设置上电自启动"
date: 2019-08-12T06:36:33+08:00
lastmod: 2019-09-03T01:18:47+08:00
slug: "如何在服务器的BIOS中设置上电自启动"
categories: [it, server]
tags: [如何在服务器的BIOS中设置上电自启动]
description: "如何在服务器的BIOS中设置上电自启动"
---

说明： 1、为什么要实现这种功能，很多时候在民间都基本用普通PC来做小型服务器，公司的私服等等，而这些普通PC在民用电环境中经常会停电，一停就会导致服务器不能自动来电重启，所以这个功能来点开机是必须的。 2、普通PC基本都是以下这些配置方式，但不要和服务器主板做比较，服务器主板有专业的配置选项以及专业的来电自动启动设备。 下面根据不同的BIOS列出相应的设置方法： 1：首先进入BIOS的设置主界面，选择[POWER MANAGEMENT SETUP]，再选择[PWR Lost Resume State]，这一项有三个选择项。 选择[Keep OFF]项，代表停电后再来电时，电脑不会自动启动。 选择[Turn On]项，代表停电后再来电时，电脑会自动启动。 选择的[Last State]，那么代表停电后再来电时，电脑恢复到停电前电脑的状态。断电前如果电脑是处于开机状态，那么来电后就会自动开机。断电前是处于关机状态，那么来电后电脑不会自动开机。 2：首先进入Power Management Setup（电源管理设定）→Power Again（再来电状态），此项决定了开机时意外断电之后，电力供应恢复时系统电源的状态。设定值有：Power Off（保持系统处于关机状态）Power On（保持系统处于开机状态）Last State（恢复到系统断电前的状态）进入挂起/睡眠模式，但若按钮被揿下超过4秒，机器关机。若想来电自动开机把上面的这项改成power on就行了！ 3：有的BIOS中[POWER MANAGEMENT SETUP]没有上面说的[PWR Lost Resume State]，可以在[PWRON After PWR-Fail]→[Integrated Peripherals]选项中找到两个选项：ON(打开自动开机)和OFF(关闭自动开机)，设置为OFF即可。不同的主板及BIOS型号相对应的选项会有所不同，但我想应该会差不多，一般都在[POWER MANAGEMENT SETUP]这个选项中可以找到相应的设置选项！

---
title: "what is the NVMe"
date: 2019-09-06T01:59:19+08:00
lastmod: 2019-09-06T02:12:40+08:00
slug: "what is the NVMe"
categories: [it, server]
tags: [NVMe]
description: "what is the NVMe"
---

NVMe is what?先来看一下Wikipredia的解释。wikipedia是这样婶儿说滴。 NVM Express（NVMe），或称非易失性内存主机控制器接口规范（英语：Non-Volatile Memory Host Controller Interface Specification，缩写：NVMHCIS），是一个逻辑设备接口规范。它是与AHCI类似的、基于设备逻辑接口的总线传输协议规范（相当于通讯协议中的应用层），用于访问通过PCI Express（PCIe）总线附加的非易失性存储器介质（例如采用闪存的固态硬盘驱动器），虽然理论上不一定要求PCIe总线协议。 NVM代表非易失性存储器（non-volatile memory）的首字母缩略字，这是固态硬盘（SSD）的常见的闪存形式。此规范主要是为基于闪存的存储设备提供一个低延时、内部并发化的原生界面规范，也为现代CPU、计算机平台及相关应用提供原生存储并发化的支持[1]，令主机硬件和软件可以充分利用固态存储设备的并行化存储能力。相比此前机械硬盘驱动器（HDD）时代的AHCI，NVMe/NVMHCI降低了I/O操作等待时间、提升同一时间内的操作数、更大容量的操作队列等。 依托于PCIe总线，NVMe设备可适用于各种支持PCIe总线的物理插槽上，包括标准尺寸的PCIe扩展卡（一般是4个PCIe通道）[2]、采用U.2物理连接界面（SFF-8639）的2.5英寸/3.5英寸标准尺寸固态硬盘驱动器、[3][4]SATA Express总线（兼容于PCIe）的设备、M.2规格扩展卡等。[5] 此规范由“Non-Volatile Memory Host Controller Interface Working Group”（非易失性存储器主机控制器界面工作组）负责管理。 SATA, SAS, PCIe 都是总线规范, 或者叫电气接口SCSI, NVMe 是存储协议NAND, 3D-Xpoint 是介质我们用的比较多的是SATA SSD, PCIe SSD, NVMe SSD, Optane 常用的SATA SSD 对应的存储命令协议是SCSI, PCIe SSD 对应的存储命令协议一般是NVMe. 所以我们常说的 SATA SSD 指的是 NAND SATA/SAS SCSI SSD. PCIe SSD 指的是 NAND PCIe NVMe SSD, NVMe SSD 指的也是 NAND PCIe NVMe SSD. Optane(Intel 产品) 指的是 3D-Xpoint PCIe NVMe SSD 不管是用户态还是内核态, 都需要有对应的存储协议的支持, 所以对应的内核上都要有对应driver, 比如 SCSI 就是 isci, NVMe 就是nvme 这个驱动, 这个驱动做的事情就是封装对应格式的命令包, 传输给SSD上, SCSI 就封装成isci IO命令包, NVMe封装成 NVMe IO命令包. NVMe 一般会有用户态的驱动, spdk 里面就包含. NVMe 使用内核态也可以把硬件跑满, 但是使用SPDK 的话, 因为使用poll 和 SPDK 的大页机制, 可以让负载比较低的时候 IO 延迟更短 所以我们一般常说的PCIe SSD, 一般就是NVMe SSD NVMe SSD的读大概50us, 写大概可以达到10+us. 因为NVMe内部有ram, 这个写入时间是写到NVMe内部ram 的时间, NVMe自带掉电保护, 所以可以认为写入到内部的ram 就落盘了. 这个ram 的大小是具体根据不同厂商不一样 目前更快的是3Dxpoint 介质的optane/AEP 这两个 optane/AEP 都是intel 的产品. optane也是基于PCIe 的NVMe SSD, AEP 走的是内存设备总线, 所以是内存总线的 NVMe SSD。 使用NVMe有啥优势，可以参考超能网的这篇文章。NVMe到底是什么？用它的SSD有啥优势？

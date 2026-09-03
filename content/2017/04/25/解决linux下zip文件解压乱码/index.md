---
title: "解决linux下zip文件解压乱码"
date: 2017-04-25T01:10:40+08:00
lastmod: 2019-09-02T13:03:00+08:00
slug: "解决linux下zip文件解压乱码"
categories: [运维]
tags: [linux命令]
description: "解决linux下zip文件解压乱码"
---
原因由于zip格式并没有指定编码格式，Windows下生成的zip文件中的编码是GBK/GB2312等，因此，导致这些zip文件在Linux下解压时出现乱码问题，因为Linux下的默认编码是UTF8。

解决方案使用7z解压。

安装p7zip和convmv # fedora $ su -c 'yum install p7zip convmv' # ubuntu $ sudo apt-get install p7zip convmv 执行一下命令解压缩 # 使用7z解压缩 $ LANG=C 7za x your-zip-file.zip # 递归转码 $ convmv -f GBK -t utf8 --notest -r .

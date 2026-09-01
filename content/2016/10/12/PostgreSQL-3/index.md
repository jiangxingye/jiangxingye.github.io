---
title: "PostgreSQL的介绍与安装"
date: 2016-10-12T07:44:16+08:00
lastmod: 2019-09-02T13:02:59+08:00
slug: "PostgreSQL-3"
categories: [数据库]
tags: [PostgreSQL]
description: "PostgreSQL的介绍与安装"
---

由于工作认识了PostgreSQL，在此系统学习一下这个数据库，本文除博主实践所得以外，大量译于 官方文档 PostgreSQL是什么 PostgreSQL 是一个基于 POSTGRES, Version 4.2 的对象关系数据库系统（ORDBMS），由加州大学伯克利分校计算机科学系开发。PostgreSQL 是一个开源的数据库，因为自由许可，任何人都可以免费的使用、修改、分发 PostgreSQL 数据库用于任何目的。 它支持大部分的SQL标准并提供了许多流行的功能： 复杂查询（complex queries） 外键（foreign keys） 触发器（triggers） 可更新的视图（updatable views） 事务完整性（transactional integrity） 多版本并发控制（multiversion concurrency control） 用户也可以给PostgreSQL扩展很多东西，比如： 数据类型（data types） 函数（functions） 运算符（operators） 聚合函数（aggregate functions） 索引方法（index methods） 安装博主开发环境： 系统 ：深度Linux 15.3 桌面版 PostgreSQL ：9.4 通过apt-get安装$ apt-get install postgresql-9.4 仓库有许多不同的包（包括第三方插件），最常见、最重要的包（根据需要替换版本号）： postgresql-client-9.4 - 客户端库和二进制文件 postgresql-9.4 - 核心数据库服务器 postgresql-contrib-9.4 - 提供额外的模块 libpq-dev - C语言前端开发库和头文件 postgresql-server-dev-9.4 - C语言后端开发库和头文件 pgadmin3 - pgAdmin III 图形化管理工具

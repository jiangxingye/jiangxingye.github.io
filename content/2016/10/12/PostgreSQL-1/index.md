---
title: "PostgreSQL初体验"
date: 2016-10-12T11:49:40+08:00
lastmod: 2019-09-02T13:02:59+08:00
slug: "PostgreSQL-1"
categories: [数据库]
tags: [PostgreSQL]
description: "PostgreSQL初体验"
---

创建操作系统用户创建一个新的Linux用户：dbuser $sudo adduser dbuser #创建一个新的Linux用户：dbuser 登录PostgreSQL控制台切换到postgres用户 $sudo su - postgres #切换到postgres用户 系统用户postgres以同名数据库用户的身份，登录数据库 $psql #系统用户postgres以同名数据库用户的身份，登录数据库 成功登录到控制台后，显示 postgres=# 注意：后面分号不能省略 \password postgres #给postgres用户设置密码 创建数据库用户dbuser CREATE USER dbuser WITH PASSWORD 'dbuser'; #创建数据库用户dbuser 创建用户数据库，这里为exampledb，并指定所有者为dbuser。 CREATE DATABASE exampledb OWNER dbuser; #创建用户数据库，这里为exampledb，并指定所有者为dbuser。 将exampledb数据库的所有权限都赋予dbuser GRANT ALL PRIVILEGES ON DATABASE exampledb to dbuser; #将exampledb数据库的所有权限都赋予dbuser 推出控制台（也可以直接按ctrl+D） \q #退出控制台

---
title: "what is the Hbass"
date: 2019-09-04T01:08:48+08:00
lastmod: 2019-09-04T10:27:53+08:00
slug: "what is the Hbass"
categories: [it, hadoop]
tags: [hbass]
description: "what is the Hbass"
---
Hbase 简介Hbase概述​ Hbase是一个分布式开源数据库，基于Hadoop分布式文件系统，模仿并提供了基于Google文件系统的Bigtable数据库的所有功能。其目标是处理非常庞大的表，可以用普通的计算机处理超过10亿行数据，并且有数百万列元素组成的数据表。Hbase可以直接使用本地文件系统或者Hadoop作为数据存储方式，不过为了提高数据可靠性和系统的健壮性，发挥Hbase处理大数据量等功能，需要使用Hadoop作为文件系统。

Google BigTable论文中BigTable的定义：Bigtable是一个疏松的分布式的持久的多维排序的map,这个map被行键,列键,和时间戳索引.每一个值都是无解释数组.(A Bigtable is a sparse, distributed, persistent multidimensional sorted map. The map is indexed by a row key, column key, and a timestamp;

each value in the map is an uninterpreted array of bytes.)

---
title: "AngularJs快速入门"
date: 2017-03-04T00:40:58+08:00
lastmod: 2019-09-02T13:02:59+08:00
slug: "AngularJs"
categories: [大前端]
tags: [AngularJs]
description: "AngularJs快速入门"
---

简介 AngularJS是一个JavaScript框架，为了克服HTML在构建应用上的不足而设计的。 AngularJS通过使用我们称为标识符(directives)的结构，让浏览器能够识别新的语法。 AngularJS 使得开发现代的单一页面应用程序（SPAs：Single Page Applications）变得更加容易。 表达式AngularJS 使用 表达式 把数据绑定到 HTML。 表达式AngularJS 表达式写在双大括号内：{{ expression }} 。AngularJS 表达式把数据绑定到 HTML，这与 ng-bind 指令有异曲同工之妙。AngularJS 将在表达式书写的位置”输出”数据。AngularJS 表达式 很像 JavaScript 表达式：它们可以包含文字、运算符和变量。实例： {{ 5 + 5 }} 或 {{ firstName + " " + lastName }} <div ng-app=""> <p>我的第一个表达式: {{ 5 + 5 }}</p> </div> 效果 数字<div ng-app="" ng-init="quantity=1;cost=5"> <p>总价： {{ quantity * cost }}</p> </div>

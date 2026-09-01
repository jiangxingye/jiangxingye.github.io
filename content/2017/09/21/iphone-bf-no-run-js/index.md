---
title: "解决iphone下后退不执行js的问题"
date: 2017-09-21T07:25:32+08:00
lastmod: 2019-09-02T13:02:59+08:00
slug: "iphone-bf-no-run-js"
categories: [大前端]
tags: [js]
description: "解决iphone下后退不执行js的问题"
---

直接上解决方法不论页面是否被缓存，都会触发 pageshow，所以后退后需要执行的方法可以都放在下面事件内： window.addEventListener('pageshow', function () { console.log('on pageshow') }) 浏览器缓存行为 的详细介绍可以参考： [转]浏览器前进/后退缓存（BF Cache）

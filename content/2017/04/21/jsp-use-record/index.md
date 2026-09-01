---
title: "JSP操作记录"
date: 2017-04-21T03:22:12+08:00
lastmod: 2019-09-02T13:02:59+08:00
slug: "jsp-use-record"
categories: [大前端]
tags: [jsp, jstl]
description: "JSP操作记录"
---

问题EL表达式失效<!-- jsp渲染器不识别el表达式，结果页面展示效果如下 --> {person.id} {person.name} 解决方法：在页面内加入下面代码即可 <%@ page isELIgnored="false" %> Map遍历<c:forEach items="${map}" var="entry"> <c:out value="${entry.key}" /> <c:out value="${entry.value}" /> </c:forEach> 取值<c:out value="${map[key]}" />

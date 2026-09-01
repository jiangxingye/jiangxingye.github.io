---
title: "nginx配置记录"
date: 2018-02-08T01:19:09+08:00
lastmod: 2019-09-02T13:02:59+08:00
slug: "nginx-config"
categories: [运维]
tags: [nginx]
description: "nginx配置记录"
---

启用https1.购买免费证书登录阿里云 -> 控制台 -> 安全（云盾） -> CA证书服务 -> 购买证书 2.补全证书信息点击补全，绑定域名 3.下载并配置选择下载 证书for nginx 上面这个页面有相关的配置信息，下面简单介绍： ① 将下载文件中的 *.pem、*.key, 拷贝到 nginx 目录下 的 cert , 当然也可以是其他目录② 修改 nginx.conf server { listen 443 ssl; server_name xiangzhangshugongyi.com; ssl_certificate cert/214487958220243.pem; ssl_certificate_key cert/214487958220243.key; ssl_session_cache shared:SSL:1m; ssl_session_timeout 5m; ssl_ciphers HIGH:!aNULL:!MD5; ssl_prefer_server_ciphers on; location / { proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; proxy_set_header Host $http_host; proxy_set_header X-Forwarded-Proto https; proxy_redirect off; proxy_connect_timeout 240; proxy_send_timeout 240; proxy_read_timeout 240; # note, there is not SSL here! plain HTTP is used proxy_pass http://127.0.0.1:8080; } } ③ 重启 nginx，通过 证书绑定域名进行 https 访问到 服务器跑在 8080 的服务

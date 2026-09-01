# 博客维护操作教程

## 目录结构

```
/Users/jason/Documents/blog/
├── content/          # 博客文章 (Markdown)
│   └── YYYY/MM/DD/slug/index.md
├── static/           # 静态资源 (CSS, JS, 图片, PDF)
├── themes/           # Hugo 主题 (PaperMod)
├── layouts/          # 自定义模板
│   └── _partials/
│       ├── comments.html     # Gitalk 评论
│       ├── extend_head.html  # 自定义 CSS + busuanzi
│       ├── extend_footer.html # 自定义 JS
│       └── post_meta.html    # 文章元信息 (含 lastmod)
├── hugo.toml         # 站点配置
└── archetypes/       # 文章模板
```

## 1. 新增文章

### 方式一：使用 Hugo 命令（推荐）

```bash
cd /Users/jason/Documents/blog
hugo new posts/2026/09/01/文章标题.md
```

这会生成 `content/posts/2026/09/01/文章标题/index.md`，打开编辑即可。

### 方式二：手动创建

```bash
mkdir -p content/2026/09/01/文章-slug
```

创建 `index.md`，内容格式：

```yaml
---
title: "文章标题"
date: 2026-09-01T12:00:00+08:00
lastmod: 2026-09-01T12:00:00+08:00
slug: "文章-slug"
categories: [分类名]
tags: [标签1, 标签2]
description: "文章简介"
---

文章正文（支持 Markdown 和 HTML）
```

> **注意**：`lastmod` 为文章更新时间，PaperMod 会同时显示 `date` 和 `lastmod`。

## 2. 本地预览

```bash
cd /Users/jason/Documents/blog
hugo server --buildDrafts
```

浏览器访问 `http://localhost:1313`

- `--buildDrafts`：包含草稿文章
- 修改文件后自动重新加载

## 3. 构建 & 部署

### 构建静态文件

```bash
cd /Users/jason/Documents/blog
hugo --cleanDestinationDir
```

生成的文件在 `public/` 目录（已 gitignore，不会提交）。

### 推送到 GitHub

```bash
cd /Users/jason/Documents/blog
git add .
git commit -m "更新说明"
git push origin main
```

### GitHub Pages 自动构建

推送后 GitHub 会自动用 Hugo 构建并部署到 `https://jiangxingye.github.io`。

查看构建状态：`https://github.com/jiangxingye/jiangxingye.github.io/settings/pages`

## 4. Gitalk 评论配置

首次使用需配置 Gitalk：

### 步骤 1：创建 GitHub Application

1. 访问 `https://github.com/settings/developers`
2. 点击 **New GitHub App**
3. 填写：
   - **Application name**: `jiangxingye-blog-comments`
   - **Homepage URL**: `https://jiangxingye.github.io`
   - **Callback URL**: `https://jiangxingye.github.io`
4. 点击 **Create GitHub App**
5. 记录 **Client ID** 和生成 **Client Secret**

### 步骤 2：创建评论存储仓库

1. 在 GitHub 创建 public 仓库 `jiangxingye-comments`
2. 启用 Discussions：`https://github.com/jiangxingye/jiangxingye-comments/settings/discussions` → **Enable discussions**

### 步骤 3：更新配置

编辑 `/Users/jason/Documents/blog/hugo.toml`：

```toml
[params.gitalk]
  clientID = "你的 Client ID"
  clientSecret = "你的 Client Secret"
  repo = "jiangxingye-comments"
  owner = "jiangxingye"
  admin = ["jiangxingye"]
```

提交推送即可生效。

## 5. 文章浏览量统计

已集成 **不蒜子 (busuanzi)**，无需额外配置。浏览量自动统计显示在页面底部。

## 6. 常见问题

### 构建失败

```bash
# 清除缓存重新构建
hugo --cleanDestinationDir --gc
```

### 文章内容中的 HTML 不显示

`hugo.toml` 已设置 `unsafe = true` 支持原始 HTML。如果仍有问题，检查 Goldmark 配置。

### 修改主题配置

PaperMod 配置在 `hugo.toml` 的 `[params]` 部分，完整参数参考：
`https://github.com/adityatelange/hugo-PaperMod/wiki`

### 更新主题

```bash
cd /Users/jason/Documents/blog/themes/PaperMod
git pull origin master
cd /Users/jason/Documents/blog
git add themes/PaperMod
git commit -m "更新 PaperMod 主题"
git push
```

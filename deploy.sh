#!/bin/bash

# iClip3.0操作指南 - 自动部署脚本
# 使用方法：./deploy.sh

echo "🚀 开始部署iClip3.0操作指南到GitHub Pages..."

# 检查是否在Git仓库中
if [ ! -d ".git" ]; then
    echo "❌ 错误：当前目录不是Git仓库"
    echo "请先运行：git init"
    exit 1
fi

# 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 发现未提交的更改，正在添加..."
    git add .
    
    echo "💾 提交更改..."
    git commit -m "Update iClip3.0 operation guide - $(date '+%Y-%m-%d %H:%M:%S')"
else
    echo "✅ 没有未提交的更改"
fi

# 推送到远程仓库
echo "📤 推送到GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ 部署成功！"
    echo ""
    echo "🌐 您的网站地址："
    echo "https://$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^/]*\)\/\([^.]*\).*/\1.github.io\/\2/')"
    echo ""
    echo "📱 推广建议："
    echo "1. 分享链接到社交媒体"
    echo "2. 使用社交媒体分享卡片"
    echo "3. 生成二维码供线下分享"
    echo ""
    echo "🎉 部署完成！网站将在1-2分钟内更新"
else
    echo "❌ 部署失败，请检查网络连接和GitHub权限"
    exit 1
fi

#!/bin/bash

echo "🚀 开始部署iClip3.0操作指南到GitHub Pages..."

# 检查是否已初始化git仓库
if [ ! -d ".git" ]; then
    echo "📦 初始化Git仓库..."
    git init
fi

# 添加所有文件
echo "📁 添加文件到Git仓库..."
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "Deploy iClip3.0 operation guide to GitHub Pages"

# 检查是否已设置远程仓库
if ! git remote | grep -q origin; then
    echo "⚠️  请先设置GitHub仓库地址："
    echo "git remote add origin https://github.com/您的用户名/仓库名.git"
    echo ""
    echo "然后重新运行此脚本"
    exit 1
fi

# 推送到GitHub
echo "🌐 推送到GitHub..."
git push -u origin main

echo ""
echo "✅ 部署完成！"
echo "📱 您的网站地址：https://您的用户名.github.io/仓库名/"
echo ""
echo "🔧 如果网站无法访问，请检查："
echo "1. GitHub仓库是否设置为公开(Public)"
echo "2. 是否在Settings > Pages中启用了GitHub Pages"
echo "3. 是否选择了正确的分支和文件夹"

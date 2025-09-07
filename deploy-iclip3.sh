#!/bin/bash

echo "🚀 开始部署 iClip3.0 完整操作指南..."

# 检查网络连接
echo "📡 检查网络连接..."
if curl -I https://github.com --connect-timeout 10 > /dev/null 2>&1; then
    echo "✅ 网络连接正常"
else
    echo "❌ 网络连接失败，请检查网络设置"
    exit 1
fi

# 确保文件存在
if [ ! -f "iClip3.0-完整操作指南-苹果风格.html" ]; then
    echo "❌ 源文件不存在"
    exit 1
fi

# 备份当前index.html
echo "💾 备份当前 index.html..."
cp index.html index_backup_$(date +%Y%m%d_%H%M%S).html

# 复制正确的内容到index.html
echo "📋 复制正确内容到 index.html..."
cp "iClip3.0-完整操作指南-苹果风格.html" index.html

# 检查内容是否正确
if grep -q "iClip3.0智能直播带货系统" index.html; then
    echo "✅ 内容验证成功"
else
    echo "❌ 内容验证失败"
    exit 1
fi

# 提交更改
echo "📝 提交更改..."
git add index.html
git commit -m "部署 iClip3.0 完整操作指南 - $(date '+%Y-%m-%d %H:%M:%S')"

# 推送到GitHub
echo "🚀 推送到 GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ 部署成功！"
    echo "🌐 网站地址: https://zxy36277-jpg.github.io/iclip3-sop-guide/"
    echo "⏰ 请等待 1-2 分钟让 GitHub Pages 更新"
else
    echo "❌ 推送失败，请检查网络连接和权限"
fi

# 🚀 快速部署指南

## 一键部署到GitHub Pages

### 方法1：使用自动部署脚本（推荐）

```bash
# 1. 初始化Git仓库（如果还没有）
git init

# 2. 添加远程仓库（替换为您的GitHub仓库地址）
git remote add origin https://github.com/您的用户名/iclip3-sop-guide.git

# 3. 运行自动部署脚本
./deploy.sh
```

### 方法2：手动部署

```bash
# 1. 添加所有文件
git add .

# 2. 提交更改
git commit -m "Deploy iClip3.0 operation guide"

# 3. 推送到GitHub
git push origin main
```

## 📋 部署前检查清单

- [ ] 已创建GitHub仓库
- [ ] 仓库设置为公开（Public）
- [ ] 已上传所有必要文件
- [ ] 已启用GitHub Pages
- [ ] 已设置正确的分支和文件夹

## 🌐 部署后访问

部署完成后，您的网站地址将是：
```
https://您的用户名.github.io/iclip3-sop-guide/
```

## 🔧 启用GitHub Pages

1. 进入仓库的 **Settings** 页面
2. 找到 **Pages** 选项
3. 在 **Source** 中选择 **Deploy from a branch**
4. 选择 **main** 分支和 **/ (root)** 文件夹
5. 点击 **Save**

## 📱 测试访问

部署完成后，请测试：
- [ ] 网站可以正常访问
- [ ] 移动端显示正常
- [ ] 所有链接正常工作
- [ ] 页面加载速度正常

## 🎯 推广准备

部署成功后，您可以：
1. 分享链接到社交媒体
2. 使用社交媒体分享卡片
3. 生成二维码供线下分享
4. 向相关群组和论坛推广

---

**需要帮助？** 查看详细的 `部署指南.md` 文件

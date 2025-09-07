#!/bin/bash

# 图片压缩脚本 - 使用 macOS 自带的 sips 工具
echo "🖼️  开始压缩图片文件..."

# 创建备份目录
mkdir -p original_images_backup

# 压缩函数
compress_image() {
    local file="$1"
    local filename=$(basename "$file")
    local name="${filename%.*}"
    local ext="${filename##*.}"
    
    echo "📦 压缩: $filename"
    
    # 备份原文件
    cp "$file" "original_images_backup/$filename"
    
    # 获取原文件大小
    local original_size=$(stat -f%z "$file")
    
    # 使用 sips 压缩图片
    # -s format 指定输出格式
    # -Z 按比例缩放（保持宽高比）
    # -c 裁剪到指定尺寸
    # -o 输出文件
    
    # 对于 PNG 文件，转换为 JPEG 格式以减小文件大小
    if [[ "$ext" == "png" ]]; then
        sips -s format jpeg -s formatOptions 70 "$file" --out "${name}_compressed.jpg"
        # 如果压缩后的文件更小，则替换原文件
        if [[ -f "${name}_compressed.jpg" ]]; then
            local compressed_size=$(stat -f%z "${name}_compressed.jpg")
            if [[ $compressed_size -lt $original_size ]]; then
                mv "${name}_compressed.jpg" "$file"
                echo "✅ $filename: ${original_size} bytes → ${compressed_size} bytes (节省 $((original_size - compressed_size)) bytes)"
            else
                rm "${name}_compressed.jpg"
                echo "⚠️  $filename: 压缩后文件更大，保持原文件"
            fi
        fi
    else
        # 对于其他格式，直接优化
        sips -s formatOptions 80 "$file" --out "${name}_optimized.${ext}"
        if [[ -f "${name}_optimized.${ext}" ]]; then
            local optimized_size=$(stat -f%z "${name}_optimized.${ext}")
            if [[ $optimized_size -lt $original_size ]]; then
                mv "${name}_optimized.${ext}" "$file"
                echo "✅ $filename: ${original_size} bytes → ${optimized_size} bytes (节省 $((original_size - optimized_size)) bytes)"
            else
                rm "${name}_optimized.${ext}"
                echo "⚠️  $filename: 优化后文件更大，保持原文件"
            fi
        fi
    fi
}

# 压缩所有 PNG 文件
for file in *.png; do
    if [[ -f "$file" ]]; then
        compress_image "$file"
    fi
done

echo ""
echo "📊 压缩完成！"
echo "📁 原文件备份在: original_images_backup/ 目录"
echo ""
echo "📈 文件大小对比:"
echo "=================="
for file in *.png; do
    if [[ -f "$file" ]]; then
        local filename=$(basename "$file")
        local current_size=$(stat -f%z "$file")
        local backup_file="original_images_backup/$filename"
        if [[ -f "$backup_file" ]]; then
            local original_size=$(stat -f%z "$backup_file")
            local saved=$((original_size - current_size))
            local percent=$((saved * 100 / original_size))
            echo "$filename: $(numfmt --to=iec $original_size) → $(numfmt --to=iec $current_size) (节省 ${percent}%)"
        fi
    fi
done

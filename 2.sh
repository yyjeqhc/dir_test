#!/bin/bash

# 设置起始目录为当前目录
START_DIR="$PWD"

# 外层循环：创建 8 个顶级文件夹 (1, 2, ..., 8)
for top in {1..8}; do
    # 初始化当前目录为顶级文件夹
    CURRENT_DIR="$top"
    mkdir -p "$CURRENT_DIR"
    
    # 在当前文件夹中创建 8 个文件 (1.txt, 2.txt, ..., 8.txt)
    for file_num in {1..8}; do
        FILE_PATH="$CURRENT_DIR/$file_num.txt"
        RELATIVE_PATH="${CURRENT_DIR}/$file_num.txt"
        echo "$RELATIVE_PATH" > "$FILE_PATH"
        echo "已创建文件: $FILE_PATH，内容为: $RELATIVE_PATH"
    done
    
    # 内层循环：创建 8 层嵌套子文件夹
    for i in {1..8}; do
        SUB_DIR="$CURRENT_DIR/$i"
        mkdir -p "$SUB_DIR"
        
        # 在每个子文件夹中创建 8 个文件 (1.txt, 2.txt, ..., 8.txt)
        for file_num in {1..8}; do
            FILE_PATH="$SUB_DIR/$file_num.txt"
            RELATIVE_PATH="${SUB_DIR}/$file_num.txt"
            echo "$RELATIVE_PATH" > "$FILE_PATH"
            echo "已创建文件: $FILE_PATH，内容为: $RELATIVE_PATH"
        done
        
        # 更新 CURRENT_DIR 为下一层
        CURRENT_DIR="$SUB_DIR"
    done
done

echo "文件夹结构和文件创建完成！"

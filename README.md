# 江苏大学课程报告 LaTeX 模板

**Jiangsu University (UJS/JSU) Course Report LaTeX Template**

适用于江苏大学本科生的课程报告和课程设计，最适配通信工程专业的排版规范。

## 使用方法

### 编译（推荐）

使用 latexmk 一键编译：

```bash
latexmk -xelatex example.tex
```

清理辅助文件：

```bash
latexmk -c
```

### 手动编译

```bash
xelatex example.tex
bibtex example
xelatex example.tex
xelatex example.tex
```

### 项目结构

```
├── example.tex          # 主文件
├── ujsreport.cls        # 模板文件
├── data/                # 章节内容
│   ├── abstract.tex     # 摘要
│   ├── chapter01.tex    # 第一章
│   ├── chapter02.tex    # 第二章
│   └── chapter03.tex    # 第三章
├── refs/
│   └── refs.bib         # 参考文献
└── figures/logo/        # 校徽
```

### 文档信息设置

在 `example.tex` 中修改：

```latex
\ctitle{报告标题}
\studentid{学号}
\class{班级}
\author{姓名}
\reporttype{报告类型}
\date{2025年1月}
```

## 格式说明

- **正文**：小四号宋体，1.5倍行距
- **一级标题**：小三号黑体居中
- **二级标题**：四号黑体
- **三级标题**：小四号黑体
- **页眉**：正面``xxxx报告``，反面``班级  学号  姓名``
- **页码**：前置部分大写罗马数字，正文阿拉伯数字，居中
- **参考文献**：GB/T 7714 格式

## 注意事项

- **暂不支持 Overleaf**：由于字体依赖，目前仅支持本地编译
- **系统要求**：TeX Live 2020+ 或 MiKTeX，使用 XeLaTeX 引擎

## 参考规范

- 主要参考：`(日常)通信工程专业排版规范.docx`
- 补充参考：`江苏大学毕业设计（论文）写作规范.doc`

以上参考文档位于 `docs/` 目录。

## 参考仓库

- [tuna/thuthesis](https://github.com/tuna/thuthesis) - 清华大学学位论文模板
- [UJS_Masterthesis](https://github.com/ChenXiaoTian99/UJS_Masterthesis) - 江苏大学硕士论文模板
- [zepinglee/gbt7714-bibtex-style](https://github.com/zepinglee/gbt7714-bibtex-style) - GB/T 7714 参考文献样式

## 致谢

本项目代码（包括本 README）主要由 [Claude Code](https://claude.ai/download) 生成。

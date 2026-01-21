# 江苏大学课程报告 LaTeX 模板

**Jiangsu University (UJS/JSU) Course Report LaTeX Template**

适用于江苏大学本科生的课程报告和课程设计，最适配通信工程专业的排版规范。

## 使用方法

### 编辑器推荐

推荐使用 **VSCode + LaTeX Workshop 插件**，配置文件可参考 [https://rosetears.cn/archives/73/](https://rosetears.cn/archives/73/)（配置看起来很长是因为注释较多，实际使用体验非常好）。

### 编译（推荐）

使用 latexmk 一键编译：

```bash
latexmk -xelatex example.tex
```

清理辅助文件：

```bash
latexmk -c
```

### 使用 Makefile

```bash
make        # 编译
make clean  # 清理辅助文件
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

## 推荐工作流

由于不同专业、不同课程乃至同一门课不同次作业的封面要求都不一样，本模板封面仅供参考。推荐的工作流程：

1. **撰写内容**：先用 Markdown 写好 `RAW.md`，再让 AI 将内容按照本仓库结构转化为 `.tex` 代码
2. **生成正文**：本模板仅用于提供封面以后的所有内容（摘要、目录、正文、参考文献），不符合要求封面可以在第4步时去掉~
3. **制作封面**：将老师发的 `.docx` 转为 PDF，使用 Adobe Illustrator 或 Adobe Acrobat 模板删去占位内容（比如张三/XXX这样的内容）并填入个人信息
   > 老师发的 docx 模板一般下划线都没设置好，用这种方式可以让信息正常居中在下划线上方，且下划线长度不变。也可以在 Word 里用表格达到同样效果，但直接改 PDF 也很方便（个人更推荐 Illustrator）
4. **合并 PDF**：用 Acrobat 或其他 PDF 编辑器将封面与正文拼接成完整报告

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
- **暂只支持 Windows**：模板使用 Windows 系统字体（SimSun、SimHei、KaiTi）
- **系统要求**：TeX Live 2020+ 或 MiKTeX，使用 XeLaTeX 引擎

## 参考规范

- 主要参考：`(日常)通信工程专业排版规范.docx`
- 补充参考：`江苏大学毕业设计（论文）写作规范.doc`

以上参考文档位于 `docs/` 目录。

## 参考仓库

- [tuna/thuthesis](https://github.com/tuna/thuthesis) - 清华大学学位论文模板
- [xtc-chen/UJS_Masterthesis](https://github.com/xtc-chen/UJS_Masterthesis) - 江苏大学硕士论文模板
- [zepinglee/gbt7714-bibtex-style](https://github.com/zepinglee/gbt7714-bibtex-style) - GB/T 7714 参考文献样式

## 致谢

本项目代码（包括本 README）主要由 [Claude Code](https://claude.ai/download) 生成。

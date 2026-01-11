# latexmkrc - Configuration for latexmk
# 江苏大学课程报告模板 latexmk 配置文件

# 设置默认使用 XeLaTeX 编译
$pdf_mode = 5;

# XeLaTeX 编译命令
$xelatex = 'xelatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';

# 输出目录（如果需要的话，取消注释）
# $out_dir = 'build';

# 清理时额外删除的文件类型
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml bbl bcf fdb_latexmk run tdo %R-blx.bib';

# 允许重复运行的最大次数
$max_repeat = 5;

# PDF 查看器设置（Windows）
# $pdf_previewer = 'start SumatraPDF %O %S';

# PDF 查看器设置（macOS）
# $pdf_previewer = 'open -a Skim %O %S';

# PDF 查看器设置（Linux）
# $pdf_previewer = 'evince %O %S';

# 自动编译模式：监视文件变化
# $preview_continuous_mode = 1;

# 在编译完成后自动打开 PDF
# $preview_mode = 1;

# 设置 BibTeX 后端
$bibtex_use = 2;

# latexmkrc - latexmk 配置文件
# 设置默认使用 XeLaTeX 编译

$pdf_mode = 5;
$xelatex = 'xelatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';

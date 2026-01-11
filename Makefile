# Makefile for UJS Report Template
# 江苏大学课程报告模板构建文件

# 编译器设置
LATEX = xelatex
BIBTEX = bibtex

# 主要文件
EXAMPLE = example

# 编译选项
LATEXFLAGS = -interaction=nonstopmode -file-line-error

# 默认目标
.PHONY: all
all:
	$(LATEX) $(LATEXFLAGS) $(EXAMPLE).tex
	$(LATEX) $(LATEXFLAGS) $(EXAMPLE).tex

# 清理辅助文件
.PHONY: clean
clean:
	-del /Q *.aux *.log *.toc *.out *.bbl *.blg *.lof *.lot *.synctex.gz 2>nul

# 清理所有生成文件（包括PDF）
.PHONY: distclean
distclean: clean
	-del /Q *.pdf 2>nul

# 帮助信息
.PHONY: help
help:
	@echo UJS Report Template Makefile
	@echo ============================
	@echo make all       - 编译示例文档
	@echo make clean     - 清理辅助文件
	@echo make distclean - 清理所有生成文件
	@echo make help      - 显示此帮助信息

% ujsreport.cls
% 江苏大学课程报告与结课论文模板
% 基于清华大学模板架构，融合江苏大学定制元素
%
% 版本：1.0.0
% 日期：2025-12-29
% 作者：Based on ThuThesis by Tsinghua TUNA

\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{ujsreport}[2025/12/29 v1.0.0 Jiangsu University Report and Course Paper Template]

%% ============================================================================
%% 选项处理
%% ============================================================================

% 引入 kvoptions 宏包处理选项
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=ujs, prefix=ujs@, setkeys=\kvsetkeys}

% 其他选项
\DeclareBoolOption[false]{twoside}        % 双面打印

% 处理未知选项
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}

\ProcessKeyvalOptions*

%% ============================================================================
%% 加载基础文档类
%% ============================================================================

\ifujs@twoside
  \LoadClass[
    a4paper,
    twoside,
    openany,
    UTF8,
    fontset = none,
    zihao = -4,
    linespread = 1.5
  ]{ctexbook}[2017/04/01]
\else
  \LoadClass[
    a4paper,
    oneside,
    openany,
    UTF8,
    fontset = none,
    zihao = -4,
    linespread = 1.5
  ]{ctexbook}[2017/04/01]
\fi

%% ============================================================================
%% 检查编译引擎
%% ============================================================================

\RequirePackage{iftex}
\ifXeTeX\relax\else
  \ifLuaTeX\relax\else
    \ClassError{ujsreport}{%
      This template requires XeLaTeX or LuaLaTeX to compile.\MessageBreak
      Please use `xelatex' or `lualatex' instead of `pdflatex'%
    }{%
      See the template documentation for more information.%
    }
  \fi
\fi

%% ============================================================================
%% 引入核心宏包
%% ============================================================================

% 基础工具宏包
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{filehook}

% 页面设置
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{enumitem}

% 数学支持
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

% 字体设置
\RequirePackage{fontspec}
\ifXeTeX
  \RequirePackage{xeCJK}
\else
  \RequirePackage{luatexja}
\fi

% 图表支持
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{diagbox}
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{float}

% 参考文献
\RequirePackage[square,numbers,comma,sort&compress]{natbib}

% 超链接
\RequirePackage{hyperref}
\RequirePackage{url}

% 其他工具
\RequirePackage{setspace}
\RequirePackage{color}
\RequirePackage{threeparttable}
\RequirePackage{ulem}
\RequirePackage{tikz}

%% ============================================================================
%% 字体配置
%% ============================================================================

% 数学字体配置
% 使用 Times New Roman 作为西文主字体
\setmainfont{Times New Roman}

% unicode-math 数学字体
\RequirePackage{unicode-math}
\setmathfont{Latin Modern Math}

% 中文字体设置
\ifXeTeX
  \setCJKmainfont{SimSun}[
    AutoFakeBold = 2.5,
    ItalicFont = KaiTi
  ]
  \setCJKsansfont{SimHei}[AutoFakeBold = 2.5]
  \setCJKmonofont{FangSong}
  \newCJKfontfamily\zhongsong{STZhongsong}[AutoFakeBold = 2.5]
  \newCJKfontfamily\heiti{SimHei}[AutoFakeBold = 2.5]
  \newCJKfontfamily\kaishu{KaiTi}[AutoFakeBold = 2.5]
  \newCJKfontfamily\fangsong{FangSong}[AutoFakeBold = 2.5]
\else
  % LuaTeX 字体设置
  \setCJKmainfont{SimSun}[AutoFakeBold = 2.5]
  \setCJKsansfont{SimHei}[AutoFakeBold = 2.5]
  \setCJKmonofont{FangSong}
\fi

%% ============================================================================
%% 页面设置
%% ============================================================================

\geometry{
  paper = a4paper,
  top = 25mm,
  bottom = 20mm,
  left = 25mm,
  right = 20mm,
  bindingoffset = 5mm,
  headheight = 13pt,
  foot = 6.4mm,
  includeheadfoot
}

%% ============================================================================
%% 标题格式设置
%% ============================================================================

\ctexset{
  contentsname = 目~~录,
  % 一级标题：三号粗黑体，居中
  % 一级标题：小三号粗黑体，居中
  chapter/format = \zihao{-3}\bfseries\heiti\centering,
  chapter/aftername = ~~,
  chapter/beforeskip = 3.2ex,
  chapter/afterskip = 3.9ex,
  chapter/fixskip = true,
  chapter/pagestyle = fancy,
  % 二级标题：四号粗黑体
  section/format = \zihao{4}\bfseries\heiti,
  section/aftername = ~~,
  section/beforeskip = 6ex,
  section/afterskip = 6ex,
  section/fixskip = true,
  % 三级标题：小四号粗黑体
  subsection/format = \zihao{-4}\bfseries\heiti,
  subsection/aftername = ~~,
  subsection/beforeskip = 4.7ex,
  subsection/afterskip = 4.7ex,
  subsection/fixskip = true
}

%% ============================================================================
%% 页眉页脚设置
%% ============================================================================

\pagestyle{fancy}
\fancyhf{}

% 页眉设置：奇数页（正面）显示报告名，偶数页（反面）显示标题
\fancyhead[C]{\zihao{5}\leftmark}
% 页脚：页码居中
\fancyfoot[C]{\zihao{5}\thepage}
% 页眉横线宽度
\renewcommand{\headrulewidth}{0.75pt}

% 设置章节标记格式
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

% 定义页眉文字存储
\def\ujs@value@headertext{江苏大学课程报告}
\newcommand{\headertext}[1]{\def\ujs@value@headertext{#1}}

% 正文页面样式
\fancypagestyle{mainmatter}{%
  \fancyhf{}
  \fancyhead[CO]{\zihao{5}\ujs@value@headertext}
  \fancyhead[CE]{\zihao{5}\ujs@value@class\quad\quad\ujs@value@studentid\quad\quad\ujs@value@author}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand{\headrulewidth}{0.75pt}
}

% 设置罗马数字页码为大写
\renewcommand{\frontmatter}{%
  \clearpage
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{mainmatter}
}

% 正文开始时切换页面样式
\renewcommand{\mainmatter}{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{mainmatter}
}

%% ============================================================================
%% 图表格式设置
%% ============================================================================

\DeclareCaptionFont{wukai}{\zihao{5}\kaishu}
\captionsetup{
  labelsep = space,
  font = wukai
}

% 双语图表标题支持
\RequirePackage[list=off]{bicaption}
\captionsetup[figure][bi-second]{name=Fig.}
\captionsetup[table][bi-second]{name=Tab.}

%% ============================================================================
%% 目录格式设置
%% ============================================================================

% 目录标题：二号黑体居中
\renewcommand{\contentsname}{\zihao{2}\heiti 目~~录}

% 目录内容格式
% 一级目录：四号宋体
\titlecontents{chapter}[0em]{\zihao{4}}{\thecontentslabel~~}{}{\titlerule*[0.25em]{.}\contentspage}
% 二级目录：小四宋体
\titlecontents{section}[2em]{\zihao{-4}}{\thecontentslabel~~}{}{\titlerule*[0.25em]{.}\contentspage}
% 三级目录：小四宋体
\titlecontents{subsection}[4em]{\zihao{-4}}{\thecontentslabel~~}{}{\titlerule*[0.25em]{.}\contentspage}

%% ============================================================================
%% 用户配置接口
%% ============================================================================

% 定义标签
\def\ujs@label@studentid{学号}
\def\ujs@label@class{班级}
\def\ujs@label@author{姓名}
\def\ujs@label@reporttype{报告类型}
\def\ujs@label@cabstract{摘~~要}
\def\ujs@label@eabstract{ABSTRACT}
\def\ujs@label@ckeywords{关键词}
\def\ujs@label@ekeywords{Keywords}

% 定义值存储
\def\ujs@value@title{}
\def\ujs@value@studentid{}
\def\ujs@value@class{}
\def\ujs@value@author{}
\def\ujs@value@reporttype{}
\def\ujs@value@date{\today}
\def\ujs@value@ckeywords{}
\def\ujs@value@ekeywords{}

% 定义用户命令
\newcommand{\ctitle}[1]{\def\ujs@value@title{#1}}
\newcommand{\studentid}[1]{\def\ujs@value@studentid{#1}}
\newcommand{\class}[1]{\def\ujs@value@class{#1}}
\renewcommand{\author}[1]{\def\ujs@value@author{#1}}
\newcommand{\reporttype}[1]{\def\ujs@value@reporttype{#1}}
\renewcommand{\date}[1]{\def\ujs@value@date{#1}}
\newcommand{\ckeywords}[1]{\def\ujs@value@ckeywords{#1}}
\newcommand{\ekeywords}[1]{\def\ujs@value@ekeywords{#1}}

% 统一配置接口（类似清华模板的 \thusetup）
\newcommand{\ujssetup}[1]{\kvsetkeys{ujs}{#1}}

%% ============================================================================
%% 封面设置
%% ============================================================================

% 固定宽度标签（4个字符宽度）
\newcommand{\infolabel}[1]{\makebox[4em][s]{#1}}

\renewcommand{\maketitle}{%
  \begin{titlepage}
    \pagestyle{empty}
    \begin{center}
      % 标题
      \vspace*{1cm}
      {\fontsize{26pt}{39pt}\selectfont\heiti 江\ 苏\ 大\ 学\ 课\ 程\ 报\ 告}

      \vspace{2cm}

      % 校徽
      \includegraphics[width=5cm]{figures/logo/ujslogo.pdf}

      \vspace{2cm}

      % 题目
      {\fontsize{16pt}{24pt}\selectfont\heiti\ujs@value@title}

      \vspace{1.5cm}
    \end{center}

    % 信息区域
    \begin{flushleft}
      \hspace{3cm}
      \begin{minipage}{12cm}
        {\fontsize{16pt}{24pt}\selectfont\heiti
          \infolabel{\ujs@label@studentid}：\underline{\makebox[7.5cm]{\ujs@value@studentid}}\\[0.8cm]
          \infolabel{\ujs@label@class}：\underline{\makebox[7.5cm]{\ujs@value@class}}\\[0.8cm]
          \infolabel{\ujs@label@author}：\underline{\makebox[7.5cm]{\ujs@value@author}}\\[0.8cm]
          \infolabel{\ujs@label@reporttype}：\underline{\makebox[7.5cm]{\ujs@value@reporttype}}
        }
      \end{minipage}
    \end{flushleft}

    \vfill

    % 底部日期
    \begin{center}
      {\fontsize{16pt}{24pt}\selectfont\heiti\ujs@value@date}
    \end{center}

    \vspace{1cm}
  \end{titlepage}
  \clearpage
}

%% ============================================================================
%% 摘要环境
%% ============================================================================

% 中文摘要环境
\newenvironment{ujscabstract}{%
  \chapter*{\ujs@label@cabstract}
  \addcontentsline{toc}{chapter}{\ujs@label@cabstract}
}{%
  \par\vspace{2ex}\noindent
  {\heiti\ujs@label@ckeywords：}\ujs@value@ckeywords
  \clearpage
}

% 英文摘要环境
\newenvironment{ujseabstract}{%
  \chapter*{\ujs@label@eabstract}
  \addcontentsline{toc}{chapter}{\ujs@label@eabstract}
}{%
  \par\vspace{2ex}\noindent
  {\bfseries\ujs@label@ekeywords: }\ujs@value@ekeywords
  \clearpage
}

% 为了兼容性，保留旧名称（如果没有冲突）
\AtBeginDocument{%
  \@ifundefined{cabstract}{%
    \newenvironment{cabstract}{\ujscabstract}{\endujscabstract}
  }{}%
  \@ifundefined{eabstract}{%
    \newenvironment{eabstract}{\ujseabstract}{\endujseabstract}
  }{}%
}

%% ============================================================================
%% 其他环境
%% ============================================================================

% 附录设置
\renewcommand{\appendix}{%
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}%
  \ctexset{chapter/number=\Alph{chapter}}
}

%% ============================================================================
%% 超链接配置
%% ============================================================================

\AtBeginDocument{%
  \hypersetup{
    colorlinks = true,
    linkcolor = black,
    citecolor = black,
    urlcolor = blue,
    bookmarksnumbered = true,
    bookmarksopen = true,
    pdftitle = {\ujs@value@title},
    pdfauthor = {\ujs@value@author}
  }
}

%% ============================================================================
%% 参考文献设置
%% ============================================================================

\bibliographystyle{gbt7714-numerical}

% 参考文献标题：左顶格
\renewcommand\bibname{参考文献}
\renewcommand{\bibsection}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\bibname}
  \begin{center}
    \zihao{-3}\bfseries\heiti\bibname
  \end{center}
  \vspace{1em}
}

%% ============================================================================
%% 辅助命令
%% ============================================================================

% 圆圈数字命令（来自江苏大学模板）
\newcommand*{\circled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
  circle (.5em) node {\makebox[1em][c]{\small #1}};}}

% 空白页命令
\newcommand{\myemptypage}{%
  \clearpage
  \thispagestyle{empty}
  \mbox{}
  \clearpage
}

%% ============================================================================
%% 结束定义
%% ============================================================================

\endinput

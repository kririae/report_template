\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{breport}[2023/02/01 Sample Report]


%%Parse Options
\PassOptionsToClass{12pt,a4paper}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}
%%%Key-value options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=OPT,prefix=OPT@}
\DeclareBoolOption{sign}
\ProcessKeyvalOptions*


%%Basic Packages
\PassOptionsToPackage{amssymb}{SIunits}
\PassOptionsToPackage{shortlabels}{enumitem}
\PassOptionsToPackage{framemethod=TikZ}{mdframed}
%%%Load common packages
\RequirePackage{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{SIunits}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{listings}
\RequirePackage{enumitem}
%%%Load design packages
\RequirePackage{tikz}
\RequirePackage{mdframed}
\RequirePackage{pgfplots}
\RequirePackage{xcolor-material}
\RequirePackage{tcolorbox}
\RequirePackage{cancel}
%%%Load Util packages
\RequirePackage{pgffor}
\RequirePackage{ifthen}
\RequirePackage{xstring}
\RequirePackage{xspace}


%%Common Setup
\geometry{%
  a4paper,
  hscale=0.618, 
  vscale=0.85,
  hcentering,
  marginparsep=5mm,
  marginparwidth=16ex,
}%%
\lstset{%
  basicstyle=\ttfamily\scriptsize, 
  columns=fullflexible,
  numbers=left,
  frame=single,
  breaklines=true,
  postbreak=\mbox{\textcolor{MaterialBlue}{$\hookrightarrow$}\space},
}%%
\hypersetup{%
  colorlinks=true,
  linkcolor=black,
  filecolor=black,
  urlcolor=black,
}%%
\setlength{\parindent}{0em}
\setlength{\parskip}{1.5ex}
\surroundwithmdframed{quote}
\mdfsetup{%
  topline=false,
  bottomline=false,
  skipabove=\topsep,
  skipbelow=\topsep,
  linecolor=MaterialBlueGrey500
}%%


%%Font Settings
\PassOptionsToPackage{T1}{fontenc}
\PassOptionsToPackage{tt=false,type1=true}{libertine}
\PassOptionsToPackage{varqu}{zi4}
\PassOptionsToPackage{libertine}{newtxmath}
\RequirePackage{fontenc}
\RequirePackage{libertine}
\RequirePackage{zi4}
\RequirePackage{newtxmath}
\RequirePackage{sectsty}
\sectionfont{\color{MaterialBlueGrey800} \scshape} 
\subsectionfont{\color{MaterialBlueGrey700}}
\subsubsectionfont{\color{MaterialBlueGrey600}}


%%Customized Commands
\renewcommand*{\vec}{\mathbf}
\newcommand*{\E}[1]{\mathbb{E}\left[#1\right]}
\newcommand*{\V}[1]{\mathrm{Var}\left(#1\right)}
\newcommand*{\Cov}[1]{\mathrm{Cov}\left(#1\right)}
\newcommand*{\qed}{\hfill\blacksquare}
\newcommand*{\circled}[1]{\tikz[baseline=(char.base)]{
  \node[shape=circle,draw,inner sep=2pt] (char) {#1};}}
%%%Renew href
\makeatletter
\def\dynamicSpace{%
  \@ifnextchar ,{}{%
    \@ifnextchar .{}{\ }%
  }%
}%
\newcommand*\topbullet{$^\bullet$}
\DeclareRobustCommand*{\href}{\hyper@normalise\href@}
\def \href@ #1#2 {\hyper@linkurl{#2\color{MaterialBlue}{\topbullet}\dynamicSpace}{#1}}
\makeatother
%%%Renew texttt
\let\oldtexttt\texttt
\renewcommand*{\texttt}{\begingroup
  \catcode`_=12 \textttimpl}
\newcommand{\textttimpl}[1]{%
  \oldtexttt{\scantokens{#1\noexpand}}%
  \endgroup
}%
%%%Margin par settings
\let \oldmarginpar \marginpar
\renewcommand{\marginpar}[2][]{%
  \oldmarginpar[#1]{%
      \footnotesize \color{MaterialBlueGrey500} \sffamily
      \setlength{\baselineskip}{1.25em} \raggedright
      #2
}}


%%Colorbox Setting
\tcbuselibrary{most}
\newcommand*{\mathbox}[1]{%
  \tcboxmath[
  colback=white,
  colframe=MaterialBlueGrey800,
  colbacktitle=white,
  coltitle=black,
  enhanced,attach boxed title to top center={yshift=-2mm},
  top=1mm,bottom=1mm,left=1mm,right=1mm,
  title={#1},
]}%%
\newtcolorbox{problem}{%
  breakable,
  title=Problem,
  colback=MaterialBlueGrey800!10!white,
  colframe=white,boxrule=0pt,frame hidden,
  fonttitle=\bfseries,
  colbacktitle=MaterialBlueGrey800!35!white,
  enhanced
}%%
\newtcolorbox{subproblem}{%
  colback=MaterialBlueGrey800!10!white,
  colframe=white,boxrule=0pt,frame hidden,
  fonttitle=\bfseries,
  enhanced
}%%
\newtcolorbox{correction}{%
  breakable,
  colback=MaterialRed!8!white,
  colframe=white,boxrule=0pt,frame hidden,
  fonttitle=\bfseries,
  colbacktitle=MaterialRed!40!white,
  enhanced
}%%

%%%Title page
\makeatletter
\def\maketitlepage{%
\begingroup
\begin{titlepage}
  \vspace*{2cm}
  \noindent\rule{\textwidth}{0.4pt}
  \begin{center}
    {\Huge \scshape \@title \par}
    \vspace{.3cm}
    \vspace{.3cm}
    {%
      \Large
      By
      \begin{tabular}[t]{c}
        {\scshape \@author}
      \end{tabular}
    }\par
  \end{center}
  \noindent\rule{\textwidth}{0.4pt}
  \vskip 1.5em

  %%%
  \begin{center}
    Before everything,
    \begin{quote}
      \textit{I certify that all solutions are entirely in my own words and that I have not looked at another student's solutions. I have given credit to all external sources I consulted.}
    \end{quote}
    \ifOPT@sign
      \begin{figure}[h!]
        \centering
        \includegraphics{figs/sign_en.pdf}
      \end{figure}
    \fi
    \textsc{Special thanks to \{ $\emptyset$ \} }

    \vspace{2cm}
    \Huge{\circled{1}}

    \vspace*{\fill}
    {\Large At \textsc{(Your School Name)} \par}
    \vspace{2cm}
  \end{center}
\end{titlepage}%
\endgroup
}%
\makeatother

%%TODO
\newcounter{todonum}
\newcommand*{\todo}[1]{%
\begingroup
  \stepcounter{todonum}%
  \bfseries%
  \color{MaterialRed}{[TODO \the\value{todonum}: #1]}%
  \marginpar{\bfseries \color{MaterialRed}{$\Leftarrow$} TODO \the\value{todonum}}
\endgroup
}%%


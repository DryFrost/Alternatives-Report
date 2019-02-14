% init class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ceri}[2016/01/08 Report LaTeX class]
\LoadClass[letterpaper, 12pt, final]{article}	% based on the existing latex class


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% encoding and stuff
\RequirePackage[english,french]{babel}		% language package
%\frenchsetup{AutoSpacePunctuation=false}	% disable space insertion before colon (doesn't work)
%	\RequirePackage{polyglossia}			% alternative to babel for LuaLaTeX
%	\setmainlanguage{french}
\RequirePackage[utf8]{inputenc}				% use source file containing diacritics
\RequirePackage[T1]{fontenc}				% select font encoding and allow hyphenation
\RequirePackage{soul}						% improves hyphenation


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% font settings
%\RequirePackage[babel=true, kerning=true]
%				{microtype}					% typographical refinements >> conflicts with the compiler
\RequirePackage{lmodern}					% uses better fonts (?)
\renewcommand{\familydefault}{\rmdefault}	% use a sans-serif font as in the official template
\renewcommand{\baselinestretch}{1.3}
\RequirePackage{xspace}						% add missing spaces
\RequirePackage{icomma}						% no space inserted after commas in expressions such as 1,23 (French)
\RequirePackage{eurosym}					% euro symbol (€)
\RequirePackage{textcomp}					% degree character (°)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% needed for UAPV title page formating
\RequirePackage{graphicx}					% improves \includegraphics
\sodef\ugg{}{.4em plus 1fill}{1em plus 2 fill}{2em plus 2fill minus.1em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% space-related settings
\RequirePackage[top=2.5cm, 
	bottom=2.5cm, 
    left=2.5cm, 
    right=2.5cm]{geometry}					% changes document margins
\RequirePackage{setspace}					% controls spacing between lines


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% misc
\RequirePackage[french]{varioref} 			% improves cross-refs
\RequirePackage{lipsum}						% inserts filler text
\RequirePackage{xifthen}					% if/then expressions
\RequirePackage{printlen}					% displays lengths
\RequirePackage{xstring}					% handles strings functions
\RequirePackage{titling}					% better control over the title
\RequirePackage{authoraftertitle}			% accesses title and author names
\RequirePackage{datetime}					% custom date format
\RequirePackage{etoolbox}					% test if a macro value is empty


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% header/footer settings
\RequirePackage{lastpage}					% computes the number of pages
\RequirePackage{fancyhdr}					% changes headers and setters
\setlength{\headheight}{18pt}				% increases header size
\newcommand{\setHeaders}{					% macro initializing the headers and footers
	\pagestyle{fancy}
	\fancyhf{}
	\chead{\textcolor{black}{\MyTitle}}
	\rhead{\textcolor{black}{2807 Clark Ave.\\St. Louis, MO 63103\\ 636 555 1234}}
	\cfoot{\textcolor{black}{\thepage\ / \pageref*{LastPage}}}
	\lhead{\includegraphics[width=\textwidth/5]{images/TeamLogo.png}}}
%	\renewcommand{\headrulewidth}{0.4pt}
%	\renewcommand{\footrulewidth}{0.4pt}
	\renewcommand\headrule{					% color and thickness of the header rule
    	{\color{black}\hrule width \hsize}}
	\renewcommand\footrule{					% color and thickness of the header rule
    	{\color{black}\hrule width \hsize} \kern 1mm}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% color settings
\RequirePackage[table]{xcolor}				% defines custom colors
\let\normalcolor\relax						% prevent automatic restoration to black
\definecolor{DarkColor}{gray}{0.75}			% colors used throughout the document
\definecolor{LightColor}{gray}{0.9}
\definecolor{LightGrey}{rgb}{0.96,0.96,0.96}
\definecolor{DarkGrey}{rgb}{0.83,0.83,0.83}
\definecolor{BaseColor}{rgb}{.69,0.77,0.87}
\definecolor{TextColor}{rgb}{0,0,0}
\definecolor{BaseColorORG}{rgb}{1,.56,0}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% watermark settings
\RequirePackage{draftwatermark}				% watermark
\SetWatermarkText{ }
\SetWatermarkScale{1}
\SetWatermarkLightness{0.95}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diagram settings
\RequirePackage{tikz}						% programmatically defines drawings
\usetikzlibrary{arrows}						% configures arrow tips
\usetikzlibrary{arrows.meta}				% necessary to draw graphs
\tikzset{>=latex}							% uses larger default arrow tips
\usetikzlibrary{calc}						% extended coordinate calculation
\usetikzlibrary{decorations.markings}		% improved decorations
\usetikzlibrary{math}						% use mathematical functions
\usetikzlibrary{positioning} 				% ease relative positioning


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hyperlinks settings
\RequirePackage[
	bookmarks=true, bookmarksnumbered=true, bookmarksopen=true,
	unicode=true, colorlinks=true, linktoc=all, %linktoc=page
	linkcolor=TextColor, citecolor=TextColor, filecolor=TextColor, urlcolor=TextColor,
	pdfstartview=FitH, pdfproducer={modèle v3.7.14}
]{hyperref}									% enables hyperlinks
\RequirePackage{url}						% properly displays urls
% deals with problem in PDF properties
\makeatletter
\pdfstringdefDisableCommands{%
  \def\\{}%
  \def\hbox{}%
  \def\mathsurround{}%
  \def\z@{0}%
  \def\@@underline{}%
  \def\textsuperscript#1{}%
  \def\texttt#1{<#1>}%
}
\makeatother
% check this: https://tex.stackexchange.com/questions/306988/automatically-add-texorpdfstring-for-math-mode-in-section-titles


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% table settings
\RequirePackage{multirow}						% cells spanning several rows
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}	% thicker line for the tables
\RequirePackage{tabularx} 						% for larger tables
\RequirePackage{array}							% extends table and array functions
% Macro by A. Kassi 							% don't remember what this is for...
% http://www.ukonline.be/programmation/latex/tutoriel/chapitre4/page2.php
\makeatletter
	\def\hlinewd#1{
	\noalign{\ifnum0=`}\fi\hrule \@height #1
	\futurelet\reserved@a\@xhline}
\makeatother
% end macro
\RequirePackage{csvsimple}						% populates table with file content



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mathematical settings
\RequirePackage{amsmath}						% extended mathematical functions
\RequirePackage{amsthm}							% even more advanced math functions
\RequirePackage{amssymb}  						% additional math symbols
\newtheorem{theorem}{Theorem}					% those are not really needed here, but whatever
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{fact}[theorem]{Fact}
\newtheorem{Hypothesis}[theorem]{Hypothesis}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{definition}[theorem]{Definition}
\newcommand{\sqdiamond}[1][fill=black]{\tikz [x=1.2ex,y=1.85ex,line width=.1ex,line join=round, yshift=-0.285ex] \draw  [#1]  (0,.5) -- (.5,1) -- (1,.5) -- (.5,0) -- (0,.5) -- cycle;}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bibliographic settings
%\RequirePackage[numbers]{natbib}		% incompatible with biblatex
\RequirePackage{doi}					% displays DOIs in the bibliography
\RequirePackage[autostyle]{csquotes}	% don't remember why I put this
\RequirePackage[
	maxcitenames=2,						% two authors max in the text (only for author-year)
	maxbibnames=99,						% list all authors in the reference list
	style=numeric,						% numeric style for reference list
	citestyle=numeric-comp,				% numeric style for citations
%	style=authoryear,					% NOTE: if you want the author-year style instead,
%	citestyle=authoryear-comp,			% uncomment these 2 lines and comment both ones above
%	backref=true,						% includes a page backlink in the reference list
%	dashed=false,						% displays all author names (only for authoryear)
    backend=biber]						% uses biber to compile (instead of bibtex)
{biblatex}								% uses biblatex (instead of bibtex)
%\renewcommand*{\bibfont}				% changes font size for biblio
%		{\footnotesize} 				
\newcommand{\bibName}{Bibliographie}	% define bibliography header
\AtEveryCite{\restorecommand\mkbibnamefamily}	% avoid small caps in citations (French)
\setlength\bibitemsep{0.9\itemsep}		% reduce space between bibliographic items
% command to insert the bibliography
	\newcommand{\MyBibliography}{					% receives the bibtex file
		\newpage
		\phantomsection
		\addcontentsline{toc}{section}{\bibName}	% add the bibliography in the TOC
		{	\setstretch{0.8}
       		\printbibliography
		}
		\thispagestyle{fancy}						% force header/footer
	}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% caption settings
\RequirePackage{caption}					% caption customisation
\captionsetup{
	labelfont={color=TextColor, bf, small},	% font(sf), color, bold, size of the caption label
	textfont={small},						% font(sf) and size of the caption text itself
	labelsep=period,						% separator between label and text
	margin=10mm								% left/right margins
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom floats
\RequirePackage{subfig}						% subfloats (subfigures, subtables...)
\RequirePackage{float}	 					% custom floats environments
%\RequirePackage{tocloft}	 				% list of custom float objects


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom equations
\makeatletter								% change equation numbers
\def\tagform@#1{\maketag@@@{(\color{TextColor}\textbf{#1}\normalcolor)\@@italiccorr}}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom algorithms
\RequirePackage[french,boxed,linesnumbered]	% environment for pseudo code
    	{algorithm2e}
\SetAlCapFnt{\color{TextColor}}				% change caption font (in algorithm floats)


%%%%%%%%%%%%%%%%%%%%%%%%%
% bullet list
%\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\FrenchLabelItem}{\textbullet}	% use bullets even in French
\RequirePackage{enumitem}						% gives more control over lists
\setlist{nolistsep}								% changes spacing between list items


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% macros used to set the document details
\def\major#1{\gdef\MyMajor{#1}}						% name of the class (ex. Licence or Master in CS)
\def\specialization#1{\gdef\MySpecialization{#1}}	% specialization (ex. software engineering vs. computer networks)
\def\course#1{\gdef\MyCourse{#1}}					% class name (Programming, Operating Systems...)
\def\advisor#1{\gdef\MyAdvisor{#1}}					% teacher advising the students (for an internship report, optional)
\def\group#1{\gdef\MyGroup{#1}}						% student group (for a project report)
\def\date#1{\gdef\MyDate{#1}}						% date (optional)
\def\summary#1{\gdef\MySummary{#1}}					% abstract (for a paper)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom section headers
\RequirePackage{titlesec}
\titleformat{\section}
	{\color{TextColor}\normalfont\Large\bfseries}
    {\thesection}
    {1em}
    {}
\titleformat{\subsection}
	{\color{TextColor}\normalfont\large\bfseries}
    {\thesubsection}
    {1em}
    {}
\titleformat{\subsubsection}
	{\color{TextColor}\normalfont\normalsize\bfseries}
    {\thesubsubsection}
    {1em}
    {}
%\setcounter{secnumdepth}{5}			% number subsubsections
%\setcounter{tocdepth}{5}				% and include them in the TOC
\setcounter{secnumdepth}{3}				% number subsubsections
\setcounter{tocdepth}{3}				% and include them in the TOC
% NOTE: only (?) for the report class
%	\RequirePackage{chngcntr}			% defines specific counters
%	\counterwithout{section}{chapter}	% hide the chapter number in section headings


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom listings
\RequirePackage{listings}					% format source code
\RequirePackage{lstlinebgrd}				% change background color
\definecolor{colKeywords}{RGB}{127,  0, 85}
\definecolor{colComments}{RGB}{107,139,171}
\definecolor{colStrings} {RGB}{ 42,  0,255}

\definecolor{bg}   {rgb}{0.97,0.97,0.97}
\definecolor{gray} {rgb}{0.50,0.50,0.50}
\definecolor{mauve}{rgb}{0.58,0.00,0.82}
\lstset{%frame=tb,
	aboveskip=1mm,
	belowskip=1mm,
	showstringspaces=false,
	columns=flexible,
	basicstyle={\small\ttfamily\NoAutoSpacing},
	keywordstyle=\color{colKeywords},
	commentstyle=\color{colComments},
	stringstyle=\color{colStrings},
    backgroundcolor=\color{bg},
%	numbers=left,
	numbers=none,
	numberstyle=\tiny\color{gray},
	breaklines=true,
	breakatwhitespace=true,
	tabsize=3,
    literate=%
		{à}{{\`a}}1
        {À}{{\`A}}1
		{â}{{\^a}}1
        {Â}{{\^A}}1
		{ç}{{\c{c}}}1
        {Ç}{{\c{C}}}1
		{é}{{\'e}}1
        {É}{{\'E}}1
		{è}{{\`e}}1
        {È}{{\`E}}1
		{ë}{{\"e}}1
        {Ë}{{\"E}}1
		{ê}{{\^e}}1
        {Ê}{{\^E}}1
		{ï}{{\"i}}1
        {Ï}{{\"I}}1
		{î}{{\^i}}1
        {Î}{{\^I}}1
		{ö}{{\"o}}1
        {Ö}{{\"O}}1
		{ô}{{\^o}}1
        {Ö}{{\^O}}1
		{ù}{{\`u}}1
        {Ù}{{\`U}}1
		{ü}{{\"u}}1
        {Ü}{{\"U}}1
		{û}{{\^u}}1
        {Û}{{\^U}}1
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% typewriter type environment
\RequirePackage{framed}
\newenvironment{filetext}
{	\setlength{\OuterFrameSep}{0pt}						% no frame around the text
	\setlength{\FrameSep}{1mm}							% just a bit of colored space around the text
	\definecolor{shadecolor}{rgb}{0.80,0.80,0.80}	% background color to display files
	\begin{shaded}\begin{raggedright}\small\ttfamily}
{\end{raggedright}\end{shaded}\par}
\newenvironment{consoletext}
{	\setlength{\OuterFrameSep}{0pt}						% no frame around the text
	\setlength{\FrameSep}{1mm}							% just a bit of colored space around the text
	\definecolor{shadecolor}{RGB}{182, 203, 237}	% background color to display console
	\begin{shaded}\begin{raggedright}\small\ttfamily}
{\end{raggedright}\end{shaded}\par}
% \newcommand{\switchconsole}							% command to switch background color
% {	\end{raggedright}\end{shaded}
% 	\vspace{-0.27cm}
%     \definecolor{shadecolor}{RGB}{182, 203, 237}
%     \begin{shaded}\begin{raggedright}\small\ttfamily
% }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gantt diagrams
% the below part is taken from StackExchange:
	% http://tex.stackexchange.com/questions/175830/how-to-draw-a-vertical-line-at-a-specified-date-in-a-gantt-chart
	\RequirePackage{pgfgantt}		% load the package we are modifying
    \makeatletter
	\@gtt@keydef{anyday}{none}		% some new keys for the style of our "anyday" marker lines
	\@gtt@keydef{anyday offset}{1}
	\@gtt@stylekeydef{anyday rule}{dashed, line width=1pt}
	\@gtt@keydef{anyday label font}{\normalfont}
	\@gtt@stylekeydef{anyday label node}{%
  		anchor=north, font=\ganttvalueof{anyday label font}%
	}
	\newcount\gtt@anyday@slot
	\newcommand\drawverticalline[2]{%
  		\gtt@tsstojulian{#1}{\gtt@anyday@slot}%
  		\gtt@juliantotimeslot{\gtt@anyday@slot}{\gtt@anyday@slot}%
  		\pgfmathsetmacro\y@upper{%
    		\gtt@lasttitleline * \ganttvalueof{y unit title}%
  		}%
  		\pgfmathsetmacro\y@lower{%
    		\gtt@lasttitleline * \ganttvalueof{y unit title}%
      		+ (\gtt@currentline - \gtt@lasttitleline - 1)%
      		* \ganttvalueof{y unit chart}%
  		}%
  		\pgfmathsetmacro\x@mid{%
    		(\gtt@anyday@slot - 1 + \ganttvalueof{anyday offset})%
      		* \ganttvalueof{x unit}%
  		}%
  		\draw [/pgfgantt/anyday rule]
    		(\x@mid pt, \y@upper pt) -- (\x@mid pt, \y@lower pt)
    		node [/pgfgantt/anyday label node] {#2};%
	}
    \makeatother
% custom bars
\RequirePackage[babel=true, kerning=true]{microtype}
\newcommand\ganttbarbis[5]{\ganttbar{#1}{#3}{#4}\ganttbar[inline, bar/.append style={fill=#5}, bar label font=\footnotesize]{#2}{#3}{#4}}
% custom week nimbers
\newcounter{myWeekNum}
\stepcounter{myWeekNum}
\newcommand{\myWeek}{\themyWeekNum
	\stepcounter{myWeekNum}
	\ifnum\themyWeekNum=53
		\setcounter{myWeekNum}{1}
	\else\fi
}
\ganttset{%
calendar week text={s\myWeek{}}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% names of the specialized tables of content
\newcommand{\tocName}{Table of Contents}									% define TOC header
\addto\captionsfrench{\renewcommand{\contentsname}{\tocName}}	% change TOC header
\newcommand{\lofName}{List of Figures}						% define LOF header
%\renewcommand{\listfigurename}{\lofName}						% change LOF header (1)
\addto\captionsfrench{\renewcommand{\listfigurename}{\lofName}}	% change LOF header (2)
\newcommand{\lotName}{List of Tables}							% define LOT header
%\renewcommand{\listtablename}{\lotName}						% change LOT header (1)
\addto\captionsfrench{\renewcommand{\listtablename}{\lotName}}	% change LOT header (2)
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% specialized tables of content
\newcommand{\MyToc}{
	\phantomsection
	\addcontentsline{toc}{section}{\tocName}	% add the TOC in the TOC (yes! for PDF bookmarks)
	\tableofcontents							% insert TOC
	\thispagestyle{fancy}						% force header/footer
	%\addtocontents{toc}{\protect\thispagestyle{empty}}
	%\pagenumbering{gobble}

}
\newcommand{\MyLof}{
	\phantomsection
	\addcontentsline{toc}{section}{\lofName}	% add the LOF in the TOC
	\listoffigures								% insert LOF
	\thispagestyle{fancy}						% force header/footer

}
\newcommand{\MyLot}{
	\phantomsection
	\addcontentsline{toc}{section}{\lotName}	% add the LOT in the TOC
	\listoftables								% insert LOT
	\thispagestyle{fancy}						% force header/footer
	\newpage
}		


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% regular title page
\newcommand{\maketitleZ}{
	% setup PDF doc info
	\hypersetup{
    	pdftitle={\ifdefined\MyTitle \MyTitle \else \fi},
	   	pdfauthor={\ifdefined\MyAuthor \MyAuthor \else \fi},
    	pdfsubject={\ifdefined\MyCourse \MyCourse \else \fi}
	}
	
	% custom headers and footers
	\setHeaders
       
	% draw title page
	\phantomsection 
	%\addcontentsline{toc}{section}{Title}	% add the title page in the TOC (yes! for PDF bookmark)
	\begin{titlepage}
		\begin{tikzpicture}[remember picture,overlay]
			% vertical lines
	    	\node at (current page.south west)
			{	\begin{tikzpicture}[remember picture,overlay]
					\fill[fill=LightGrey]  (0cm,21.2cm) rectangle(21cm,29.7cm);
					\fill[fill=DarkGrey] (0cm,0cm) rectangle(21cm,21.2cm);
					\fill[fill=BaseColor] (1cm,0cm) rectangle(5.2cm,21.2cm);
					\pgftext[x=1cm,y=21.4cm,bottom,left]{\includegraphics[width=4.2cm]{images/TeamLogo.png}};
					\pgftext[x=5.5cm,y=20.5cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{19}{19}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{\textbf{Prepared for}}}}};
					\pgftext[x=5.5cm,y=20cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{19}{19}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{Kiewit Power}}}};
					\pgftext[x=5.5cm,y=19cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{19}{19}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{\textbf{Prepared By}}}}};
					\pgftext[x=5.5cm,y=18.3cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{19}{19}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{TechnologyBin, LLC}}}};
					\ifdefined\MyMajor \pgftext[x=5.5cm,y=18.2cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{\MyMajor}}}}; \else\fi
					\ifdefined\MySpecialization \pgftext[x=5.5cm,y=17.7cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{\MySpecialization}}}}; \else\fi
					\ifdefined\MyCourse \pgftext[x=5.5cm,y=17.2cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{UE} \MyCourse}}}; \else\fi
					\pgftext[x=3.5cm,y=16.5cm,top,left]{\scalebox{0.77}[1]{\fontsize{30}{30}{\fontfamily{phv}\selectfont{}\textbf{\textcolor{white}{>{}>{}>}\hspace{0.7cm}\textcolor{TextColor}{\parbox[t]{19cm}{\raggedright\MyTitle}}}}}};
					\pgftext[x=3.5cm,y=10.2cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{30}{30}{\fontfamily{phv}\selectfont{}\textbf{\textcolor{white}{>{}>{}>}\hspace{0.7cm}\textcolor{TextColor}{\parbox[t]{19cm}{\raggedright Shelby County Combined Cycle Power Plant }}}}}};
					\pgftext[x=5.5cm,y=12.0cm,top,left]{\scalebox{0.77}[1]{\fontsize{20}{20}{\fontfamily{phv}\selectfont{}\textcolor{BaseColor}{\begin{minipage}{19cm}\MyAuthor\end{minipage}}}}};
					\ifdefined\MyAdvisor \pgftext[x=5.5cm,y=3.0cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}{\begin{minipage}{19cm}\textbf{Prepared By} \\\MyAdvisor\end{minipage}}}}}; \else\fi
					\pgftext[x=9.5cm,y=5.5cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{14}{14}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{St. Louis Office}}}};
					\pgftext[x=9.5cm,y=5.0cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{14}{14}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{2807 Clark Ave.}}}};
					\pgftext[x=9.5cm,y=4.5cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{14}{14}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{St. Louis, MO}}}};
					\pgftext[x=9.5cm,y=4.0cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{14}{14}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{63103}}}};
					\pgftext[x=9.5cm,y=3.6cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{14}{14}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{United States of America}}}};
					\pgftext[x=9.5cm,y=2.9cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{14}{14}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{Tel. +1 (636) 555 1234}}}};
					\pgftext[x=9.5cm,y=2.4cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{14}{14}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{Fax +1 (636) 555 1235}}}};
					\pgftext[x=9.5cm,y=1.8cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{14}{14}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{http://technologybin.com}}}};                        
				\end{tikzpicture}
			};
		\end{tikzpicture}
	\end{titlepage}

	%\setcounter{page}{1} 	% set the second page... to number 2
	\thispagestyle{fancy}	% force header/footer
	\newpage
		
	% insert abstract
	\ifdefined\MySummary
		\phantomsection
		\addcontentsline{toc}{section}{\abstractname}	% add the abstract in the TOC
		\noindent \textbf{\huge \abstractname}
           
		\vspace{1cm}
		\MySummary
		\newpage
	\else\fi
        
	% insert ToC
	\pagenumbering{roman}
	\MyToc
	\MyLof
	\MyLot
}
\renewcommand{\maketitle}{\maketitleZ}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handles the "light" option
\DeclareOption{light}{%
	\SetWatermarkText{BROUILLON}

	\renewcommand{\maketitle}{
		% setup PDF doc info
		\hypersetup{
    		pdftitle={\ifdefined\MyTitle \MyTitle \else \fi},
	    	pdfauthor={\ifdefined\MyAuthor \MyAuthor \else \fi},
    		pdfsubject={\ifdefined\MyCourse \MyCourse \else \fi}
		}
			
		% custom headers and footers
		\pagestyle{fancy}
		\fancyhf{}
		\renewcommand{\headrulewidth}{0.4pt}
		\renewcommand{\footrulewidth}{0.4pt}
		\cfoot{\thepage\ / \pageref*{LastPage}} 
		\chead{\MyTitle} 

		% first page style
		\fancypagestyle{firststyle}
		{	\fancyhf{}
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{0.4pt}
			\cfoot{\thepage\ / \pageref*{LastPage}} 
		}
			
		% draw title page
		\phantomsection 
		\addcontentsline{toc}{section}{Titre}	% add the title page in the TOC (yes! for PDF bookmark)
		\begin{center}
           	% title
			\Huge{\textbf{\textcolor{TextColor}{\MyTitle}}} \\
			% authors
			\Large{\MyAuthor} \\
			% group
			\ifdefined\MyGroup 
				\normalsize{\MyGroup} \\
			\else\fi
			% major and specialization
            \ifdefined\MyMajor
				\normalsize{\textbf{\MyMajor}}
				\ifdefined\MySpecialization
					\normalsize{ -- }
				\else
					\\
				\fi
			\else\fi
			\ifdefined\MySpecialization
            	\normalsize{\textbf{\MySpecialization}} \\
            \else\fi
			% course
			\ifdefined\MyCourse
				\normalsize{\textbf{UE} \MyCourse} \\
			\else\fi
			% advisor
			\ifdefined\MyAdvisor
				{\small{\textbf{Prepared By :} \\ \MyAdvisor}} \\
			\else\fi
			% date
			\ifdefined\MyDate
				\ifdefempty{\MyDate}{\small{\today} \\}{\small{\MyDate} \\}
			\else
				{\small{\today}} \\
			\fi
            % abstract
            \ifdefined\MySummary
            	\phantomsection
                \addcontentsline{toc}{section}{\abstractname}	% add the abstract in the TOC
                \parbox[c][][s]{0.75\textwidth}{\footnotesize \vspace{0.5cm} \noindent \textbf{\abstractname.} \MySummary}
			\else\fi
		\end{center}	
	
		\setcounter{page}{1} 		% set the second page... to number 2
		\thispagestyle{firststyle}	% force header/footer
	}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handles the "full" option
\DeclareOption{full}{%
	\renewcommand{\maketitle}
	{	\maketitleZ
    	% Insert list of figures
		\MyLof
		% Insert list of tables
		\MyLot
	}
}
\ProcessOptions



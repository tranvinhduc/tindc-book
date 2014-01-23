% modifié le 2 février 2009 par D. Lantiat pour AESM
%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Classes/aesm_edspia}
%-------------------------- initial code -----------------------

%Style BOOK:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips, a4paper]{book}
\else   \LoadClass[pdftex, a4paper]{book}
\fi

%Packages à charger
\usepackage{amssymb}
\usepackage{graphics}
\usepackage{fancyhdr} % en-tete et pieds de page
\usepackage{eucal}
\usepackage[usenames, dvipsnames]{xcolor}
\usepackage[numbers,sort&compress]{natbib}
\usepackage{hypernat}
\usepackage{ifpdf}
\usepackage{ifthen}
\RequirePackage{calc}
\RequirePackage{float}

%Bibliographie
\renewcommand{\bibname}{Bibliographie}

% Nomenclature
%\usepackage[french]{nomencl}
%\makenomenclature

\newif \ifpdf
    \ifx \pdfoutput \undefined
        % for running latex
        \pdffalse
    \else
        % for running pdflatex
        \pdfoutput = 1    
                          
        \pdftrue
\fi
\ifpdf
 \usepackage[pdftex]{graphicx}
%\definecolor{bibcolor}{rgb}{0.02,0.75,0.06}
\usepackage[pdftex, pdfauthor={David Lantiat}, plainpages = false,
								 pdfpagelabels= true, 
                 pdfpagelayout = SinglePage,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref = true, % pour effacer les rappels de pages dans la biblio (utile dans la version papier).  
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = blue,
                 anchorcolor = blue,
                 hyperindex = true,
                 hyperfootnotes=false,
                 hyperfigures
                 ]{hyperref} 

    \DeclareGraphicsExtensions{.png, .jpg, .pdf}
     \pdfcompresslevel=9
  \else
    \usepackage[ps4pdf,plainpages = false, pdfpagelabels, bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = magenta,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}


    \DeclareGraphicsExtensions{.eps, .ps}
    \usepackage{epsfig}
    \usepackage{graphicx}
  \fi

%Paramètres A4 
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm} 
   \setlength{\paperwidth}{210mm} 
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

\setlength{\evensidemargin}{0cm} 
\setlength{\oddsidemargin}{0mm} % 15 mm par def.  
\setlength{\topmargin}{1mm}
\setlength{\headheight}{0cm} % 1 cm par défaut
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{22cm}
\setlength{\textwidth}{17cm} % 16 cm par déf.
\setlength{\marginparsep}{0cm} % 1mm par def.
\setlength{\marginparwidth}{0cm}
\setlength{\headheight}{2\baselineskip} 
\setlength{\footskip}{2.36cm}

%En tete et pied de page
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\chaptername~\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thechapter.\thesection~ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[RO]{\thepage}
\fancyfoot[LE]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

% DECLARATIONS

\def\degreedate#1{\gdef\@degreedate{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\collegeordept#1{\gdef\@collegeordept{#1}}
\def\university#1{\gdef\@university{#1}}
\def\crest#1{\gdef\@crest{#1}}


\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% Dedicace

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}


% Remerciements

\newenvironment{acknowledgements}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{flushleft}
\vspace*{1.5cm}
{\Huge \bfseries Remerciements}
\end{flushleft}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

%Résumé

\newenvironment{resume} {\begin{alwayssingle} \pagestyle{empty}
  \begin{flushleft}
  \vspace*{1.5cm}
  {\Large \bfseries  Résumé}
  \end{flushleft}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{flushleft}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{flushleft}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}


%ROMANPAGES

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}


\newcommand{\PRESENTATION}{Pour l'obtention du grade de}
\newcommand{\COMPU}{MILIEUX DENSES, MATERIAUX ET COMPOSANTS}

\newcommand{\PRESn}{M. xxxxx}
\newcommand{\PRESp}{xxxxxxxx, Univ.}
\newcommand{\PRESq}{Président}

\newcommand{\INVAn}{Inv Nom}
\newcommand{\INVAp}{xxxxxxx, Univ.}
\newcommand{\INVAq}{Invité}

\newcommand{\RAPAn}{M.}
\newcommand{\RAPAp}{xxxxxxx}
\newcommand{\RAPAq}{rapporteur A}

\newcommand{\RAPBn}{RappB}
\newcommand{\RAPBp}{xxxxxxxx}
\newcommand{\RAPBq}{rapporteur B}

\newcommand{\EXAAn}{M.}
\newcommand{\EXAAp}{xxxxxxxx}
\newcommand{\EXAAq}{examinateur}

\newcommand{\EXABn}{M.}
\newcommand{\EXABp}{xxxxxxxxxx}
\newcommand{\EXABq}{examinateur}

\newcommand{\EXACn}{M.}
\newcommand{\EXACp}{xxxxxxxxxx}
\newcommand{\EXACq}{examinateur}

\newcommand{\DATE}{}


\newcommand{\JURY}{
\textbf{\large{\textbf{JURY}}}\\[\baselineskip]
\begin{tabular}{l@{\protect\hspace{0.5cm}}l@{\protect\hspace{0.5cm}}l}
%\textbf{\large{\textbf{Composition du jury :}}}
\RAPAn &\RAPAp &\RAPAq\\
\RAPBn &\RAPBp &\RAPBq\\
\EXAAn &\EXAAp &\EXAAq\\
\PRESn &\PRESp &\PRESq\\
\EXABn &\EXABp &\EXABq\\
%\EXACn &\EXACp &\EXACq\\
%\INVAn &\INVAp &\INVAq\\
\end{tabular}
}

\newcommand{\makethese}{

%\begin{minipage}[c]{15cm}
\addtolength{\hoffset}{-0.5cm}
%\addtolength{\textwidth}{0.6cm} 
\thispagestyle{empty}
\baselineskip=13pt
\vspace*{-4cm}
\begin{tabular}{l@{\protect\hspace{4cm}}c@{\protect\hspace{4cm}}r}
\includegraphics[scale=0.15]{CNRS.png} &
\includegraphics[scale=0.6]{Logo_Phymat_quadri.png} &
\includegraphics[scale=0.4]{logo_SFA.png} 
\end{tabular}
\begin{center}
\hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}\setlength{\baselineskip}{13pt}~\\
{\Large{\textbf{THÈSE}}}\\[\baselineskip]
      \PRESENTATION\\[\baselineskip]
{\Large{\textbf{DOCTEUR DE L'UNIVERSITE DE POITIERS}}}\\[\baselineskip]
      Faculté des Sciences Fondamentales et Appliquées\\[\baselineskip]
      Diplôme National - Arrêté du 7 ao\^{u}t 2006\\[\baselineskip]
      ÉCOLE DOCTORALE SCIENCES POUR L'INGENIEUR \& AERONAUTIQUE\\[\baselineskip]
			DOMAINE DE RECHERCHE~: \COMPU\\[\baselineskip]
      Présentée par~\\[\baselineskip]
      \baselineskip=20pt
{\LARGE{\textbf{Prénom Nom}}}\\[\baselineskip]
			\hbox{\raisebox{0.2em}{\vrule depth 0pt height 3.5pt width 17cm}}
			\setlength{\baselineskip}{4pt}
			\hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}\setlength{\baselineskip}{10pt}~\\
			\vspace*{-26pt}
		 	{\Large\textbf{\begin{spacing}{1}Titre de la thèse\end{spacing}}}~\\[\baselineskip]
	  	\hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}~\\
     	Directeur de thèse : \textbf{M. xxxxx}\\[\baselineskip]
     	Co-direction : \textbf{M. xxxxx, Mme xxxxx}\\[\baselineskip]
      Soutenue le xx xxxxx xxxx\DATE\\
      Devant la Commission d'Examen\\[\baselineskip]~\\[\baselineskip] 
           
            \JURY
\end{center}
          
           } 
     


% Date de soutenance
\newcommand{\datesout}[1]{%
\renewcommand{\DATE}{#1}%
}

% Equipe et composante universitaire
\newcommand{\Equipe}[2]{%
\renewcommand{\COMPU}{\textsc{#2}}%
}

% Nom profession Qualite du president du jury
\newcommand{\President}[3]{%
\renewcommand{\PRESn}{#1}%
\renewcommand{\PRESp}{#2}%
\renewcommand{\PRESq}{#3}%
}

% Nom Profession Qualité de l'invité
\newcommand{\Invite}[3]{%
\renewcommand{\INVAn}{#1}%
\renewcommand{\INVAp}{#2}%
\renewcommand{\INVAq}{#3}%
}

% Nom Profession Qualite d'un rapporteur A
\newcommand{\RapporteurA}[3]{%
\renewcommand{\RAPAn}{#1}%
\renewcommand{\RAPAp}{#2}%
\renewcommand{\RAPAq}{#3}%
}
% Nom Profession Qualite d'un rapporteur B
\newcommand{\RapporteurB}[3]{%
\renewcommand{\RAPBn}{#1}%
\renewcommand{\RAPBp}{#2}%
\renewcommand{\RAPBq}{#3}%
}

%Prenom Nom Qualite d'un examinateur A
\newcommand{\ExaminateurA}[3]{%
\renewcommand{\EXAAn}{#1}%
\renewcommand{\EXAAp}{#2}%
\renewcommand{\EXAAq}{#3}%
}
%Prenom Nom Qualite d'un examinateur B
\newcommand{\ExaminateurB}[3]{%
\renewcommand{\EXABn}{#1}%
\renewcommand{\EXABp}{#2}%
\renewcommand{\EXABq}{#3}%
}

%Prenom Nom Qualite d'un examinateur C
\newcommand{\ExaminateurC}[3]{%
\renewcommand{\EXACn}{#1}%
\renewcommand{\EXACp}{#2}%
\renewcommand{\EXACq}{#3}%
}


\newcommand{\alignquatriemedecouv}{
\newpage\thispagestyle{empty}~
\ifodd\value{page}
\newpage\thispagestyle{empty}
\else
\newpage\thispagestyle{empty}~\newpage\thispagestyle{empty}
\fi
}

\AtBeginDocument{%
%\floatstyle{plain}
%\newfloat{algorithm}{t}{algs}[chapter]
%\floatname{algorithm}{\textsc{Alg}}
%\floatplacement{algorithm}{tbp}
%\makeindex
\def\uppercase{}
}
\AtEndDocument{%
}



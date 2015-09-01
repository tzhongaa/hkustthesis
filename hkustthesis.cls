\ProvidesClass{hkustthesis}
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[12pt]{report}
\RequirePackage[a4paper,margin=25mm]{geometry}
\RequirePackage[us]{datetime}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage[T1]{fontenc}
\RequirePackage[ocgcolorlinks,
                linktocpage, % avoid long titles in table of contents
                colorlinks,
                linkcolor=blue,
                citecolor=blue,
                urlcolor=blue]{hyperref}
\RequirePackage{enumitem}
\RequirePackage{multirow}
\RequirePackage{amsmath,amsthm,amssymb}
\RequirePackage{graphicx}
\RequirePackage[justification=raggedright]{subcaption}
\RequirePackage[justification=raggedright]{caption}

%  ----  Paragraph style  ---------------------------
\linespread{1.4} % one-and-a-half spacing
\setlength{\parindent}{0em}
\setlength{\parskip}{1.4em}
\setlength{\tabcolsep}{1em}
\setlength{\jot}{1em}

%  ----  List style  --------------------------------
\setitemize{nosep, before={\vspace*{-0.5\parskip}}}
\setenumerate{nosep, before={\vspace*{-0.5\parskip}}}
\setdescription{
    topsep=0em,
    leftmargin=0em,
    before={\vspace*{-0.5\parskip}}
}

%  ----  Title style  -------------------------------
\titleformat{\chapter}[display]{\Large\bf}
    {\chaptertitlename\ \thechapter}{1em}{}
\titleformat{\section}{\large\bf}{\thesection}{1em}{}
\titleformat{\subsection}{\bf}{\thesubsection}{1em}{}
\titlespacing{\chapter}{0em}{1.5\baselineskip}{2em}

\let\oldchapter\chapter
\renewcommand*{\chapter}{\cleardoublepage\oldchapter}
\newcommand{\extrachapter}[1]{
    \cleardoublepage\phantomsection
    \addcontentsline{toc}{chapter}{{#1}}
}

%  ----  Table of contents style  -------------------
\renewcommand\contentsname{Table of Contents}
\titlecontents{chapter}[0em]
    {\addvspace{0.3\baselineskip}}
    {\@chapapp\ \thecontentslabel\quad}{}
    {\titlerule*[1pc]{.}\contentspage}
\g@addto@macro{\appendix}{\addtocontents{toc}
    {\protect\renewcommand{\protect\@chapapp}{\appendixname}}}

%  ----  Front matters  ------------------------------
% required options to generate front matters
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\degreeabbr}[1]{\gdef\@degreeabbr{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\head}[1]{\gdef\@head{#1}}
\newcommand{\acknowledgments}[1]{\gdef\@acknowledgments{#1}}
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}

\newcommand{\heading}[1]{\vspace*{1.5\baselineskip}{\Large\bf{#1}}}
\newcommand{\signature}[1]{\line(1,0){280}\\ {#1}}
\newdateformat{monthyeardate}{\monthname[\THEMONTH] \THEYEAR}
\newdateformat{completedate}{\THEDAY\ \monthname[\THEMONTH] \THEYEAR}

% front matters
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \titlepage
    \pagenumbering{roman}
    \authorizationpage
    \signaturepage
    \acknowledgmentspage
    \tableofcontentspage
    \listoffigurespage
    \listoftablespage
    \abstractpage
    \cleardoublepage
    \pagenumbering{arabic}
}
\renewcommand{\titlepage}{
    \extrachapter{Title Page}
    \begin{center}
        \heading{\@title}
        \par\vspace*{5.0\baselineskip}by
        \par\vspace*{1.0\baselineskip}{\bf \@author}
        \par\vspace*{5.0\baselineskip}
        A Thesis Submitted to \\
        The Hong Kong University of Science and Technology \\
        in Partial Fulfillment of the Requirements for \\
        the Degree of \@degree \\
        in \@department
        \par\vspace*{3.0\baselineskip}
        \monthyeardate\@date, Hong Kong
    \end{center}
}
\newcommand{\authorizationpage}{
    \extrachapter{Authorization Page}
    \begin{center}
        \heading{Authorization}
    \end{center}
    \par\vspace*{1.0\baselineskip}
    I hereby declare that I am the sole author of the thesis.
    \par\vspace*{1.0\baselineskip}
    I authorize the Hong Kong University of Science and Technology to
    lend this thesis to other institutions or individuals for the
    purpose of scholarly research.
    \par\vspace*{1.0\baselineskip}
    I further authorize the Hong Kong University of Science and
    Technology to reproduce the thesis by photocopying or by other
    means, in total or in part, at the request of other institutions
    or individuals for the purpose of scholarly research.
    \par\vspace*{3.0\baselineskip}
    \begin{center}
        \signature{\@author}
        \par\vspace*{1.0\baselineskip}
        \completedate\@date
    \end{center}
}
\newcommand{\signaturepage}{
    \extrachapter{Signature Page}
    \begin{center}
        \heading{\@title}
        \par\vspace*{1.0\baselineskip}by
        \par\@author
        \par\vspace*{1.0\baselineskip}
        This is to certify that I have examined the above
        \@degreeabbr\ thesis \\
        and have found that it is complete and satisfactory in all
        respects, \\
        and that any and all revisions required by \\
        the thesis examination committee have been made.
        \par\vspace*{3.0\baselineskip}\signature{\@supervisor,
        Supervisor}
        \par\vspace*{3.0\baselineskip}\signature{\@head}
        \par\vspace*{1.0\baselineskip}\@department
        \par\completedate\@date
    \end{center}
}
\newcommand{\acknowledgmentspage}{
    \extrachapter{Acknowledgments}
    \begin{center}
        \heading{Acknowledgment}
    \end{center}
    \par\vspace*{1.0\baselineskip}\@acknowledgments
}
\newcommand{\tableofcontentspage}{
    \extrachapter{Table of Contents}
    \tableofcontents
}
\newcommand{\listoffigurespage}{
    \extrachapter{List of Figures}
    \listoffigures
}
\newcommand{\listoftablespage}{
    \extrachapter{List of Tables}
    \listoftables
}
\newcommand{\abstractpage}{
    \extrachapter{Abstract}
    \begin{center}
        \setlength{\parskip}{1.0em}
        \heading{\@title}
        \par by \@author
        \par \@department
        \par The Hong Kong University of Science and Technology
        \par Abstract
    \end{center}
    \@abstract
}

%  ----  Back matters  -------------------------------
\let\oldbibliographystyle\bibliographystyle
\let\oldbibliography\bibliography
\renewcommand{\bibliographystyle}[1]{\gdef\@bibliographystyle{#1}}
\renewcommand{\bibliography}[1]{
    \extrachapter{\bibname}
    \oldbibliographystyle{\@bibliographystyle}
    \oldbibliography{#1}
}
\bibliographystyle{ieeetr} % default

% vim: set ft=tex ff=unix tw=70:

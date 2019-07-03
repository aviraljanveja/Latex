\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_cv}[My custom CV class]
\LoadClass{article}
% So what has happened here? Class files need to contain a lot of formatting information and internal setup to make LaTeX work properly, but we don't want to have to enter it all manually. Instead we can base our new class file on article.cls. We use \LoadClass to include article.cls and load all of the commands and styles defined in it. Note that we don't use the usual \documentclass command to include article.cls because \documentclass should only ever be called once at the very beginning of your LaTeX document.
\RequirePackage{titlesec}
% Notice that we should use \RequirePackage rather than the usual \usepackage command because we are in a class file. The \RequirePackage command makes sure that each package is only loaded once, even if called multiple times from different style and class files.
% The titlesec package provides the command \titleformat which lets us customise our section headings.
\titleformat{\section}{\LARGE\scshape\bfseries\raggedright}{}{0em}{}[\titlerule]
%  Customise the \section command. 
%  Make the \section headers large (\Large).
% small capitals (\scshape) and left aligned (\raggedright)
%  Can be used to give a prefix to all sections, like 'Section ...'
% Can be used to insert code before the heading
% Inserts a horizontal line after the heading

\titleformat{\subsection}{\large\bfseries\raggedright}{}{0em}{}
% You should try out some of the formatting options available to see what you like:
% \bfseries, \itshape: make the heading bold or italic;
% \scshape: Whole word as small capitals;
% \small, \normalsize, \large, \Large, \LARGE, \huge, \Huge: set the font size;
% \rmfamily, \sffamily, \ttfamily: set the font type to serifed, sans serifed or typewriter respectively.
\newcommand{\datedsection}[2]{% 
    \section[#1] {#1 \hfill #2}%
    }
\newcommand{\datedsubsection}[2]{% 
    \subsection[#1] {#1 \hfill #2}%
    }

% This defines two new commands \datedsection and \datedsubsection which take two arguments: the section name as before, and a date which will be typeset on the right-hand side of the page. The \hfill command tells LaTeX to fill as much space as possible and so pushes the second argument (#2) to the right of the page. Modify cv.tex to use these commands:
% The #1 and #2 refer to the first and second argument or parameter that are being passed into the command. In the first line of a \newcommand, the section in brackets e.g. [2] refers to the number of parameters being passed in to the function. The function can then call these parameters by using #1, #2, and so on, depending on how many parameters were required by the function.
\newcommand{\name}[1]{%
    \centerline{\Huge{#1}}
    }
% This produces a centered, large font name wherever it is used.

\newcommand{\contact}[5]{%
   \centerline{%
        \makebox[0pt][c]{%
            #1 {\Large\textperiodcentered} #2 {\Large \textperiodcentered} #3 {\Large\textperiodcentered}
            #4 {\Large\textperiodcentered} #5%
            }%
        }%    
    }
    
%\newcommand{\longcontact}[5]{%
%    \noindent
%    #1\hfill {\large\textperiodcentered}\hfill #2\hfill
%    {\large\textperiodcentered}\hfill #3\\
%    #4\hfill #5%
%}
% This looks a bit strange with the short information, but if an address is particularly long, it is more flexible to use. 
% This is the main point of using class files. Allowing for minimal changes in the content of the document, and controlling the presentation (how the content is shown) externally.

\newcommand{\items}[4]{%
    \begin{itemize}
        \item #1 {\hfill #4}
        \item #2
        \item #3
    \end{itemize}%
    }
\newcommand{\projectitems}[2]{%
    \begin{itemize}
        \item #1
        \item #2
    \end{itemize}%
}
% A CV should have more than just a listing of jobs. Some description of what was done in the jobs should be added under each item. 3 bullet points per job is a good balance of detail and description. This can easily be adjusted by adding or removing nodes.
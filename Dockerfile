FROM danysk/docker-manjaro-texlive-base:201.20240323.0216
RUN yay-install tectonic-bin
RUN yay-install texlive-bin texlive-most texlive-lang texlive-science texlive-pictures texlive-langitalian
RUN yay-install man-db
RUN yay-install git-latexdiff
CMD [ "pdflatex", "--version" ]

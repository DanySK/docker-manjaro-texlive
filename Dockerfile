FROM danysk/docker-manjaro-texlive-base:13.20210930.1745
RUN yay-install tectonic-bin
RUN yay-install texlive-bin texlive-most texlive-lang
RUN yay-install man-db
RUN yay-install git-latexdiff
CMD [ "pdflatex", "--version" ]

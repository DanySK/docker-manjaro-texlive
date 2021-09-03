FROM danysk/docker-manjaro-texlive-base:7.20210903.1627
RUN yay-install tectonic-bin
RUN yay-install texlive-bin texlive-most texlive-lang
RUN yay-install man-db
RUN yay-install git-latexdiff
CMD [ "pdflatex", "--version" ]

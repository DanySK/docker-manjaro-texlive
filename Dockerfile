FROM danysk/docker-manjaro-texlive-base:17.20211005.0837
RUN yay-install tectonic-bin
RUN yay-install texlive-bin texlive-most texlive-lang texlive-science texlive-pictures
RUN yay-install man-db
RUN yay-install git-latexdiff
CMD [ "pdflatex", "--version" ]

FROM danysk/docker-manjaro-texlive-base:86.20220908.0657
RUN yay-install tectonic-bin
RUN yay-install texlive-bin texlive-most texlive-lang texlive-science texlive-pictures
RUN yay-install man-db
RUN yay-install git-latexdiff
CMD [ "pdflatex", "--version" ]

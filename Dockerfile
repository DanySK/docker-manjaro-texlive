FROM danysk/docker-manjaro-linux-with-yay:43.20210831.1355
RUN yay-install tectonic-bin
RUN yay-install texlive-bin texlive-most texlive-lang
RUN yay-install man-db
RUN yay-install git-latexdiff
CMD [ "pdflatex", "--version" ]

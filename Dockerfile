FROM danysk/manjaro-with-zsh:335.20250814.2105
USER build
RUN paru -Sy\
    biber\
    ghostscript\
    graphviz\
    python-pygments\
    rubber\
    tectonic\
    $(paru -Ssq 'texlive-*')\
    --noconfirm
RUN paru -Sccd --noconfirm
USER root
RUN paccache -rk 0
RUN which pdflatex
ENV PATH="${PATH}:/usr/bin/vendor_perl/"
ENTRYPOINT [ "/bin/zsh", "-c" ]
CMD [ "latexmk" ]

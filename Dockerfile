FROM danysk/manjaro-with-zsh:338.20250826.0113 as base
USER build
RUN paru -Sy\
    biber\
    ghostscript\
    graphviz\
    python-pygments\
    rubber\
    tectonic\
    which\
    $(paru -Ssq 'texlive-*')\
    --noconfirm
RUN paru -Sccd --noconfirm
USER root
RUN paccache -rk 0
RUN rm -rf /var/cache

FROM danysk/manjaro-with-zsh:338.20250826.0113
COPY --from=base /etc /etc
COPY --from=base /usr /usr
COPY --from=base /var /var
RUN which pdflatex
ENV PATH="${PATH}:/usr/bin/vendor_perl/"
ENTRYPOINT [ "/bin/zsh", "-c" ]
CMD [ "latexmk" ]

ARG MANJARO_WITH_ZSH_TAG=346.20260622.0612
ARG MANJARO_WITH_ZSH_DIGEST=sha256:9f1a49a45eb8ca76c38f49987a26d1309daae0788c028cabd419f2aa3076e527

FROM danysk/manjaro-with-zsh:${MANJARO_WITH_ZSH_TAG}@${MANJARO_WITH_ZSH_DIGEST} AS base
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

FROM danysk/manjaro-with-zsh:${MANJARO_WITH_ZSH_TAG}@${MANJARO_WITH_ZSH_DIGEST}
COPY --from=base /etc /etc
COPY --from=base /usr /usr
COPY --from=base /var /var
RUN which pdflatex
ENV PATH="${PATH}:/usr/bin/vendor_perl/"
ENTRYPOINT [ "/bin/zsh", "-c" ]
CMD [ "latexmk" ]

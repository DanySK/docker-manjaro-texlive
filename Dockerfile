ARG MANJARO_WITH_ZSH_TAG=343.20260427.1034
ARG MANJARO_WITH_ZSH_DIGEST=sha256:8090ab80f32f83618bf9125d8e4e88aa37ccfee3c854b05253e10fa785b7eff3

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

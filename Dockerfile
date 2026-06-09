ARG MANJARO_WITH_ZSH_TAG=344.20260606.0110
ARG MANJARO_WITH_ZSH_DIGEST=sha256:c01a70da84331b27e56d02979c0504af0bd9d60f8c39a818bcab1cb06dbb4426

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

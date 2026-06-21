ARG MANJARO_WITH_ZSH_TAG=345.20260618.1947
ARG MANJARO_WITH_ZSH_DIGEST=sha256:5b9414ad7d9c05e05329b996b4d8f9be3863eb5c579772575dc37a913416b033

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

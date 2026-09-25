ARG MANJARO_WITH_ZSH_TAG=349.20260922.0552
ARG MANJARO_WITH_ZSH_DIGEST=sha256:016ed79dedda8098921f6d71437550cdde3c510a0bc5280c34411081be3b298f

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

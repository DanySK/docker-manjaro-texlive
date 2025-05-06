FROM danysk/manjaro-with-zsh:328.20250503.0910
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
#RUN ruby -pi -e "gsub('\$Master = \"\$Master/../..\"', '\$Master = \"\${Master}/../../..\"')" "/usr/share/texmf-dist/scripts/texlive/tlmgr.pl"
#RUN echo -e '#!/bin/sh\n/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode "$@"' > /usr/bin/tlmgr
#RUN chmod +x /usr/bin/tlmgr
#RUN tlmgr init-usertree
#RUN tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet
ENV PATH="${PATH}:/usr/bin/vendor_perl/"
ENTRYPOINT [ "/bin/zsh", "-c" ]
CMD [ "latexmk" ]

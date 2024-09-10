FROM danysk/docker-manjaro-with-zsh:283.20240907.1021
RUN pamac update --no-confirm
RUN pamac upgrade --no-confirm
RUN pamac install --no-confirm\
    biber\
    ghostscript\
    graphviz\
    minted\
    rubber\
    ruby\
    tectonic\
    texlive*
RUN paccache -rk 0
RUN pamac clean -b
#RUN ruby -pi -e "gsub('\$Master = \"\$Master/../..\"', '\$Master = \"\${Master}/../../..\"')" "/usr/share/texmf-dist/scripts/texlive/tlmgr.pl"
#RUN echo -e '#!/bin/sh\n/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode "$@"' > /usr/bin/tlmgr
#RUN chmod +x /usr/bin/tlmgr
#RUN tlmgr init-usertree
#RUN tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet
ENV PATH="${PATH}:/usr/bin/vendor_perl/"
ENTRYPOINT [ "/bin/zsh", "-c" ]
CMD [ "latexmk" ]

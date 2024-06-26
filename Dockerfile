FROM danysk/docker-manjaro-texlive-base:218.20240629.1058
RUN pamac update --no-confirm
RUN pamac upgrade --no-confirm
RUN pamac install --no-confirm texlive* tectonic man-db git-latexdiff
RUN paccache -rk 0
RUN pamac clean -b
ENTRYPOINT [ "/bin/zsh", "-c" ]
CMD [ "latexmk" ]

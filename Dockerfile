FROM danysk/docker-manjaro-texlive-base:210.20240611.1112
RUN pamac update --no-confirm
RUN pamac upgrade --no-confirm
RUN pamac install --no-confirm texlive* tectonic man-db git-latexdiff
RUN paccache -rk 0
RUN pamac clean -b
ENTRYPOINT [ "/bin/zsh", "-c" ]
CMD [ "latexmk" ]

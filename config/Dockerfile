FROM alpine:edge AS builder_entrykit
RUN apk --update add curl jq && rm -rf /var/cache/apk/*
WORKDIR /tmp
# entrykit
RUN export CMD='entrykit'
RUN export REPO='progrium/entrykit'
RUN export ARCH='Linux_x86_64'
RUN export DLURL=$(curl -sL https://api.github.com/repos/$REPO/releases/latest | jq -r '.assets[].browser_download_url'| grep $ARCH)
RUN curl -Lo $CMD.tgz $DLURL
RUN tar -xvzf $CMD.tgz
RUN chmod +x $CMD
RUN unset REPO ARCH DLURL
#------------------------------------------------------------
FROM alpine:edge AS builder_pup
RUN apk --update add curl jq && rm -rf /var/cache/apk/*
WORKDIR /tmp
# pup
RUN export CMD='pup'
RUN export REPO='ericchiang/pup'
RUN export ARCH='linux_amd64'
RUN export DLURL=$(curl -sL https://api.github.com/repos/$REPO/releases/latest | jq -r '.assets[].browser_download_url'| grep $ARCH)
RUN curl -Lo $CMD.zip $DLURL
RUN unzip $CMD.zip
RUN chmod +x $CMD
RUN unset REPO ARCH DLURL
#------------------------------------------------------------
FROM marpteam/marp-cli:latest
COPY --from=builder_entrykit /tmp/entrykit /usr/local/bin/entrykit
COPY --from=builder_pup /tmp/pup /usr/local/bin/pup
USER marp
ENV CHROME_PATH /usr/bin/chromium-browser
WORKDIR /home/marp/.cli
### plugin
RUN yarn add @marp-team/marp-cli @marp-team/marpit @marp-team/marp-core markdown-it-anchor markdown-it-attrs markdown-it-div markdown-it-implicit-figures markdown-it-include markdown-it-mark @gerhobbelt/markdown-it-inline-text-color github-markdown-css
### textlint
RUN yarn add markdownlint-cli textlint textlint-filter-rule-allowlist textlint-filter-rule-comments textlint-rule-preset-ja-spacing textlint-rule-preset-ja-technical-writing textlint-rule-proofdict prettier
RUN yarn cache clean

# environment
ENV MARP_USER marp:marp
ENV PATH /home/marp/.cli/node_modules/.bin:$PATH

# make command
WORKDIR /home/marp/.cli
COPY myengine.js myengine.js
RUN mkdir .cache && chmod 777 .cache
RUN echo '#!/bin/ash'                                                                    > entrypoint.sh
RUN echo 'set -x'                                                                       >> entrypoint.sh
RUN echo 'cmd=$1;shift'                                                                 >> entrypoint.sh
RUN echo 'case $cmd in'                                                                 >> entrypoint.sh
RUN echo '  textlint)     su-exec "$MARP_USER" $cmd "$@";;'                             >> entrypoint.sh
RUN echo '  markdownlint) su-exec "$MARP_USER" $cmd "$@";;'                             >> entrypoint.sh
RUN echo '  eslint)       su-exec "$MARP_USER" $cmd "$@";;'                             >> entrypoint.sh
RUN echo '  prettier)     su-exec "$MARP_USER" $cmd "$@";;'                             >> entrypoint.sh
RUN echo '  prettier-stylelint-formatter) su-exec "$MARP_USER" $cmd "$@";;'             >> entrypoint.sh
RUN echo '  sass)         su-exec "$MARP_USER" $cmd "$@";;'                             >> entrypoint.sh
RUN echo '  pup)          su-exec "$MARP_USER" $cmd "$@";;'                             >> entrypoint.sh
RUN echo '  *)            su-exec "$MARP_USER" node /home/marp/.cli/marp-cli.js "$@";;' >> entrypoint.sh
RUN echo 'esac'                                                                         >> entrypoint.sh
RUN chmod +x entrypoint.sh

# Style
COPY mystyle.scss mystyle.scss
RUN sass mystyle.scss:mystyle.css

# Setup workspace for user
USER root
WORKDIR /home/marp/app
RUN entrykit --symlink
# entrypoint
ENTRYPOINT [ \
  "switch", \
    "sh=/bin/sh", \
    "--", \
    "/home/marp/.cli/entrypoint.sh" ]
CMD ["--help"]

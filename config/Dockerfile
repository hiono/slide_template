FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -q
RUN apt-get install -y locales

RUN apt install npm --no-install-recommends -y
RUN npm install --global textlint
RUN npm install --global textlint-filter-rule-allowlist
RUN npm install --global textlint-filter-rule-comments
RUN npm install --global textlint-rule-preset-ja-spacing
RUN npm install --global textlint-rule-preset-ja-technical-writing
RUN npm install --global textlint-rule-spellcheck-tech-word
# RUN npm install --global textlint-rule-preset-jtf-style
RUN npm install --global prettier
RUN npm install --global markdownlint-cli

RUN rm -rf /var/lib/apt/lists/*
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

FROM ubuntu:latest

WORKDIR /usr/local/metabase
RUN apt-get -qq -y update
RUN apt-get -qq -y install openjdk-21-jdk git yq curl
ENV DRIVER=

RUN apt install -y ca-certificates curl gnupg &&\
    mkdir -p /etc/apt/keyrings &&\
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg &&\
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list &&\
    apt update &&\
    apt install nodejs make g++ -y &&\
    npm install --global yarn

RUN curl -L -O https://github.com/clojure/brew-install/releases/latest/download/posix-install.sh &&\
    chmod +x posix-install.sh &&\
    ./posix-install.sh

RUN curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
  gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
  tee /etc/apt/sources.list.d/1password.list && \
  mkdir -p /etc/debsig/policies/AC2D62742012EA22/ && \
  curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
  tee /etc/debsig/policies/AC2D62742012EA22/1password.pol && \
  mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 && \
  curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
  gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg && \
  apt update && apt install 1password-cli

ENV OP_SERVICE_ACCOUNT_TOKEN=
COPY tester.sh tester.sh
ENTRYPOINT /usr/local/metabase/tester.sh

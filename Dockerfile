FROM debian:jessie

ENV INTELLIJ_VERSION 15.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl openjdk-7-jdk && \
    apt-get clean all && \
    mkdir /home/intellij && \
    useradd intellij -d /home/intellij && \
    curl http://download-cf.jetbrains.com/idea/ideaIC-${INTELLIJ_VERSION}.tar.gz > /home/intellij/ideaIC-${INTELLIJ_VERSION}.tar.gz && \
    chown -R intellij:intellij /home/intellij && \
    cd /home/intellij && \
    tar xvzf ideaIC-${INTELLIJ_VERSION}.tar.gz && \
    rm -f ideaIC-${INTELLIJ_VERSION}.tar.gz

USER intellij

ENTRYPOINT [ "/home/intellij/idea-IC-139.1117.1/bin/idea.sh" ]

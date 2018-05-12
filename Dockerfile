FROM lsiobase/alpine:3.7
MAINTAINER xe

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install build packages
RUN \
 apk add --no-cache \
        autossh \
        openssh-client \
        openssh-doc \
        openssh-keysign \
        openssh-keygen && \

# cleanup
 rm -rf \
        /root/.cache \
        /tmp/*
        
# add local files
COPY root/ /

# ports and volumes
EXPOSE 8080
VOLUME /config

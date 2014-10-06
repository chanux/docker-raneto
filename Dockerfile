FROM debian:wheezy

RUN apt-get update && apt-get install -y \
		ca-certificates \
		curl

# verify gpg and sha256: http://nodejs.org/dist/v0.10.31/SHASUMS256.txt.asc
# gpg: aka "Timothy J Fontaine (Work) <tj.fontaine@joyent.com>"
RUN gpg --keyserver pgp.mit.edu --recv-keys 7937DFD2AB06298B2293C3187D33FF9D0246406D

ENV NODE_VERSION 0.10.32

RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
	&& curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
	&& gpg --verify SHASUMS256.txt.asc \
	&& grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
	&& tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
	&& rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc

ENV RANETO_VERSION 0.6.0 

RUN curl -SLO "https://github.com/gilbitron/Raneto/archive/$RANETO_VERSION.tar.gz" \
    && mkdir /raneto \
    && tar -xzf "$RANETO_VERSION.tar.gz" -C /raneto --strip-components=1 \
    && rm "$RANETO_VERSION.tar.gz"

WORKDIR /raneto
RUN npm install
RUN sed -i -e's:./content:/data/raneto:' /raneto/config.js

EXPOSE  3000

ADD run.sh /run.sh
ENTRYPOINT [ "/run.sh" ]

FROM ubuntu

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* 

COPY ./*.sh ./
RUN apt-get update \
  && apt-get install -y locales \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
  && apt-get install -y ca-certificates gnupg \
  && apt-get install -y openvpn iptables openssl wget ca-certificates curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && chmod +x *.sh

EXPOSE 1194/tcp
EXPOSE 443/tcp

ENTRYPOINT ["/openvpn-run.sh"]

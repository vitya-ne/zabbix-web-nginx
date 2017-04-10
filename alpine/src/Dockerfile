FROM zabbix/zabbix-web-nginx-pgsql:latest

ARG VER=3.2.4

ENV TERM=xterm
ENV ZBX_VERSION=${VER} ZBX_SOURCES=svn://svn.zabbix.com/tags/${VER}/ DB_TYPE=postgresql

EXPOSE 80/TCP 443/TCP

WORKDIR /usr/share/zabbix

VOLUME ["/etc/ssl/nginx"]

COPY files /

ENTRYPOINT ["/bin/bash"]

CMD ["/run_zabbix_component.sh", "frontend"]

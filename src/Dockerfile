FROM zabbix/zabbix-web-nginx-pgsql:alpine-3.2-latest


EXPOSE 80/TCP 443/TCP

WORKDIR /usr/share/zabbix

VOLUME ["/etc/ssl/nginx"]

COPY files /

ENTRYPOINT ["/bin/bash"]

CMD ["/run_zabbix_component.sh", "frontend"]

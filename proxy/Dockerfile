#FROM nginxinc/nginx-unprivileged:1-alpine
FROM --platform=linux/amd64 nginx:stable-alpine

# On copie notre nouveau fichier maître
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./gunicorn_headers /etc/nginx/gunicorn_headers
COPY ./run.sh /run.sh

ENV LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

USER root

RUN mkdir -p /vol/static && \
    mkdir -p /vol/media && \
    chmod 755 /vol && \
    chown -R nginx:nginx /vol && \
    # On prépare le terrain pour l'utilisateur nginx
    mkdir -p /tmp/client_temp && \
    chown -R nginx:nginx /tmp && \
    chown -R nginx:nginx /etc/nginx && \
    touch /tmp/nginx.pid && \
    chown nginx:nginx /tmp/nginx.pid && \
    chmod +x /run.sh

USER nginx

VOLUME /vol/static
VOLUME /vol/media

CMD ["/run.sh"]

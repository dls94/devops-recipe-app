# On définit les chemins de cache dans un endroit accessible
#client_body_temp_path /var/cache/nginx/client_temp;
#proxy_temp_path       /var/cache/nginx/proxy_temp;
#fastcgi_temp_path     /var/cache/nginx/fastcgi_temp;
#uwsgi_temp_path       /var/cache/nginx/uwsgi_temp;
#scgi_temp_path        /var/cache/nginx/scgi_temp;

server {
    listen ${LISTEN_PORT};

    location /static/static {
        alias /vol/static;
    }

    location /static/media {
        alias /vol/media;
    }

    location / {
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }
}

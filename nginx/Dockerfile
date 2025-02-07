FROM nginx:latest

# Copier la configuration Nginx personnalisée
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Exposer HTTP et HTTPS
EXPOSE 80 443

FROM nginx:latest

# Copier la configuration Nginx personnalisée
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Exposer HTTP et HTTPS
EXPOSE 80 443

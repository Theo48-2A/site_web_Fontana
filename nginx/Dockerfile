FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /app/staticfiles \
    && chown -R nginx:nginx /app/staticfiles


# Exposer HTTP et HTTPS
EXPOSE 80 443

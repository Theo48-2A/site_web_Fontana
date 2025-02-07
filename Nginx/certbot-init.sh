#!/bin/bash

# Vérifier si le certificat SSL existe déjà
if [ ! -d "/etc/letsencrypt/live/theo-fontana.com" ]; then
    echo "📌 Aucun certificat trouvé, génération d'un nouveau..."

    certbot certonly --webroot -w /var/www/html \
        --email contact@theo-fontana.com \
        --agree-tos \
        --no-eff-email \
        --force-renewal \
        -d theo-fontana.com -d www.theo-fontana.com
fi

# Redémarrer Nginx pour prendre en compte le certificat SSL
nginx -s reload

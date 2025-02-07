#!/bin/bash

# Vérifier si le certificat existe déjà
if [ ! -f "/etc/letsencrypt/live/theo-fontana.com/fullchain.pem" ]; then
    echo "📌 Aucun certificat trouvé, génération d'un nouveau..."
    certbot certonly --standalone --non-interactive --agree-tos --email admin@theo-fontana.com \
        -d theo-fontana.com -d www.theo-fontana.com
else
    echo "✅ Certificat déjà présent, pas besoin de générer un nouveau."
fi

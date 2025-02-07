#!/bin/bash

echo "🚀 Lancement du conteneur Django sécurisé avec HTTPS"

# Vérifier si un certificat SSL existe déjà, sinon en générer un
if [ ! -f "/etc/letsencrypt/live/theo-fontana.com/fullchain.pem" ]; then
    echo "🔐 Aucun certificat trouvé, génération d'un nouveau..."
    certbot certonly --standalone --non-interactive --agree-tos --email admin@theo-fontana.com \
        -d theo-fontana.com -d www.theo-fontana.com
else
    echo "✅ Certificat SSL trouvé, aucun besoin de générer un nouveau."
fi

# Démarrer le service cron pour renouveler SSL automatiquement
echo "🔄 Démarrage de cron pour la gestion automatique des certificats SSL..."
service cron start

# Lancer le script de redirection HTTP → HTTPS en arrière-plan
echo "🌍 Activation de la redirection HTTP vers HTTPS..."
nohup /app/redirect-http-to-https.sh &

# Lancer Gunicorn en HTTPS avec les certificats SSL
echo "🟢 Lancement de Gunicorn avec support HTTPS..."
gunicorn --bind 0.0.0.0:443 --certfile=/etc/letsencrypt/live/theo-fontana.com/fullchain.pem --keyfile=/etc/letsencrypt/live/theo-fontana.com/privkey.pem projet.wsgi:application

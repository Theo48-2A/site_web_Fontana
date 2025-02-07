# Utilisation d'une image Python légère
FROM python:3.10-slim

# Définir le répertoire de travail
WORKDIR /app

# Installer Certbot pour gérer SSL et autres outils nécessaires
RUN apt-get update && apt-get install -y certbot cron

# Copier uniquement le fichier des dépendances en premier pour optimiser le cache
COPY requirements.txt .

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du projet
COPY sitetheo/ .

# Copier et donner les permissions aux scripts
COPY generate_ssl.sh /app/generate_ssl.sh
COPY redirect-http-to-https.sh /app/redirect-http-to-https.sh
RUN chmod +x /app/generate_ssl.sh /app/redirect-http-to-https.sh

# Exécuter le script de génération du certificat SSL au premier démarrage
RUN /app/generate_ssl.sh

# Configurer le renouvellement automatique du certificat SSL via un cron job
RUN echo "0 3 * * * certbot renew --quiet" > /etc/cron.d/certbot_renew && chmod 0644 /etc/cron.d/certbot_renew

# Exposer les ports HTTP et HTTPS
EXPOSE 80 443

# Lancer les services : Redirection HTTP -> HTTPS, Cron, et Gunicorn en HTTPS
CMD ["/bin/bash", "-c", "
    nohup /app/redirect-http-to-https.sh &
    service cron start
    gunicorn --bind 0.0.0.0:443 --certfile=/etc/letsencrypt/live/theo-fontana.com/fullchain.pem --keyfile=/etc/letsencrypt/live/theo-fontana.com/privkey.pem projet.wsgi:application
"]

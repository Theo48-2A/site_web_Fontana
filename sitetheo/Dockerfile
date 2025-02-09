# Utilisation d'une image Python légère
FROM python:3.10-slim

# Définir le répertoire de travail
WORKDIR /app

# Installer les dépendances système
RUN apt-get update && apt-get install -y certbot && rm -rf /var/lib/apt/lists/*

# Copier et installer les dépendances Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code du projet
COPY . .

RUN mkdir -p /app/staticfiles \
    && chmod -R 777 /app/staticfiles

# Lancer Gunicorn (écoute en HTTP, Nginx gère HTTPS)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "projet.wsgi:application"]
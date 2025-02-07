# Utilisation d'une image Python légère
FROM python:3.10-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier uniquement le fichier des dépendances en premier pour optimiser le cache
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du projet
COPY sitetheo/ .

# Exposer le port 8000
EXPOSE 80

# Démarrer Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:80", "projet.wsgi:application"]


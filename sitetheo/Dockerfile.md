# Utilisation de Python officiel
FROM python:3.10

# Définir le répertoire de travail (ajusté pour correspondre à docker-compose)
WORKDIR /sitetheo

# Copier et installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier tout le projet
COPY . .

# Exposer le port 8000
EXPOSE 8000

# Utilisation de gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "sitetheo.wsgi:application"]




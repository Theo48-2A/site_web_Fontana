import os
from dotenv import load_dotenv

# Charger les variables depuis un fichier .env s'il existe (utile en local)
load_dotenv()


class Config:
    """Classe centralisant toutes les variables d'environnement"""

    REQUIRED_VARS = ["ENVIRONMENT",
                     "DJANGO_SECRET_KEY",
                     "ALLOWED_HOSTS"]

    @staticmethod
    def get_env_var(var_name: str) -> str:
        """Récupère une variable d'environnement et lève une exception si elle est absente."""
        value = os.getenv(var_name)
        if value is None or value == "":
            raise EnvironmentError(f"❌ ERREUR : La variable d'environnement '{var_name}' est absente ou vide !")
        return value

    # Vérification stricte des variables
    ENVIRONMENT = get_env_var.__func__("ENVIRONMENT")
    DJANGO_SECRET_KEY = get_env_var.__func__("DJANGO_SECRET_KEY")
    ALLOWED_HOSTS = get_env_var.__func__("ALLOWED_HOSTS").split(",")


# Instance globale de Config
config = Config()

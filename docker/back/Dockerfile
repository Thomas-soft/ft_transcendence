FROM python:3.9-slim

WORKDIR /app

COPY back/ ./
RUN apt-get update && apt-get install -y postgresql-client

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt
RUN python3 -m pip install --no-cache-dir -r requirements.txt
# Copier le code source Django

# Création d'un superutilisateur si les variables sont définies
ARG DJANGO_SUPERUSER_USERNAME
ARG DJANGO_SUPERUSER_EMAIL
ARG DJANGO_SUPERUSER_PASSWORD

RUN if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_EMAIL" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ]; then \
        python manage.py migrate && \
        python manage.py createsuperuser --no-input; \
    fi

EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
CMD ["daphne", "-b", "0.0.0.0", "-p", "8000", "backend.asgi:application"]
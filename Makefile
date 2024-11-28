# Variables
DC = docker-compose
DCP = ./docker/docker-compose.yml
DC_CMD = $(DC) -f $(DCP)

# Commandes

# Lancer les services en arrière-plan
up:
	$(DC_CMD) up -d

# Arrêter les services
down:
	$(DC_CMD) down

# Nettoyer les volumes et arrêter les conteneurs
clean:
	$(DC_CMD) down --volumes

# Arrêter les services et supprimer les volumes, images et réseaux associés
fclean:
	$(DC_CMD) down --rmi all --volumes --remove-orphans

# Reconstruction des conteneurs après des modifications
rebuild:
	$(DC_CMD) up --build

# Tout construire et lancer les services
all: fclean rebuild

# Supprimer et reconstruire rapidement les services
re: clean rebuild

# Construire les images sans démarrer les conteneurs
build:
	$(DC_CMD) build

.PHONY: up down clean fclean rebuild all re build

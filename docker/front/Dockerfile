# Dockerfile-frontend
FROM node:20

WORKDIR /app

# Copier et installer les dépendances
COPY front/package.json ./ front/vite.config.ts ./ front/tsconfig.*.json ./

RUN npm install -g npm@latest && npm install

# Copier le code de l'application
COPY front/ .

# Ajouter node_modules/.bin au PATH
ENV PATH="/app/node_modules/.bin:$PATH"

# Exposer le port de Vite
EXPOSE 5173

# Commande pour démarrer le serveur de développement
CMD ["npm", "run", "dev"]

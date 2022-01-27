 # image de départ
 FROM alpine:3.15

 RUN apk update && apk add nodejs npm
 # chemin de travail
 WORKDIR /src

 # downgrade des privilèges
 #USER node

 # installation des paquets système
 #RUN ...

 # copie des fichiers du dépôt
 #COPY package*.json ./
 COPY . .

 # installation des dépendances avec npm
 RUN npm install

 # build avec npm
 RUN npm run build

 # exécution
 CMD ["node","/src/dist/Application.js"]
 #CMD ["npm","run","watch"]

 
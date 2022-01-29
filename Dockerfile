 # image de départ
 FROM alpine:3.15 as builder

 RUN apk update && apk add nodejs npm
 # chemin de travail
 WORKDIR /home/ahajjar/Application_NodeJS/src

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
 
 #CMD ["node","./dist/Application.js"]
 CMD ["npm","run","watch"]

FROM alpine:3.15 as runner

RUN apk --no-cache add ca-certificates

WORKDIR /home/ahajjar/Application_NodeJS/src

COPY --from=builder . ./

CMD ["node", "./dist/Application.js"]
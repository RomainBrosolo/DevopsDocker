# Devops : Déployer une application web sous la stack MEAN
(Younes Baali & Romain Brosolo)

### 1/ Contexte du projet et analyse des besoins

Situé au cœur de l’Afrique de l’Ouest, le Burkina Faso est en proie aux attaques terroristes depuis plus de cinq (5) ans. D’après l’organisation non gouvernementale (ONG), OXFAM, entre 2017 et juillet 2021, plus de 1 368 000 personnes sur une population de 20 millions d’habitant·e·s, ont été contraintes de partir de leur domicile pour trouver protection dans les villes voisines. Dans les villes d’accueil, l’arrivée des personnes déplacées engendre de nouveaux besoins et une tension autour des ressources disponibles. Par ailleurs, à cause des changements climatiques, le pays fait également face à une production agricole de plus en plus faible et les poches de sécheresse persistante. Ces crises combinées ont engendré une dégradation continue de la situation humanitaire.

**Objectif du projet :**
Mettre en place une plateforme pour collecter, acheminer, distribuer et suivre des dons pour soutenir les personnes déplacées internes du burkina
Site vitrine pour avoir une identité visuelle et promouvoir l'association.

**Les besoins :**
- Pouvoir suivre les dons de l’expédition à la réception sur le site.

- Remercier les donateurs et leur montrer une image du destinataire avec leur don.

- Réaliser une page d'actualités sur l’aventure (via Instagram).

### 2/ Architecture du projet

La structure du projet est basé sous la stack MEAN.

MEAN est l’acronyme des 4 technos qui la composent :
- MongoDB
- Express.js (Dans notre cas NestJs)
- Angular 
- Node.js


### 3/ Prérequis

-Créer une machine virtuelle sous Linux
-Dans les paramètres de votre VM -> Réseau "NAT", Advanced -> Redirection de ports :
| Nom    | Protocole | Port hote | Port Invité |   |
|--------|-----------|-----------|-------------|---|
| Rule 1 | TCP       | 8080      | 8080        |   |
| Rule 2 | TCP       | 3000      | 3000        |   |
|        |           |           |             |   |, 

-Installer le package docker et docker compose 
docker : https://docs.docker.com/engine/install/debian/
docker compose: https://phoenixnap.com/kb/install-docker-compose-on-ubuntu-20-04

-Verifier que docker compose est bien installé en faisant la commande
```
docker-compose --version
```
-créer un ficher docker-compose.yml et écriver ceci à l'intérieur : 
```
nano docker-compose.yml
```
```
services:
  api:
    image: romainbrs/api:v2
    ports: 
     - "3000:3000"
     restart: always
  web:
    depends_on:
      - api
    image: romainbrs/angularweb:latest
    ports:
     - "8080:80"
     restart: always
```
-Puis lancé l'execution :
```
docker-compose down && docker-compose pull && docker-compose up -d
````
-

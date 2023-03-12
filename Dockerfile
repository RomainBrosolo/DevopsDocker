### STAGE 1: Définir le répertoire de travail ###
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install --force
RUN npm run build --prod

### STAGE 2: ###
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
##EXPOSE 80
FROM node:20

WORKDIR /usr/src/app

# Copiar archivos de configuración
COPY package*.json ./

# Instalar dependencias
RUN npm install --production

# Copiar el resto del proyecto
COPY . .

EXPOSE 3000

CMD ["npm", "start"]
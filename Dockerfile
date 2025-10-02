FROM node:20

# Habilitar Corepack para Yarn
RUN corepack enable && corepack prepare yarn@stable --activate

WORKDIR /usr/src/app

# Copiar archivos de configuración
COPY package.json yarn.lock .yarnrc.yml ./

# Copiar archivos de configuración
COPY package.json yarn.lock ./

# Instalar dependencias con Yarn
RUN yarn install --frozen-lockfile

# Instalar dependencias con Yarn (esto creará node_modules)
RUN yarn install --immutable

# Copiar el resto del proyecto
COPY . .

EXPOSE 3000

CMD ["yarn", "start"]
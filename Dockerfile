# Usamos una versión ligera de Node.js
FROM node:20-alpine

# Creamos un directorio de trabajo en el contenedor
WORKDIR /app

# Copiamos los archivos de dependencias
COPY package.json ./

# Instalamos las dependencias
RUN npm install

# Copiamos el código de la aplicación
COPY index.js ./

# Comando para ejecutar la aplicación
CMD ["node", "index.js"]

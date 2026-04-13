# 1. Define la imagen base: un entorno de Node.js versión 18 sobre Alpine Linux (una distro muy ligera).
FROM node:18-alpine

# 2. Crea y establece el directorio /app como la carpeta de trabajo dentro del contenedor.
# Todas las instrucciones siguientes se ejecutarán aquí.
WORKDIR /app

# 3. Copia solo el archivo package.json desde tu computadora al directorio actual en el contenedor.
# Se hace antes que el resto del código para que 'npm install' solo se repita si cambias tus dependencias.
COPY package.json .

# 4. Descarga e instala todas las librerías necesarias definidas en el package.json.
RUN npm install

# 5. Copia el resto de los archivos de tu proyecto (código fuente, configuración, etc.) al contenedor.
COPY . .

# 6. Indica que el contenedor escuchará en el puerto 3000 (es informativo, no abre el puerto por sí solo).
EXPOSE 3000

# 7. Define el comando que se ejecuta automáticamente al iniciar el contenedor.
# En este caso, arranca la aplicación usando el script "start" de tu package.json.
CMD ["npm", "start"]

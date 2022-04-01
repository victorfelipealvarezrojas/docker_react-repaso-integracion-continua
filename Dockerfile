## fase 1 el propósito de esta fase es instalar dependencias y construir nuestra aplicación
##   esto instalará dependencias, y ejecutará compilado y el resultado será la carpeta de compilación /app/build <== npm run build
From node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## fase 2 de ejecucion
From nginx:alpine
EXPOSE 80
## desde el builder del paso anterior => copio la carpeta creada con su contenido en la fase anterior al este servicio de nginx
COPY --from=builder /app/build /usr/share/nginx/html


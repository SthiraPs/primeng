# Stage 1: Build the Angular app
FROM node:16-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Stage 2: Serve the Angular app with a lightweight HTTP server
FROM nginx:1.21-alpine
COPY --from=builder /app/dist/velzon /usr/share/nginx/html
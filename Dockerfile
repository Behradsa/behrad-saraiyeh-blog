# Build Stage
# FROM pnpm/pnpm:10 AS builder
FROM node:24-alpine AS builder

WORKDIR /app

# RUN npm install -g pnpm@10.32.1 --registry=https://nexus-snapppay-gui.apps.private.okd4.teh-1.snappcloud.io/repository/npm-group --verbose
RUN npm install -g pnpm@10.32.1 --registry=https://mirror-npm.runflare.com --verbose
 
COPY package.json pnpm-lock.yaml .npmrc ./

RUN pnpm install

COPY astro.config.mjs tsconfig.json ./
COPY public ./public
COPY src ./src

RUN pnpm run build

# Runtime
FROM nginx:1.28-alpine

RUN rm -rf /usr/share/nginx/html/* \
    && rm -rf /etc/nginx/conf.d/*
    # && rm -rf /etc/nginx/sites

COPY --from=builder /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

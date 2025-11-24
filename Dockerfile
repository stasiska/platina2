# ---------- 1. Builder stage ----------
FROM node:24.11.1-alpine AS builder

# Устанавливаем зависимости для Prisma и сборки
RUN apk add --no-cache \
    openssl \
    python3 \
    py3-pip \
    make \
    g++ \
    && rm -rf /var/cache/apk/*

WORKDIR /app

# Копируем только нужное для установки зависимостей
COPY package*.json ./
COPY prisma ./prisma/

# Устанавливаем зависимости (включая devDependencies для build)
RUN npm ci --silent

# Копируем остальной код
COPY . .

# Генерируем Prisma Client и собираем проект
RUN npx prisma generate --schema=./prisma/schema.prisma
RUN npm run build

# ---------- 2. Production stage ----------
FROM node:24.11.1-alpine AS production

# Устанавливаем только openssl для Prisma
RUN apk add --no-cache openssl

WORKDIR /app

# Копируем только то, что нужно для запуска (из builder)
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/prisma ./prisma

# Генерируем Prisma Client (важно для production)
RUN npx prisma generate --schema=./prisma/schema.prisma

# Открываем порт
EXPOSE 55013

# Команда запуска (будет переопределена в docker-compose)
CMD ["node", "dist/main.js"]
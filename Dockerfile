FROM mirror.gcr.io/library/node:22-alpine AS builder
WORKDIR /app
RUN apk add --no-cache python3 make g++ linux-headers
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM mirror.gcr.io/library/node:22-alpine
WORKDIR /app
RUN apk add --no-cache python3 make g++ linux-headers
COPY --from=builder /app/build ./build
COPY --from=builder /app/server-build ./server-build
COPY --from=builder /app/package*.json ./
RUN npm ci --omit=dev

ENV NODE_ENV=production
ENV PORT=3000
ENV HOSTNAME=0.0.0.0
EXPOSE 3000

CMD [ "node", "server-build/index.js" ]
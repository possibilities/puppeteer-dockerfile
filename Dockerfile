FROM node:12-alpine3.12

RUN apk add --no-cache \
  chromium \
  nss \
  freetype \
  freetype-dev \
  harfbuzz \
  ca-certificates \
  ttf-freefont

ENV LANG="C.UTF-8" \
  PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
  PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN addgroup -S puppeteeruser && \
  adduser -S -g puppeteeruser puppeteeruser && \
  chown -R puppeteeruser:puppeteeruser /home/puppeteeruser

USER puppeteeruser

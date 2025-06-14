FROM n8n/n8n:1.97.1

USER root

# Install Chromium and dependencies
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    ttf-dejavu \
    ttf-droid \
    ttf-liberation \
    fontconfig

# Install n8n-nodes-puppeteer
RUN npm install -g n8n-nodes-puppeteer

# Set Puppeteer to use system Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Copy custom entrypoint
COPY docker-custom-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-custom-entrypoint.sh

USER node

ENTRYPOINT ["docker-custom-entrypoint.sh"]
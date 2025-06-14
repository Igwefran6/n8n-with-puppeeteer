FROM n8n/n8n:1.95.3

USER root

# Install Chromium and essential dependencies
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    dumb-init

# Set environment variables
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

USER node

# Expose port
EXPOSE 5678

# Use simple startup
ENTRYPOINT ["dumb-init", "--"]
CMD ["n8n", "start"]
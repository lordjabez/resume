FROM node:24-bookworm-slim

# The lockfile pins md-to-pdf and puppeteer, and puppeteer pins the Chrome build
WORKDIR /app
ENV PUPPETEER_CACHE_DIR=/app/.cache/puppeteer
COPY package.json package-lock.json ./
RUN apt-get update && apt-get install -y --no-install-recommends unzip \
    && npm ci && npx puppeteer browsers install chrome --install-deps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
# build.bash runs as the host UID, which has no passwd entry, so HOME would be
# the read-only "/" and Chrome's crashpad handler fails to start without it
ENV HOME=/tmp
ENTRYPOINT ["/app/node_modules/.bin/md-to-pdf", "--config-file", "/work/md-to-pdf.config.js", \
            "--launch-options", "{\"args\": [\"--no-sandbox\", \"--disable-dev-shm-usage\"]}"]

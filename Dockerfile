# --- Stage 1: Node.js Scraper ---
    FROM node:18-slim AS scraper

    # Install Chromium and necessary libs
    RUN apt-get update && apt-get install -y \
        chromium \
        fonts-liberation \
        libatk-bridge2.0-0 \
        libnspr4 \
        libnss3 \
        libxss1 \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*
    
    # Setup app directory
    WORKDIR /scraper
    
    # Install Puppeteer with Chromium skipped
    ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
    
    COPY package.json ./
    COPY scrape.js ./
    RUN npm install puppeteer-core
    
    # Pass SCRAPE_URL at build time (optional fallback)
    ARG SCRAPE_URL=https://wikipedia.com
    ENV SCRAPE_URL=${SCRAPE_URL}
    
    # Run the scraper
    RUN node scrape.js
    
    
    # --- Stage 2: Python Flask Server ---
    FROM python:3.10-slim AS final
    
    # Install Flask
    RUN pip install Flask
    
    WORKDIR /app
    
    # Copy Flask server and scraped data from previous stage
    COPY --from=scraper /scraper/scraped_data.json ./
    COPY server.py ./
    
    # Expose Flask port
    EXPOSE 5000
    
    # Run the Flask app
    CMD ["python", "server.py"]
    
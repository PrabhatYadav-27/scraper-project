# Scrape the title and headline using puppeteer + Flask JSON Server & Mutli-build Docker Project

This is repo is all about scraping the provided url **headline** and its **title** and then Dockerize the Whole
as **Docker Image**.

## Project Has Two Main Parts:
-  **A Node.js Script** :-  That uses puppeteer to scrape a webpage.
-  **A Flask Server** :-  That uses puppeteer to scrape a webpage.

## Project File Structure
- --| `scrape.js`: Node.js script file to scrape the website headline and title.
- --| `server.py`: Python Flask app to show the scraped data at the homepage ('/').
- --| `package.json`: For puppeteer dependencies.
- --| `requirements.txt`: For python flask dependencies.
- --| `Dockerfile`: To build and run everything inside Docker.

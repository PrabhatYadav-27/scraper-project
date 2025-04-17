# Scrape the title and headline using puppeteer + Flask JSON Server ( Mutli-build Docker Project)

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


## What you need to have on your system
- PYTHON
- NODE.JS
- DOCKER

## Commands and when to use

### To install puppeteer
    - run  `npm install puppeteer`

### To set the environmental variable

 **for cmd**
  
   - run `set SCRAPE_URL=https://wikipedia.org`

**for powershell**
 
  -run `$env:SCRAPE_URL="https://wikipedia.org"`

**for bash**

  - run `export SCRAPE_URL="https://wikipedia.org" `

### To run the scrape.js
- run `node scrape.js` 

### To run the Flask server
 - run `python server.py`


Once the full file setup has been done we can see that a new file has been created in our current working folder
 named as **scraped_data.json** in json format that collect the headline and titile of the provided **url**. This 
 scraped data will be rendered on our flask app server.

 To see the result once you will run `pyhton server.py` a https link will be provided o your local machine click the link and see the scraped data in json format on your browser.

 ## To create the Docker image
  You should have the  `Dockerfile` which will be used to build the docker image on your system
  - run `docker build -t scraper-server .` this command will build the image.
  - run `docker run -p 5000:5000 -e SCRAPE_URL=https://wikipedia.org scraper-server` this command will run the container 
  - -p 5000:5000 = maps the app to your local machine.
     **-p stand as port**

  - -e SCRAPE_URL=... tells it which website to scrape.
     **-e stand for environmental variable**
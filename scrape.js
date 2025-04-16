const fs = require('fs');
const puppeteer = require('puppeteer');

(async ()=>{
    const url = process.env.SCRAPE_URL || 'https://example.com'
    console.log(`Using url:  ${url}`); //log the url being used

    const browser = await puppeteer.launch({
        headles: true,
        args: ['--no-sandbox']
    });

    //open in new page

    const page = await  browser.newPage();

    try{
        await page.goto(url,{waitUntil: 'domcontentloaded'});

    } catch(err){
        console.log(`Failed to load page: ${url}`, err);
        await browser.close();
        return;
    }

    const data = await page.evaluate(() => {
        const title = document.title;
        let heading = document.querySelector('h1')?.innerText || 'No Heading Found';
        return {title, heading};
    });

    fs.writeFileSync('scraped_data.json', JSON.stringify(data));
    await browser.close();
})();
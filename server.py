from flask import Flask, jsonify
import json
app = Flask(__name__)

# making the route to open the scrape data from url
@app.route("/")
def home():
    with open("scraped_data.json") as f:
        data = json.load(f)
    return jsonify(data)


# hosting on port 5000
app.run(host="0.0.0.0", port=5000)
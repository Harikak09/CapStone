from flask import Flask
app = Flask(__name__)
@app.route("/")
def index():
    return "Capstone Project 8: Build and Run Docker App Locally"
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80, debug=True)

from flask import Flask
from flask import render_template

# creates a Flask application called app
app = Flask(__name__)

# a route where we will display a welcome message via a HTML template
@app.route("/")
def web_page():
	bio = "Hello my name is Jason and I possess an undying love for Microsoft Azure"
	return render_template('index.html', message=bio)


# run the application
if __name__ == "__main__":
	app.run(debug=True)

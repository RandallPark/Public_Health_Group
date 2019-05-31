from flask import Flask, render_template, redirect
import data_functions

# Create an instance of Flask
app = Flask(__name__)

# Use SQLAlchemy to establish SQL connection
#TODO CODE HERE

# Route to render index.html template
@app.route("/")
def index():
    #data = get_data()
    # Return template for html
    # return render_template("index.html")
    return redirect("/map")

# Route to render home.html template
@app.route("/home")
def home():

    # Return template for html
    return render_template("home.html")

# Route to render home.html template
@app.route("/images")
def images():

    # Return template for html
    return render_template("static-images.html")

# Route to render index.html template
# Warren using for development...
@app.route("/map")
def map():

    # Return template for html
    # return render_template("index.html")
    return render_template("map.html")

# Route to render graph.html
@app.route("/graph")
def graph():

    # Return template for html
    return render_template("d3-circle-graph.html")

# Route to render dash-board.html
@app.route("/dash-board")
def dash():

    # Return template for html
    return render_template("dash-board.html")

@app.route("/dash-board2")
def dash2():

    # Return template for html
    return render_template("dash-board2.html")

# Route that will trigger data retrieval
@app.route("/data")
def data():

    # Run the scrape function
    # engine = data_functions.engine()

    # Redirect back to home page
    return render_template("practice_data.html")

@app.route("/json")
def json():

    return redirect("/")


if __name__ == "__main__":
    app.run(debug=True)

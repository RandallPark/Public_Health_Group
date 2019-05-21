from flask import Flask, render_template, redirect
import data_functions

# Create an instance of Flask
app = Flask(__name__)

# Use SQLAlchemy to establish SQL connection
#TODO CODE HERE

# Route to render index.html template using data from Mongo
@app.route("/")
def home():

    # Return template for html
    return render_template("index.html")


# Route that will trigger the scrape function
@app.route("/data")
def data():

    # Run the scrape function
    # engine = data_functions.engine()

    # Redirect back to home page
    return redirect("/")


if __name__ == "__main__":
    app.run(debug=True)

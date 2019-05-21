// Creating map object
// var map = L.map("map", {
//   center: [40.7128, -74.0059],
//   zoom: 5
// });
var map = L.map('map').setView([37.8, -96], 5);

// Adding tile layer
L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}", {
  attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
  maxZoom: 10,
  id: "mapbox.streets",
  accessToken: API_KEY
}).addTo(map);

//L.geoJson(statesData).addTo(map);

// var link = "http://data.beta.nyc//dataset/0ff93d2d-90ba-457c-9f7e-39e47bf2ac5f/resource/" +
// "35dd04fb-81b3-479b-a074-a27a37888ce7/download/d085e2f8d0b54d4590b1e7d1f35594c1pediacitiesnycneighborhoods.geojson";

// Function that will determine the color of a state based stats
//Array of colors
//['#f7f4f9','#e7e1ef','#d4b9da','#c994c7','#df65b0','#e7298a','#ce1256','#91003f']
function chooseColor(s) {
  return s > 1000 ? '#91003f' :
         s > 500  ? '#ce1256' :
         s > 200  ? '#e7298a' :
         s > 100  ? '#df65b0' :
         s > 50   ? '#c994c7' :
         s > 20   ? '#d4b9da' :
         s > 10   ? '#e7e1ef' :
                    '#f7f4f9';
}



// Grabbing our GeoJSON data..
  // Creating a geoJSON layer with the retrieved data
L.geoJson(statesData, {
  // Style each feature (in this case a neighborhood)
  style: function(feature) {
    return {
      color: "white",
      // Call the chooseColor function to decide which color to color our neighborhood (color based on borough)
      fillColor: chooseColor(feature.properties.density),
      fillOpacity: 0.5,
      weight: 1.5
    };
  },
  // Called on each feature
  onEachFeature: function(feature, layer) {
    // Set mouse events to change map styling
    layer.on({
      // When a user's mouse touches a map feature, the mouseover event calls this function, that feature's opacity changes to 90% so that it stands out
      mouseover: function(event) {
        console.log(event);
        layer = event.target;
        layer.setStyle({
          fillOpacity: 0.9
        });
      },
      // When the cursor no longer hovers over a map feature - when the mouseout event occurs - the feature's opacity reverts back to 50%
      mouseout: function(event) {
        console.log(event);
        layer = event.target;
        layer.setStyle({
          fillOpacity: 0.5
        });
      },
      // When a feature (neighborhood) is clicked, it is enlarged to fit the screen
      click: function(event) {
        console.log(event);
        map.fitBounds(event.target.getBounds());
      }
    });
    // Giving each feature a pop-up with information pertinent to it
    layer.bindPopup("<h1>" + feature.properties.name + "</h1> <hr> <h2>" + feature.properties.density + "</h2>");

  }
}).addTo(map);

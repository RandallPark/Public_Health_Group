// Creating map object
var map = L.map('map').setView([37.8, -96], 5);
var geojson;
// Adding tile layer
L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}", {
  attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
  maxZoom: 10,
  id: "mapbox.streets",
  accessToken: API_KEY
}).addTo(map);




// Function that will determine the color of each state based on stats
//Array of colors from http://colorbrewer2.org/#type=sequential&scheme=PuRd&n=8
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


function style(feature){
  return{
    fillColor: chooseColor(feature.properties.density),
    color:'white',
    fillOpacity: 0.3,
    weight:2,
    opacity:1
  }
};

L.geoJson(statesData, {style: style}).addTo(map);

function highlightFeature(e) {
  var layer = e.target;
  console.log(e);
  
  layer.setStyle({
    weight: 5,
    dashArray: '',
    fillOpacity: 1,
  });

  //add info to control
  info.update(layer.feature.properties);

  //Bring to front unless browser is not compatable with functionality
  if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
    layer.bringToFront();
  }
};

function resetHighlight(e) {
  console.log(e);
  geojson.resetStyle(e.target);
  info.update();
};



function onEachFeature(feature, layer) {
  layer.on({
    mouseover: highlightFeature,
    mouseout: resetHighlight
  });
}

geojson = L.geoJson(statesData, {
  style: style,
  onEachFeature: onEachFeature
}).addTo(map);

//creating a control panel to present info for each feature
var info = L.control();

info.onAdd = function(map){
  this._div = L.DomUtil.create('div', 'info'); //creat div with class "info"
  this.update;
  return this._div;
};

//method used to update control based on feature properties passed
//adding html tags for a header, bold text and line break
info.update = function(props) {
  this._div.innerHTML = '<h4>US Substance Treatment</h4>' + (props ?
    '<b>' +props.name + '</b><br />'+ props.density + ' people'
    : 'Hoover over a state');

}
//adding control to map
info.addTo(map);

//adding Legend to map
var legend = L.control({position: 'bottomright'});

legend.onAdd = function (map) {

  var div= L.DomUtil.creat('div', 'info legend'),
    grades = [0, 10, 20, 50, 100, 200, 500, 1000],
    labels = [];
    
  for (var i = 0; i < grades.length; i++) {
    div.innerHTML +=
      '<i style="background:' + chooseColor(grades[i] + 1) + '"></i> ' +
      grades[i] + (grades[i + 1] ? '&ndash;' + grades[i + 1] + '<br>' : '+');
  }

  return div;
};

legend.addTo(map);
// Grabbing our GeoJSON data..
  // Creating a geoJSON layer with the retrieved data

// L.geoJson(statesData, {
//   // Style each feature 
//   style: function(feature) {
//     return {
//       color: "white",
//       // Call the chooseColor function to decide which color to color our neighborhood (color based on borough)
//       fillColor: chooseColor(feature.properties.density),
//       fillOpacity: 0.5,
//       weight: 1.5
//     };
//   },
//   // Called on each feature
//   onEachFeature: function(feature, layer) {
//     // Set mouse events to change map styling
//     layer.on({
//       // When a user's mouse touches a map feature, the mouseover event calls this function, that feature's opacity changes to 90% so that it stands out
//       mouseover: function(event) {
//         console.log(event);
//         layer = event.target;
//         // Giving each feature a pop-up with information pertinent to it
//         layer.bindPopup("<h1>" + feature.properties.name + "</h1> <hr> <h2>" + feature.properties.density + "</h2>");
//         layer.setStyle({
//           fillOpacity: 0.9
//         });
//       },
//       // When the cursor no longer hovers over a map feature - when the mouseout event occurs - the feature's opacity reverts back to 50%
//       mouseout: function(event) {
//         console.log(event);
//         layer = event.target;
//         layer.setStyle({
//           fillOpacity: 0.5
//         });
//       },
//       // When a feature (neighborhood) is clicked, it is enlarged to fit the screen
//       // click: function(event) {
//       //   console.log(event);
//       //   //map.fitBounds(event.target.getBounds());
//       // }
//     });
    

//   }
// }).addTo(map);

// Creating map object
var map = L.map('map').setView([37.8, -96], 5);
var geojson;
var pt_data = {};

//creating a control panel to present info for each feature
var info = L.control();

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

// Read data from patient info by state
d3.json("/static/data/pt_by_state.json").then(function(data) {
  data.forEach(element => {
    pt_data[element.state] = element;
  });
});

function style(feature){
  console.log("return function called");
  return{
    // Call the chooseColor function to decide which color
    //Set color for polygons here.
    fillColor: chooseColor(feature.properties.density),
    color:'white',
    fillOpacity: 0.3,
    weight:2,
    opacity:1
  }
};



// Grabbing our GeoJSON data.
// Creating a geoJSON layer with the retrieved data
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

// When the cursor no longer hovers over a map feature - 
//when the mouseout event occurs - the feature's opacity reverts back
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

// Style each feature 
geojson = L.geoJson(statesData, {
  style: style,
  onEachFeature: onEachFeature
}).addTo(map);



// Adding info control panel to map
info.onAdd = function(map){
  this._div = L.DomUtil.create('div', 'info'); //creat div with class "info"
  this.update;
  return this._div;
};

//method used to update control based on feature properties passed
//adding html tags for a header, bold text and line break
info.update = function(props) {
  // TODO: check if state_key exists...
  var state_key = props.name.toUpperCase();
  var num_patients = pt_data[state_key].value;
  this._div.innerHTML = '<h4>US Substance Treatment</h4>' + (props ?
    '<b>' +props.name + '</b><br />'+ num_patients + ' people'
    : 'Hoover over a state');

}
//adding control to map
info.addTo(map);

//adding Legend to map
var legend = L.control({position: 'bottomright'});

legend.onAdd = function (map) {

  var div = L.DomUtil.create('div', 'info legend'),
    grades = [0, 10, 20, 50, 100, 200, 500, 1000],
    labels = [],
    from, to;

  for (var i = 0; i < grades.length; i++) {
    from = grades[i];
    to = grades[i + 1];

    labels.push(
      '<i style="background:' + chooseColor(from + 1) + '"></i> ' +
      from + (to ? '&ndash;' + to : '+'));
  }

  div.innerHTML = labels.join('<br>');
  return div;
};

legend.addTo(map);


// L.geoJson(statesData, {
//   
//   style: function(feature) {
//     return {
//       color: "white",
//        to color our neighborhood (color based on borough)
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
//       
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

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
  return s > 100000 ? '#91003f' :
         s > 50000  ? '#ce1256' :
         s > 20000  ? '#e7298a' :
         s > 10000  ? '#df65b0' :
         s > 5000   ? '#c994c7' :
         s > 2000   ? '#d4b9da' :
         s > 200   ? '#e7e1ef' :
                    '#f7f4f9';
}

// Read data from patient info by state
d3.json("/static/data/pt_by_state.json").then(function(data) {
  data.forEach(element => {
    pt_data[element.state] = element;
  });
});

function style(feature){
  // console.log("'style' function called");
  // console.log(feature);
  // var state_key = feature.properties.name.toUpperCase();
  // console.log(state_key);
  // console.log(pt_data[state_key]);
  // var num_patients = pt_data[state_key].value;
  // console.log(state_key);
  return{
    // Call the chooseColor function to decide which color
    //Set color for polygons here.
    fillColor: chooseColor(feature.properties.value),
    //fillColor: chooseColor(num_patients),
    color:'white',
    fillOpacity: 0.4,
    weight:2,
    opacity:1
  }
};



// Grabbing our GeoJSON data.
// Creating a geoJSON layer with the retrieved data
L.geoJson(statesData, {style: style}).addTo(map);

//// Function to call statesData variable on styling features.
// function onEachFeature(feature, layer) {
//   console.log("'onEachFeature' function called");
//   console.log(feature);
//   var state_key = feature.properties.name.toUpperCase();
//   console.log(state_key);
//   console.log(pt_data[state_key]);
//   var num_patients = pt_data[state_key].value;
//   //console.log(state_key);
//   return{
//     // Call the chooseColor function to decide which color
//     //Set color for polygons here.
//     // fillColor: chooseColor(feature.properties.density),
//     fillColor: chooseColor(num_patients),
//     // color:'white',
//     // fillOpacity: 0.3,
//     // weight:2,
//     // opacity:1
//   }
// };

function highlightFeature(e) {
  var layer = e.target;
  console.log("highlightFeature");
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
  console.log("resetHighlight");
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
  // console.log("info.update");
  // console.log(props);
  // console.log(props ? props.name : 'properties not defined');
  // console.log(props ? props.name.toUpperCase(): 'properties not defined');
  var state_key = props ? props.name.toUpperCase(): "";
  var num_patients = props ? pt_data[state_key].value : 0;
  this._div.innerHTML = '<h4>US Substance Treatment</h4>' + (props ?
    '<b>' +props.name + '</b><br /><b>'+ num_patients + ' people</b>'
    : 'Hoover over a state');

}
//adding control to map
info.addTo(map);

//adding Legend to map
var legend = L.control({position: 'bottomright'});

legend.onAdd = function (map) {

  var div = L.DomUtil.create('div', 'info legend'),
    grades = [0, 200, 2000, 5000, 10000, 20000, 50000, 100000],
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

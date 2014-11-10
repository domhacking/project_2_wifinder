// WAITS FOR ALL HTML and DOM TO HAVE LOADED

$(document).ready(function(){
  var map;

  //initialize map variables
  var markers = [];
  var mapApp = {}
  var input = document.getElementById('searchbox')

  //SearchBox variable:
  var searchBox = new google.maps.places.SearchBox(document.getElementById('searchbox'));

  //Initialising map once the page has loaded
  mapApp.initializeMap = function(){
    var mapOptions = {
      zoom: 15,
      center: new google.maps.LatLng(51.520975, -0.104750)
    };

    map = new google.maps.Map(document.getElementById('googleMap'),
      mapOptions);
  };

  mapApp.searchBox = function(){
    var places = searchBox.getPlaces();

    //Deleting previous markers
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    // and creating an empty array for new search results
    markers = [];

    // CREATING A NEW LATITUDE + LONGITUDE BOUND OBJECT
    var bounds = new google.maps.LatLngBounds();
    
    // LOOPING THROUGH ARRAY
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      // can change this marker in Rails - put image in assets folder
      var marker = new google.maps.Marker({
        map: map,
        icon: image,
        title: place.name,
        position: place.geometry.location
      });
      //mapping the bounds of the map around the location; 
      markers.push(marker);
      bounds.extend(place.geometry.location);   
    }
    // FIT THE BOUNDS OF THE MAP AROUND THIS OBjECT
    map.fitBounds(bounds); 
    // SETTING HOW ZOOMED THE RESULTS ARE
    map.setZoom(15);
  }

  google.maps.event.addListener(searchBox, 'places_changed', function(){
    mapApp.searchBox();
  })
  
  mapApp.initializeMap();
})
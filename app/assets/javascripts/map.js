// WAITS FOR ALL HTML and DOM TO HAVE LOADED

$(document).ready(function(){
  var map;
  var mapOptions;
  var canvas;
  var userLocationMarker = new google.maps.Marker();

  //initialize map variables
  var markers = [];
  var mapApp = {};
  var input = $("#searchbox")[0];

  //SearchBox variable:
  var searchBox = new google.maps.places.SearchBox(input);

  //Initialising map once the page has loaded
  mapApp.initializeMap = function(){
    mapOptions = {
      zoom: 16,
      // center: new google.maps.LatLng(51.520975, -0.104750),
      mapTypeId:google.maps.MapTypeId.ROADMAP
    };

    canvas = $("#googleMap")[0];
    map = new google.maps.Map(canvas,
      mapOptions);

    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = new google.maps.LatLng(position.coords.latitude,
         position.coords.longitude);

        var infowindow = new google.maps.InfoWindow({
          map: map,
          position: pos,
          content: 'You are here...'
        });

        map.setCenter(pos);
      }, function() {
        handleNoGeolocation(true);
      });
    } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }
  function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
      var content = 'Error: The Geolocation service failed.';
    } else {
      var content = 'Error: Your browser doesn\'t support geolocation.';
    }

    var options = {
      map: map,
      position: new google.maps.LatLng(51.508742, -0.120850),
      content: content
    };

    var infowindow = new google.maps.InfoWindow(options);
    map.setCenter(options.position);
  }

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
    map.setZoom(16);
  }

  google.maps.event.addListener(searchBox, 'places_changed', function(){
    mapApp.searchBox();
  })
  
  mapApp.initializeMap();
})
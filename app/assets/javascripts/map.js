// WAITS FOR ALL HTML and DOM TO HAVE LOADED

$(document).ready(function(){
  //initialize map variables
  var map;
  var canvas;
  var mapOptions;
  var markers = [];
  var mapApp = {};

  //SearchBox variable:
  var input = $("#searchbox")[0];
  var searchBox = new google.maps.places.SearchBox(input);

  //Initialising map once the page has loaded
  mapApp.initializeMap = function(){
    mapOptions = {
      zoom: 15,
      mapTypeId:google.maps.MapTypeId.ROADMAP
    };

    canvas = $("#googleMap")[0];
    map = new google.maps.Map(canvas,
      mapOptions);

    // this will center the map on the user's location if they have geolocation enabled
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

  function getLocations(southWest, northEast){
    // finding lat/long from db cafes to add to the map
    $.ajax({
      type: "GET",
      url: "/cafes.js",
      data: {sw: southWest.toUrlValue(), ne:  northEast.toUrlValue()},
      dataType: "JSON",
    }).success(function(data){
      var items = [];
      $.each( data, function( key, val ) {
        addMarker(val.latitude, val.longitude)
        addListItem(val.cafe_name)
      });
    })
  }

  function addMarker(lat, lon) {
    var marker = new google.maps.Marker({
      map: map,
      position: new google.maps.LatLng(lat, lon)
    });
    markers.push(marker);
  }

  function addListItem(cafe_name){

  }

  mapApp.searchMap = function(){
    var places = searchBox.getPlaces();

    // CREATING A NEW LATITUDE + LONGITUDE BOUND OBJECT
    var bounds = new google.maps.LatLngBounds();
    
    // LOOPING THROUGH ARRAY
    for (var i = 0, place; place = places[i]; i++) {
      //mapping the bounds of the map around the location; 
      bounds.extend(place.geometry.location);
    }
    // FIT THE BOUNDS OF THE MAP AROUND THIS OBjECT
    map.fitBounds(bounds);
    // SETTING HOW ZOOMED THE RESULTS ARE
    map.setZoom(15);
    mapApp.updateMap();
  }

  mapApp.updateMap = function(){
    mapApp.deleteMarkers();
    var bounds = map.getBounds();
    var southWest = bounds.getSouthWest();
    var northEast = bounds.getNorthEast();

    getLocations(southWest, northEast);
  }

  mapApp.deleteMarkers = function(){
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }
  }

  mapApp.initializeMap();
  // google.maps.event.addListener(map, 'dragend', function(){
  //   mapApp.updateMap();
  // })
  google.maps.event.addListener(map, 'bounds_changed', function(){
    mapApp.updateMap();
  })
  google.maps.event.addListener(searchBox, 'places_changed', function(){
    mapApp.searchMap();
  })
  
  
})
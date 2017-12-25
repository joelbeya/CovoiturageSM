<?php
require_once('fonctioncsm.php');
if(!isset($_SESSION['email'])) {
  header("Location:index.php");
}

else
  $conn = connexionBDDCSM();
  require 'header.php';

if (isset($_POST['envoi']))
{
  $date_dep = $_POST['date_dep'];
  $marque = $_POST['marque'];
  $date_nais = $_POST['date_nais'];
  $immat = $_POST['immat'];
  $prix = $_POST['prix'];
  $description = $_POST['description'];
}

?>
<br><br><br><h1 style="text-align:center;">Vous pouvez partager votre itinéraire et vos descriptions de voyages </h1><br><br>
<div class="w3-container">
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>"method="post">
  <div class="w3-half">
    <div class="w3">
      <label>Date de voyage</label>
      <input class="w3-input" name="date_dep" type="date" placeholder="AAAA/MM/JJ/ HH-MM-SS">
    </div>
    <div class="w3" style="height:50%">
      <label>Marque du véhicule</label>
      <input class="w3-input" name="marque" type="text" placeholder="Marque du véhicule">
    </div>
    <div class="w3">
      <label>N° Immatriculation</label>
      <input class="w3-input" name="immat" type="text"  placeholder="12345">
    </div>
    <div class="w3">
      <label>Prix / Personne</label>
      <input class="w3-input" type="number" name="" placeholder="Departing from">
    </div>
    <div class="w3">
      <label>Description</label>
      <input class="w3-input" name="description" type="text" placeholder="Departing from">
    </div>
    <button type="submit" class="btn btn-default" name="envoi"> Rajouter </button>
  </div>
</form>
  <div class="w3-half">
    <input id="origin-input" class="controls" type="text" placeholder="Enter an origin location">
    <input id="destination-input" class="controls" type="text" placeholder="Enter a destination location">
    <div id="mode-selector" class="controls">
      <input type="radio" name="type" id="changemode-walking" checked="checked">
      <label for="changemode-walking">Marche</label>

      <input type="radio" name="type" id="changemode-transit">
      <label for="changemode-transit">Transport</label>

      <input type="radio" name="type" id="changemode-driving">
      <label for="changemode-driving">Voiture</label>
    </div>
    <div id="map" style="width:730px;height:340px;background:yellow"></div>
  </div>
</div>

<script>
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    mapTypeControl: false,
    center: {lat: -33.8688, lng: 151.2195},
    zoom: 13
  });

  new AutocompleteDirectionsHandler(map);
}

 /**
  * @constructor
 */
function AutocompleteDirectionsHandler(map) {
  this.map = map;
  this.originPlaceId = null;
  this.destinationPlaceId = null;
  this.travelMode = 'WALKING';
  var originInput = document.getElementById('origin-input');
  var destinationInput = document.getElementById('destination-input');
  var modeSelector = document.getElementById('mode-selector');
  this.directionsService = new google.maps.DirectionsService;
  this.directionsDisplay = new google.maps.DirectionsRenderer;
  this.directionsDisplay.setMap(map);

  var originAutocomplete = new google.maps.places.Autocomplete(
      originInput, {placeIdOnly: true});
  var destinationAutocomplete = new google.maps.places.Autocomplete(
      destinationInput, {placeIdOnly: true});

  this.setupClickListener('changemode-walking', 'WALKING');
  this.setupClickListener('changemode-transit', 'TRANSIT');
  this.setupClickListener('changemode-driving', 'DRIVING');

  this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
  this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

  this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
  this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
  this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
}

// Sets a listener on a radio button to change the filter type on Places
// Autocomplete.
AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) {
  var radioButton = document.getElementById(id);
  var me = this;
  radioButton.addEventListener('click', function() {
    me.travelMode = mode;
    me.route();
  });
};

AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
  var me = this;
  autocomplete.bindTo('bounds', this.map);
  autocomplete.addListener('place_changed', function() {
    var place = autocomplete.getPlace();
    if (!place.place_id) {
      window.alert("Please select an option from the dropdown list.");
      return;
    }
    if (mode === 'ORIG') {
      me.originPlaceId = place.place_id;
    } else {
      me.destinationPlaceId = place.place_id;
    }
    me.route();
  });

};

AutocompleteDirectionsHandler.prototype.route = function() {
  if (!this.originPlaceId || !this.destinationPlaceId) {
    return;
  }
  var me = this;

  this.directionsService.route({
    origin: {'placeId': this.originPlaceId},
    destination: {'placeId': this.destinationPlaceId},
    travelMode: this.travelMode
  }, function(response, status) {
    if (status === 'OK') {
      me.directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
};
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHCX3fnb5_Ks3MMYqXITq8Lz5CnvaDqmw&libraries=places&callback=initMap"></script>

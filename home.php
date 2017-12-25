<?php
$title = "Covoiturage sur mesure"
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>covoiturageCSM</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="icon" type="image/x-icon" href="img/favicon.ico" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!--link rel="stylesheet" type="text/css" href="css/csm.css"-->
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="notification.php"><i style="color: lightblue">convoiturage<strong>SURMESURE</strong></i></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage"><span class="glyphicon glyphicon-home"></span> HOME</a></li>
        <li><a href="#band"><span class="glyphicon glyphicon-asterisk"> BAND</a></li>
        <li><a href="#tour"><span class="glyphicon glyphicon-cloud"> TOUR</a></li>
        <li><a href="#contact"><span class="glyphicon glyphicon-user"> CONTACT</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-plus"> MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Merchandise</a></li>
            <li><a href="#">Extras</a></li>
            <li><a href="#">Media</a></li>
          </ul>
        </li>
        <!--li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li-->
        <form class="navbar-form navbar-left">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Search..">
          </div>
          <button type="submit"><span class="glyphicon glyphicon-search"></button>
        </form>
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="img/lola1.jpg" alt="New York" width="1200" height="700">
        <div class="w3-display-middle" style="width:40%">
          <div class="w3-container w3-white w3-padding-16 myLink">
            <h3>Trouvez un itinéraire </h3>
            <div class="w3-row-padding" style="margin:0 -16px;" id="ola">
              <div class="w3-half">
                <label>Ville de départ</label>
                <input class="w3-input w3-border" type="text" id="depart" placeholder="Departing from">
              </div>
              <div class="entry w3-half"  id="fields">
                <label class="control-label" for="field1">Ville d'arrivée</label>
                <input class="form-control; w3-input w3-border" name="fields[]" type="text" id="arrive" placeholder="Arriving at">
              </div>
            </div>
          <hr>
          <div>
            <button class="w3-third w3-bar-item w3-button ok"><i class="fa fa-plus w3-margin-right"></i>RAJOUTER ETAPE</button>
            <button class="w3-third w3-bar-item w3-button" onclick="myTOTO()"><i class="fa fa-street-view w3-margin-right"></i>PREVISUALISER</button>
            <button class="w3-third w3-bar-item w3-button no"><i class="fa fa-minus w3-margin-right"></i>RETIRER ETAPE</button>
          </div>
<script>
</script>
          <!--hr><hr-->
            <div id="map" style="width:600px;height:340px;background:yellow"></div>
            <h4 id="lolo"></h4>
          </div>
        </div>

        <div class="carousel-caption">
          <h3>New York</h3>
          <p>The atmosphere in New York is lorem ipsum.</p>
        </div>
      </div>

      <div class="item">
        <img src="img/lola2.jpg" alt="Chicago" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago - A night we won't forget.</p>
        </div>
      </div>

      <div class="item">
        <img src="img/lola3.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The Band Section) -->
<div id="band" class="container text-center">
  <h3>THE BAND</h3>
  <p><em>We love music!</em></p>
  <p>We have created a fictional band website. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="img/lola1.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>Guitarist and Lead Vocalist</p>
        <p>Loves long walks on the beach</p>
        <p>Member since 1988</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="img/lola2.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>Drummer</p>
        <p>Loves drummin'</p>
        <p>Member since 1988</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="img/lola3.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>Bass player</p>
        <p>Loves math</p>
        <p>Member since 2005</p>
      </div>
    </div>
  </div>
</div>

<!-- Container (TOUR Section) -->
<div id="tour" class="bg-1">
  <div class="container">
    <h3 class="text-center">TOUR DATES</h3>
    <p class="text-center">Lorem ipsum we'll play you some music.<br> Remember to book your tickets!</p>
    <ul class="list-group">
      <li class="list-group-item">September <span class="label label-danger">Sold Out!</span></li>
      <li class="list-group-item">October <span class="label label-danger">Sold Out!</span></li>
      <li class="list-group-item">November <span class="badge">3</span></li>
    </ul>

    <div class="row text-center">
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="img/lola1.jpg" alt="Paris" width="400" height="300">
          <p><strong>Paris</strong></p>
          <p>Friday 27 November 2015</p>
          <button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="img/lola2.jpg" alt="New York" width="400" height="300">
          <p><strong>New York</strong></p>
          <p>Saturday 28 November 2015</p>
          <button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="img/lola3.jpg" alt="San Francisco" width="400" height="300">
          <p><strong>San Francisco</strong></p>
          <p>Sunday 29 November 2015</p>
          <button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Tickets</h4>
        </div>
        <div class="modal-body">
          <form role="form">
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-shopping-cart"></span> Tickets, $23 per person</label>
              <input type="number" class="form-control" id="psw" placeholder="How many?">
            </div>
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Send To</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
            </div>
              <button type="submit" class="btn btn-block">Pay
                <span class="glyphicon glyphicon-ok"></span>
              </button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
          <p>Need <a href="#">help?</a></p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
  <h3 class="text-center">Contact</h3>
  <p class="text-center"><em>Pour mieux vous servir de plus en plus</em></p>

  <div class="row">
    <div class="col-md-4">
      <p>Vous voulez en savoir plus ?</p>
      <p><span class="glyphicon glyphicon-user"></span>BEYA NTUMBA Joel</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>Montpellier, France</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: +33 6 05 84 48 70</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: joelbeya.bj@mail.com</p>
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <br>
      <div class="row">
        <div class="col-md-12 form-group">
          <button class="btn pull-right" type="submit">Envoyer</button>
        </div>
      </div>
    </div>
  </div>
  <br>
  <h3 class="text-center">A propos des concepteurs </h3>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Professeur</a></li>
    <li><a data-toggle="tab" href="#menu1">Professeur</a></li>
    <li><a data-toggle="tab" href="#menu2">Etudiant</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h2>Pierre POMPIDOR</h2>
      <p>Professeur encadreur du projet</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h2>Michel MEYNARD</h2>
      <p>Professeur encadrant pour le meme module</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h2>Joel BEYA NTUMBA</h2>
      <p>Etudiant réalisateur du projet.</p>
    </div>
  </div>
</div>

<!-- Add Google Maps -->
<div id="googleMap"></div>
<script>
function myMap() {
var myCenter = new google.maps.LatLng(43.6109200, 3.8772300);
var mapProp = {center:myCenter, zoom:12, scrollwheel:false, draggable:false, mapTypeId:google.maps.MapTypeId.ROADMAP};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
var marker = new google.maps.Marker({position:myCenter});
marker.setMap(map);
}
function depo() {
  var input = document.getElementById("depart");
  var options = {
  types: ['(cities)'],
  componentRestrictions: {country: 'fr'}
  };
  var autocomplete = new google.maps.places.Autocomplete(input, options);
}
function Arriver() {
  var input = document.getElementById("arrive");
  var options = {
  types: ['(cities)'],
  componentRestrictions: {country: 'fr'}
  };
  var autocomplete = new google.maps.places.Autocomplete(input, options);
}
function activatePlacesSearches() {
  depo();
  Arriver();
  myMap();
  herMap();
}
function myTOTO() {
  var x = document.getElementById("map");
  if (x.style.display === "none") {
      x.style.display = "block";
  } else {
      x.style.display = "none";
  }
  //getLocation();
}
function herMap() {
  var mapOptions = {
    center: new google.maps.LatLng(43.6111, 3.87667),
    mapTypeControl: false,
    scrollwheel:false,
    draggable:false,
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.SATELLITE
  }
  var map = new google.maps.Map(document.getElementById("map"), mapOptions);
  new AutocompleteDirectionsHandler(map);
}

function AutocompleteDirectionsHandler(map) {
  this.map = map;
  this.originPlaceId = null;
  this.destinationPlaceId = null;
  this.travelMode = 'DRIVING';

  var originInput = document.getElementById('depart');
  var destinationInput = document.getElementById('arrive');
  this.directionsService = new google.maps.DirectionsService;
  this.directionsDisplay = new google.maps.DirectionsRenderer;
  this.directionsDisplay.setMap(map);

  var originAutocomplete = new google.maps.places.Autocomplete(originInput, {placeIdOnly: true});
  var destinationAutocomplete = new google.maps.places.Autocomplete(destinationInput, {placeIdOnly: true});

  this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
  this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

  this.map.controls[google.maps.ControlPosition].push(originInput);
  this.map.controls[google.maps.ControlPosition].push(destinationInput);

}

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
     travelMode: 'DRIVING'
   }, function(response, status) {
     if (status === 'OK') {
       me.directionsDisplay.setDirections(response);
         var distance = response.routes[0].legs[0].distance.text;
            var duration = response.routes[0].legs[0].duration.text;
         var distancex = response.routes[0].legs[0].distance.value;
            var durationx = response.routes[0].legs[0].duration.value;
            var txt1 = "Distance de parcours approximative probable ";
            var txt2 = "Durée probable de parcours pour le trajet ";
            var txt3 = "Ce que ça peut vous couter: ";
            var txt4 = "Croyez moi, on vous fait un cadeau à ce prix là";
            var prix = Math.ceil(distancex/durationx);
            var doug = txt1 + distance + "\n"+ txt2 + duration + "\n" + txt3 + prix + "\u20ac" + "\n" + txt4;
            var element = document.getElementById("lolo");
             element.innerHTML = doug;
     } else {
       window.alert('Directions request failed due to ' + status);
     }
   });
};
// marker = new google.maps.Marker({
//   map: map,
//   draggable: true,
//   animation: google.maps.Animation.DROP,
//   position: {lat: 43.6111, lng: 3.87667}
// });
// marker.addListener('click', toggleBounce);
// directionsDisplay.setMap(map);
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHCX3fnb5_Ks3MMYqXITq8Lz5CnvaDqmw&libraries=places&callback=activatePlacesSearches"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <div class="w3-row-padding">
<div class="w3-third">
<h2>JAVASCRIPT</h2>
  <p>Utiliser pour la partie dynamique du site</p>
  <p>En complément on a rajour de l'Ajax, JQuery, Angular...</p>
</div>

<div class="w3-third">
  <h2>PHP</h2>
  <p>Utiliser coté serveur</p>
  <p>Affichahge avec html5</p>
  <p>Design avec CSS et les autres frameworks tels que bootstrap,...</p>
</div>

<div class="w3-third">
  <h2>MYSQL</h2>
  <p>Utiliser coté système de gestion de Données</p>
  <p>Plus de fonctionnalités avec du PL/SQL pour a partie fonctionnelle</p>
</div>
</div>
  <div class="w3-xlarge w3-section">
    <a href="https://wwww.facebook.com"><i class="fa fa-facebook-official w3-hover-opacity"></i></a>
    <a href="https://twitter.com/"><i class="fa fa-twitter w3-hover-opacity"></i></a>
    <a href="https://www.snapchat.com/l/fr-fr/"><i class="fa fa-snapchat w3-hover-opacity"></i></a>
    <a href="https://www.instagram.com/"><i class="fa fa-instagram w3-hover-opacity"></i></a>
    <a href="https://www.linkedin.com/feed/"><i class="fa fa-linkedin w3-hover-opacity"></i></a>
</div>
<br> <br>
<?php
  setlocale(LC_TIME, 'fr-FR');
  echo 'Date du jour de connexion '.strftime("%A %d %B %Y").' à Montpellier <br/>';
?>
<p style=" text-align: center;">&copy;Copyright <?php echo date("Y");?>, tous droits réservés</p>
</footer>

<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip();
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();
      // Store hash
      var hash = this.hash;
      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})
</script>
<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});

</script>
</body>
</html>

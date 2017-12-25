<?php
require_once 'fonctioncsm.php';

if (!isset($_SESSION['email'])) {
  header("location: index.php");
  exit();
}

require 'header.php';
?>

<div class="row-fluid" id="main-content">
		<div class="span1"></div>
        <div class="span10">
		<h2 align="center"><small> Notifications</small></h2>
        <table class="table table-hover">
            <thead><tr>
			<th>ID</th>
            <th>Date</th>
            <th>Trajet</th>
			<th>Utilisateur</th>
            <th>Action</th>
            </tr>
			</thead>
            <tbody>
    </tbody>
    </table>

</div>
		<div class="span1"></div>
</div>
</div>
  <div id="push"></div>
    </div> <!-- /wrap -->
    <div id="footer">
      <div class="container">
        <p style="text-align: center;" class="credit">Copyright © BEYA NTUMBA Joel</a> - <a href="apropos.php">À propos</a></p>
      </div>
    </div>

	<!-- JS placé à la fin pour un chargement plus rapide -->

	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="js/datetimepicker.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

	<script>
		$(".dropdown-menu li a").click(function(){
			var texte = $(this).text();
            $('#fartDropDown').html(texte);

		});

		function ApprouveRequete (slno, stat) {
			if (stat == "0") {
				$.post("includes/miseajournotification.php", { type: "1", numeroNo: slno, stat: "R" })
				.done(function(data) {
					//alert("Données chargées : " + data);
					location.reload();
				});
            }
            else if (stat == "1") {
				$.post("includes/miseajournotification.php", { type: "1", numeroNo: slno, stat: "A" })
				.done(function(data) {
					//alert("Données chargées : " + data);
					location.reload();
				});
            }
            else {
				alert("Erreur 8656896753");
            }
		}

		$('.dropdown-toggle').dropdown();

    </script>

    <script type="text/javascript">
		$('#choixdatedebut').datetimepicker({
			format: 'yyyy-MM-dd hh:mm:ss',
		});

		$('td:nth-child(1),th:nth-child(1)').hide(); // pour cacher les ID
		$('#tabListe').find('tr').click( function() {
			var colonne = $(this).find('td:first').text();
			window.location.href = "trajet.php?id="+colonne;
		});
    </script>

	<script type="text/javascript">
    //<![CDATA[
		$(".source li a").click(function(){
			$("#source").html($(this).text()+"&nbsp<span class='caret'></span>");
			$("#formsource").val($(this).text());
		});

		$(".destination li a").click(function(){
			$("#destination").html($(this).text()+"&nbsp<span class='caret'></span>");
			$("#formdestination").val($(this).text());
		});

		function load() {
			var carte = new google.maps.Map(document.getElementById("carte"), { center: new google.maps.LatLng(43.636708, 3.852897), zoom: 10, mapTypeId: 'roadmap' });
			directionsDisplay = new google.maps.DirectionsRenderer();
			directionsDisplay.setMap(carte);
			var infoWindow = new google.maps.InfoWindow;

					}

		var directionsService = new google.maps.DirectionsService();

		function calcRoute(debut, fin, ptspassage) {
			var requete = {
				origin:debut,
				destination:fin,
				waypoints: ptspassage,
				optimizeWaypoints: true,
				travelMode: google.maps.DirectionsTravelMode.DRIVING
			};

			directionsService.route(requete, function(repose, statut) {
				if (statut == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setDirections(repose);
				}
			});
		}


  </script>

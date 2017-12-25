<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title><?php echo isset($title) ? $title : "Covoituragesurmesure" ; ?></title>
    <meta name="author" content="BEYA NTUMBA Joel"/>
  	<meta name="description" content="Site de Covoiturage">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--?php
  isset($bank) ? $bank : false ;
	if($bank) {
		echo '<link href="csm.css" rel="stylesheet" type="text/css" />';
	} else {
		echo '<link href="csm2.css"rel="stylesheet" type="text/css" />';
	}
?-->

    <link rel="stylesheet" type="text/css" href="csm.css">
  </head>
  <body ="myPage" data-spy="scroll" data-target=".topnav" data-offset="50">
    <div class="topnav">
      <a href="home.php"><i class="fa fa-home"></i> Accueil/Recherche_Trajet </a>
      <a href="partagertrajet.php"><i class="fa fa-road"></i> Partager un trajet </a>
      <a href="notification.php"><i class="fa fa-envelope"></i> Notifications </a>
      <a href="apropos.php"><i class="fa fa-lightbulb-o"></i> À propos </a>
      <div class="search-container">
        <a href="enregistrement.php"><i class="fa fa-user"></i> Profil  </a>
        <a href="admin.php"><i class="fa fa-user"></i> Admin  </a>
      	<a href="deconnexion.php"><i class="fa fa-sign-out"></i> Déconnexion </a>
      </div>
    </div>

<?php
//Fiche d'enregistrement
include('fonctioncsm.php');

if (isset($_SESSION['email'])) {
    header("location:home.php");
}

if (isset($_POST['register'])) {

    $nom = trim($_POST['nom']);
		$nom = strip_tags($nom);
		$nom = htmlspecialchars($nom);

		$prenom = trim($_POST['prenom']);
		$prenom = strip_tags($prenom);
		$prenom = htmlspecialchars($prenom);

		$sexe = trim($_POST['sexe']);
		$sexe = strip_tags($sexe);
		$sexe = htmlspecialchars($sexe);

		$email = trim($_POST['email']);
		$email = strip_tags($email);
		$email = htmlspecialchars($email);

		$mdp = trim($_POST['mdp']);
		$mdp = strip_tags($mdp);
		$mdp = htmlspecialchars($mdp);

    $date_nais = $_POST['date_nais'];

		// basic name validation
		if (empty($nom)) {
			$error = true;
			$nameError = "Champ vide, veuillez le remplir ce champs !";
		} else if (strlen($nom) < 3) {
			$error = true;
			$nameError = "Au moins plus de 3 caractères s'il vous plait";
		} else if (!preg_match("/^[a-zA-Z ]+$/",$nom)) {
			$error = true;
			$nameError = "Ne peut contenir que des lettres et espaces, rien d'autres";
		}

		if (empty($prenom)) {
			$error = true;
			$nameError = "Champ vide, veuillez le remplir ce champs !";
		} else if (strlen($prenom) < 3) {
			$error = true;
			$nameError = "Au moins plus de 3 caractères s'il vous plait";
		} else if (!preg_match("/^[a-zA-Z ]+$/",$prenom)) {
			$error = true;
			$nameError = "Ne peut contenir que des lettres et espaces, rien d'autres";
		}

	  if (empty($sexe)) {
	    $error = true;
	    $genderErr = "Sexe recquis";
	  }


		//basic email validation
		if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
			$error = true;
			$emailError = "Entrez email valide s'il vous plait";
		} else {
			// check email exist or not
			$connexion = connexionBDDCSM();
			$query = $connexion->prepare('SELECT email FROM csm.membre WHERE email=?');
			$query->execute(array($email));
			$count = $query->rowCount();
			if($count!=0){
				$error = true;
				$emailError = "Cet email est déjà utilisé, changez !";
			}
		}
// password validation
		if (empty($mdp)){
			$error = true;
			$passError = "S'il vous un mot de passe.";
		} else if(strlen($mdp) < 6) {
			$error = true;
			$passError = "Mot de passe doit contenir au moins 6 caractères";
		}

		// password encrypt using SHA256();
		$mdp = hash('sha256', $mdp);


  if (!$error) {
    $connexion = connexionBDDCSM();
    $insertion="INSERT INTO csm.membre(nom, prenom, date_nais, sexe, email, mdp, active, role)
                VALUES('$nom', '$prenom', '$date_nais', '$sexe', '$email', '$mdp', '0', '1')";
    $connexion->exec($insertion);
    header("location:index.php");
  }
}
require_once 'header.php';
?>


<div class="container" style="width:100%; max-width:600px">
 <h2 align="center">Merci de bien renseigner tous les champs pour votre inscription !</h2>
 <br />
 <div class="panel panel-default">
  <div class="panel-heading"><h4 style="text-align:center;">Inscription</h4></div>
  <div class="panel-body">
   <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
     <div class="form-group">
       <label>Votre nom</label>
       <input type="text" name="nom" class="form-control" required />
       <span class="error">* <?php echo $nameErr;?></span>
     </div>
     <div class="form-group">
       <label>Votre prenom</label>
       <input type="text" name="prenom" class="form-control" required />
       <span class="error">* <?php echo $nameErr;?></span>
     </div>
     <div class="form-group">
       <label>Votre date de naissance</label>
        <input type="date" name="date_nais" class="form-control" max="2018-12-31"  min="1900-01-01" required />
      <label>Votre sexe </label>
        <input type="radio" name="sexe" <?php if (isset($sexe) && $sexe=="F") echo "checked";?> value="F">Femme
        <input type="radio" name="sexe" <?php if (isset($sexe) && $sexe=="M") echo "checked";?> value="M">Homme
        <input type="radio" name="sexe" <?php if (isset($sexe) && $sexe=="O") echo "checked";?> value="M">Autre
        <span class="error">* <?php echo $sexeErr;?></span>
    </div>
    <div class="form-group">
      <label>Votre mail(Qui sera de fait votre pseudo aussi)</label>
      <input type="email" name="email" class="form-control" required />
      <span class="error">* <?php echo $emailErr;?></span>
    </div>
    <div class="form-group">
     <label>Votre mot de passe</label>
     <input type="password" name="mdp" class="form-control" pattern="[a-zA-Z ]+" required />
     <span class="error">* <?php echo $mdpErr;?></span>
    </div>
    <div class="form-group">
     <input type="submit" name="register" id="register" value="Register" class="btn btn-info" />
    </div>
   </form>
   <p align="right"><a href="index.php">Login</a></p>
  </div>
 </div>
</div>
<script style="stylesheet" type="text/javascript" src="csm2.js" charset="utf-8"></script>

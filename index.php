<?php
require_once 'fonctioncsm.php';
if (isset($_SESSION['email']) != "") {
  header("Location: home.php");
  exit();
}

if (isset($_POST['register']))
{
  $email = trim($_POST['email']);
  $email = strip_tags($email);
  $email = htmlspecialchars($email);

  $mdp = trim($_POST['mdp']);
  $mdp = strip_tags($mdp);
  $mdp = htmlspecialchars($mdp);

  $mdp = hash('sha256', $mdp);

  $connexion = connexionBDDCSM();
  $req = $connexion->prepare('SELECT id, email, mdp FROM csm.membre WHERE email=?');
  $req->execute(array($email));
  $toto=$req->fetch();
  if (!$toto) {
    alert("Identifiant ou mot de passe incorrecte ou inconu de notre base de donnée ");
    header("location:enregistrement.php");
  } else {
    $_SESSION['email'] = $toto['email'];
    $req = $connexion->prepare('UPDATE csm.membre SET active = "0" WHERE email = ?');
    $req->execute(array($_SESSION['email']));
    header("location:home.php");
    exit();
  }
}
?>
<?php

include 'header.php'; ?>
<br><br>
<div class="container" style="width:100%; max-width:600px">
 <h2 align="center">Connexion au site pour l'activation de votre compte</h2>
 <br />
 <div class="panel panel-default">
  <div class="panel-heading"><h4>Register</h4></div>
  <div class="panel-body">
   <form method="post" id="register_form">
    <div class="form-group">
      <label>Votre mail</label>
      <input type="email" name="email" class="form-control" required />
    </div>
    <div class="form-group">
     <label>Votre mot de passe</label>
     <input type="password" name="mdp" class="form-control" pattern="[a-zA-Z ]+" required />
    </div>
    <div class="form-group">
     <input type="submit" name="register" id="register" value="Register" class="btn btn-info" />
    </div>
   </form>
   <p style="text-align:right;"><a href="enregistrement.php">Inscription</a></p>
  </div>
 </div>
</div>

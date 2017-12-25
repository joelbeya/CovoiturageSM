<?php
session_start();

function connexionBDDCSM()
{
  $serveur = "localhost";
  $login = "root";
  $pass = "";
  try{
    $conn = new PDO("mysql:host=$serveur;toto=covoituragesm", $login, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }
  catch(PDOException $e){
    echo "Nous avons tout essayé sans pourvoir reussir !\nVotre base de donnée n'existe que dans vos reves ! lol ".$e->getMessage();
  }
  return $conn;
}

function securisation($donnee)
{
  $donnee = trim($donnee);
  $donnee = stripslashes($donnee);
  $donnee = strip_tags($donnee);
  $donnee = htmlspecialchars($donnee);
  return $donnee;
}
$error = false;
$nameErr = $emailErr = $sexeErr = $mdpErr = $dateErr = "";
$name = $email = $sexe = $mdpErr = $dateErr = "";

//Validation du nom et du prenom
function validationName($name)
{
  if (empty($name)) {
    $error = true;
    $nameErr = "Nom est recquis";
  } else if (strlen($name) < 3) {
      $error = true;
      $nameErr = "Nom doit avoir au moins trois caratères svp !";
    } else if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
        $error = true;
        $nameErr = "Rien que lettres et espaces admisent";
      } else {
        $name = securisation($name);
        }
  return $name;
}

function validationEmail($email)
{
  if (empty($email)) {
    $error = true;
    $emailErr = "Email est resquis";
  } else if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
      $error = true;
      $emailErr = "Veuillez entrer une adresse mail valide svp !";
  } else {
     $connexion = connexionBDDCSM();
     $query = $connexion->prepare('SELECT email FROM csm.membre WHERE email=?');
     $query->execute(arra($email));
     while ($toto=$query->fetch()) {
       if (!empty($toto['email'])) {
         $error = true;
         $emailErr = "Désolé, email déjà utilisé, essayez un autre";
         exit();
       } else {
        $email = securisation($email);
       }
     }
   }
   return $email;
}

// Validation de mot de passe
function validationMdp($mdp)
{
  if (empty($mdp)){
    $error = true;
    $passError = "Please enter password.";
  } else if(strlen($mdp) < 6) {
        $error = true;
        $passError = "Password must have atleast 6 characters.";
    } else {
      $mdp = securisation($mdp);
      //Encryptage du mot de passe en sha256
      $mdp = password_hash($mdp, PASSWORD_DEFAULT);
    }
    return $mdp;
}

//Validationn du sexe
function validationSexe($sexe)
{
  if (empty($sexe)) {
    $error = true;
    $sexeErr = "Genre est recquis";
  } else {
    $sexe = securisation($sexe);
  }
  return $sexe;
}

?>

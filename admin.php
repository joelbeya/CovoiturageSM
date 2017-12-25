<?php
require 'fonctioncsm.php';
if (!isset($_SESSION['email'])) {
  $connexion = connexionBDDCSM();
	$statement = $connection->prepare("SELECT email FROM membre WHERE role = '0' ");//Dans la database 0 symoblise le role d'administrateur
	$statement->execute();
	$result = $statement->fetchAll();
	$statement->rowCount();
  if ($statement <= 0) {
    header("location: index.php");
    exit();
  }
}
?>

<?php
require_once 'fonctioncsm.php';

if (!isset($_SESSION['email'])) {
  header("location: index.php");
  exit();
}

require 'header.php';
?>

<div class="container box">
  <h1 align="center">Page reservé aux administrateurs du site</h1>
  <br />
  <div class="table-responsive">
    <br />
    <div align="right">
      <button type="button" id="add_button" data-toggle="modal" data-target="#userModal" class="btn btn-info btn-lg">Add</button>
    </div>
    <br /><br />
    <table id="user_data" class="table table-bordered table-striped">
      <thead>
        <tr>
          <th width="20%">Non du Covoitureur</th>
          <th width="30%">Trajet(s) assurés</th>
          <th width="20%">Avis du public</th>
          <th width="10%">Edit</th>
          <th width="10%">Delete</th>
        </tr>
      </thead>
    </table>

  </div>
</div>
</body>
</html>

<div id="userModal" class="modal fade">
<div class="modal-dialog">
<form method="post" id="user_form" enctype="multipart/form-data">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title">Rajouter covoitureur</h4>
    </div>
    <div class="modal-body">
      <label>Entrer le Nom</label>
      <input type="text" name="nom" id="nom" class="form-control" />
      <br />
      <label>Entrer le Prenom</label>
      <input type="text" name="prenom" id="prenom" class="form-control" />
      <br />
      <label>Entrer date de naissance</label>
      <input type="date" name="date_nais" id="date_nais" required/>
    </div>
    <div class="modal-footer">
      <input type="hidden" name="user_id" id="user_id" />
      <input type="hidden" name="operation" id="operation" />
      <input type="submit" name="action" id="action" class="btn btn-success" value="Add" />
      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
  </div>
</form>
</div>
</div>

<script type="text/javascript" language="javascript" >
$(document).ready(function(){
$('#add_button').click(function(){
$('#user_form')[0].reset();
$('.modal-title').text("Add User");
$('#action').val("Add");
$('#operation').val("Add");
$('#user_uploaded_image').html('');
});

var dataTable = $('#user_data').DataTable({
"processing":true,
"serverSide":true,
"order":[],
"ajax":{
  url:"fetch.php",
  type:"POST"
},
"columnDefs":[
  {
    "targets":[0, 3, 4],
    "orderable":false,
  },
],

});

$(document).on('submit', '#user_form', function(event){
event.preventDefault();
var firstName = $('#first_name').val();
var lastName = $('#last_name').val();
var extension = $('#user_image').val().split('.').pop().toLowerCase();
if(extension != '')
{
  if(jQuery.inArray(extension, ['gif','png','jpg','jpeg']) == -1)
  {
    alert("Invalid Image File");
    $('#user_image').val('');
    return false;
  }
}
if(firstName != '' && lastName != '')
{
  $.ajax({
    url:"insert.php",
    method:'POST',
    data:new FormData(this),
    contentType:false,
    processData:false,
    success:function(data)
    {
      alert(data);
      $('#user_form')[0].reset();
      $('#userModal').modal('hide');
      dataTable.ajax.reload();
    }
  });
}
else
{
  alert("Both Fields are Required");
}
});

$(document).on('click', '.update', function(){
var user_id = $(this).attr("id");
$.ajax({
  url:"fetch_single.php",
  method:"POST",
  data:{user_id:user_id},
  dataType:"json",
  success:function(data)
  {
    $('#userModal').modal('show');
    $('#nom').val(data.nom);
    $('#prenom').val(data.prenom);
    $('.modal-title').text("Edit User");
    $('#user_id').val(user_id);
    $('#date_nais').html(data.date_nais);
    $('#action').val("Edit");
    $('#operation').val("Edit");
  }
})
});

$(document).on('click', '.delete', function(){
var user_id = $(this).attr("id");
if(confirm("Are you sure you want to delete this?"))
{
  $.ajax({
    url:"delete.php",
    method:"POST",
    data:{user_id:user_id},
    success:function(data)
    {
      alert(data);
      dataTable.ajax.reload();
    }
  });
}
else
{
  return false;
}
});


});
</script>

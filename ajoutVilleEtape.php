<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

    <title></title>
    <style>
    .entry:not(:first-of-type)
    {
      margin-top: 10px;
    }

    .glyphicon
    {
      font-size: 12px;
    }
    </style>
  </head>
  <body>
    <div class="container">
    	<div class="row">
            <div class="control-group" id="fields">
                <label class="control-label" for="field1">Nice Multiple Form Fields</label>
                <div class="controls">
                    <form role="form" autocomplete="off">
                        <div class="entry input-group col-xs-3">
                            <input class="form-control" name="fields[]" type="text" placeholder="Type something" />
                        	<span class="input-group-btn">
                                <button class="btn btn-success btn-add" type="button">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </span>
                        </div>
                    </form>
                <br>
                <small>Press <span class="glyphicon glyphicon-plus gs"></span> to add another form field :)</small>
                </div>
            </div>
    	</div>
    </div>
    <script>
    $(function()
    {
      $(document).on('click', '.btn-add', function(e)
      {
          e.preventDefault();

          var controlForm = $('.controls form:first'),
              currentEntry = $(this).parents('.entry:first'),
              newEntry = $(currentEntry.clone()).appendTo(controlForm);

          newEntry.find('input').val('');
          controlForm.find('.entry:not(:last) .btn-add')
              .removeClass('btn-add').addClass('btn-remove')
              .removeClass('btn-success').addClass('btn-danger')
              .html('<span class="glyphicon glyphicon-minus"></span>');
      }).on('click', '.btn-remove', function(e)
      {
      $(this).parents('.entry:first').remove();

      e.preventDefault();
      return false;
    });
    });
    </script>
  </body>
</html>

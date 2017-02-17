<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Supervisor_Default3" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
  <title>Require a Drawn Signature · Signature Pad</title>
  <style>
    body { font: normal 100.01%/1.375 "Helvetica Neue",Helvetica,Arial,sans-serif; }
  </style>
  <link href="jquery.signaturepad.css" rel="stylesheet">
  <!--[if lt IE 9]><script src="../assets/flashcanvas.js"></script><![endif]-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

</head>
<body>
  <form method="post" action="" class="sigPad" runat="server">
    
    <p class="drawItDesc">Draw your signature</p>
    <ul class="sigNav">
      <li class="drawIt"><a href="#draw-it" >Draw It</a></li>
      <li class="clearButton"><a href="#clear">Clear</a></li>
    </ul>
    <div class="sig sigWrapper">
      <div class="typed"></div>
      <canvas class="pad" width="198" height="55" id="thecanvas"></canvas>
      <input type="hidden" name="output" class="output">
    </div>
    
       <input type="button" id="btnSave" name="btnSave" value="Save the canvas to server"  />
           



<script type="text/javascript">

    // Send the canvas image to the server.

    $(function () {

        $("#btnSave").click(function () {
            

             var image = document.getElementById("thecanvas").toDataURL("image/png");

              image = image.replace('data:image/png;base64,', '');
            
              $.ajax({
                  type: 'POST', url: 'Default.aspx/UploadImage', data: '{ "imageData" : "' + image + '" }', contentType: 'application/json; charset=utf-8', dataType: 'json',
                  success: function (msg) {

                      alert('Image saved successfully !');

                  }
                  

            });

         });

     });

</script>
      <script src="../js/jquery.signaturepad.js"></script>
  <script>
    $(document).ready(function() {
      $('.sigPad').signaturePad({drawOnly:true});
    });
  </script>
  <script src="../js/json2.min.js"></script>
  <image id="embedImage"></image>
  </form>

  
</body>

</html>

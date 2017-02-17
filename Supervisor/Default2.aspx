<%@ Page Title="" Language="C#" MasterPageFile="~/Supervisor/SupervisorMaster.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Supervisor_Default2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <style>
    body { font: normal 100.01%/1.375 "Helvetica Neue",Helvetica,Arial,sans-serif; }
  </style>
  <link href="jquery.signaturepad.css" rel="stylesheet">
  <!--[if lt IE 9]><script src="../assets/flashcanvas.js"></script><![endif]-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph_mainSection" method="post"  Runat="Server">

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
                  type: 'POST', url: 'Default2.aspx/UploadImage', data: '{ "imageData" : "' + image + '" }', contentType: 'application/json; charset=utf-8', dataType: 'json',
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
</asp:Content>


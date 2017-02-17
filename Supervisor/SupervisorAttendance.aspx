<%@ Page Title="" Language="C#" MasterPageFile="~/Supervisor/SupervisorMaster.master" AutoEventWireup="true" CodeFile="SupervisorAttendance.aspx.cs" Inherits="Supervisor_SupervisorAttendance" %>


<asp:Content ID="Header" runat="server" contentplaceholderid="Header"> 
     <style>
    body { font: normal 100.01%/1.375 "Helvetica Neue",Helvetica,Arial,sans-serif; }
  </style>
  <link href="jquery.signaturepad.css" rel="stylesheet">
  <!--[if lt IE 9]><script src="../assets/flashcanvas.js"></script><![endif]-->
     <link href="jquery.signaturepad.css" rel="stylesheet">
  <!--[if lt IE 9]><script src="../assets/flashcanvas.js"></script><![endif]-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script src="../js/jsign.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script type="text/javascript">
            
            moveIcon(1);

         
          
            function test() {
                var canvas = document.getElementById('thecanvas');

                var image = document.getElementById("thecanvas").toDataURL("image/png");

                image = image.replace('data:image/png;base64,', '');

                $.ajax({
                    type: 'POST', url: 'SupervisorAttendance.aspx/UploadImage', data: '{ "imageData" : "' + image + '" }', contentType: 'application/json; charset=utf-8', dataType: 'json',
                    success: function (msg) {
                        


                    }



                });

            }
            function testend() {
                var canvas = document.getElementById('thecanvasend');

                var image = document.getElementById("thecanvasend").toDataURL("image/png");

                image = image.replace('data:image/png;base64,', '');

                $.ajax({
                    type: 'POST', url: 'SupervisorAttendance.aspx/UploadImage', data: '{ "imageData" : "' + image + '" }', contentType: 'application/json; charset=utf-8', dataType: 'json',
                    success: function (msg) {



                    }



                });

            }

            $(function () {

                $("#test1").click(function () {

                    var canvas = document.getElementById('thecanvas');
                    var context = canvas.getContext('2d');
                    context.clearRect(0, 0, canvas.width, canvas.height);



                });

            });

        </script>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="cph_mainSection">

  <%--  <asp:Button ID="Button1" runat="server" Text="Check Start Times" OnClientClick="return Drawdot()" OnClick="Button1_Click" class="big-button"/>--%>
  <asp:LinkButton ID="LinkButton2" class="big-button" runat="server" OnClick="Button1_Click">Check Start Times</asp:LinkButton>
      <asp:LinkButton ID="LinkButton1" class="big-button" runat="server" OnClick="Button2_Click">Check Finish Times</asp:LinkButton>
    <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>--%>
<%--    <asp:Button ID="Button2" runat="server" Text="Check Finish Times" OnClick="Button2_Click"  OnClientClick="return Drawdot()" class="big-button" />--%>
    

    <asp:MultiView ID="Mv1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged">
        <asp:View ID="View1" runat="server">

            <span class="title-bar">Start Times</span>
            <div id="startTimesContent" class="times-content" runat="server">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="RosterID,ShiftID">
                    <Columns>
                    <%--<asp:TemplateField HeaderText="RosterID" SortExpression="RosterID">
                        <ItemTemplate>
                            <asp:HiddenField  runat="server" Value='<%#Eval("RosterID")%>' ID="RosterID" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    
                        <asp:ImageField DataImageUrlField="Picture" HeaderText="Image" ReadOnly="true"></asp:ImageField>
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="Shiftstarttime" HeaderText="Start Time" SortExpression="Shiftstarttime" />
                        
                        <asp:TemplateField HeaderText="Alt Start Time">
                            <ItemTemplate>
                                 <asp:CheckBox ID="chkRow" runat="server" OnCheckedChanged="chkview_CheckedChanged" AutoPostBack="false"/>
                                
                                <asp:TextBox ID="txt_time" runat="server" TextMode="Time"></asp:TextBox>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Farm Block">
                            <ItemTemplate>
                                <asp:DropDownList ID="cbo_block" runat="server"></asp:DropDownList>
                                </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:kiwihortdbConnectionString %>" SelectCommand="SELECT tbl_Duty.RosterID, tbl_shift.ShiftID, [tbl_worker].[Picture], [tbl_worker].[FirstName], [tbl_worker].[LastName], tbl_Shift.Shiftstarttime, tbl_Shift.TotalTime FROM  tbl_Shift INNER JOIN tbl_Duty
                    ON tbl_Shift.ShiftID=tbl_Duty.ShiftID
                    INNER JOIN [dbo].[tbl_worker] on [tbl_worker].[WorkersId]=[tbl_Duty].[WorkerID]

                    WHERE tbl_Duty.Day = @wday AND tbl_Duty.SupervisorId = @name">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="" Name="wday" />
                        <asp:Parameter Name="name" />
                    </SelectParameters>
                </asp:SqlDataSource>

             
                <%--<asp:Button ID="btn_startSubmit" class="big-button" runat="server" Text="Button" OnClick="test" />--%>

     <%--           <input type="button" id="btn_startSubmit"   class="big-button" name="btnSave" value="Save the canvas to server"  />--%>
            <%--</div>--%>
            <div id="startTimesEmpty" class="empty-text" runat="server">
                <h1>All worker times have been completed.</h1>
            </div>

    <ul class="sigNav">
      <li class="drawIt"><a href="#draw-it" >Sign Here</a></li>
   <li class="clearButton"><a href="#clear" id="test1">Clear</a></li>
            <%--   <asp:Button ID="Button4" runat="server" Text="Submit" OnClientClick ="return test2()" class="clearButton" />--%>

    </ul>
    <div class="sig sigWrapper">
      <div class="typed"></div>
      <canvas class="pad" width="400" height="100" id="thecanvas" style="    background-color: white"></canvas>
      <input type="hidden" name="output" class="output"/>
    </div>
            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
    
<%--       <input type="button" id="btnSave" name="btnSave" value="Save the canvas to server"  />
           
--%>
                <asp:Button ID="btn_startSubmit" runat="server" Text="Submit" OnClientClick ="return test()" OnClick="btn_startSubmit_Click" class="big-button" />

            </div>




        
        </asp:View>


        <asp:View ID="View2" runat="server">
            <span class="title-bar">Finish Times</span>
            <div id="endTimesContent" class="times-content" runat="server">
            
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="RosterID">
        <Columns>
            <%--<asp:TemplateField HeaderText="RosterID" SortExpression="RosterID">
                <ItemTemplate>
                    <asp:HiddenField  runat="server" Value='<%#Eval("RosterID")%>' ID="RosterID" />
                </ItemTemplate>
            </asp:TemplateField>--%>

            <asp:ImageField DataImageUrlField="Picture" HeaderText="Image" ReadOnly="true"></asp:ImageField>
           <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="Shiftendtime" HeaderText="End Time" SortExpression="Shiftendtime" />
            <asp:TemplateField HeaderText="Attendance">
                <ItemTemplate>
                    <asp:CheckBox ID="chkRow" runat="server" OnCheckedChanged="chkview_CheckedChanged" AutoPostBack="false"/>
                    <asp:TextBox ID="txt_time" runat="server" TextMode="Time"></asp:TextBox>
                    
                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Break">
                <ItemTemplate>
                    <asp:TextBox ID="txt_break" runat="server" TextMode="number" Max="480"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>






    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:kiwihortdbConnectionString %>" SelectCommand="SELECT tbl_Duty.RosterID, [tbl_worker].[Picture], [tbl_worker].[FirstName], [tbl_worker].[LastName], tbl_Shift.Shiftendtime, tbl_Shift.TotalTime FROM  tbl_Shift INNER JOIN tbl_Duty 
ON tbl_Shift.ShiftID=tbl_Duty.ShiftID
INNER JOIN [dbo].[tbl_worker] on [tbl_worker].[WorkersId]=[tbl_Duty].[WorkerID]
INNER JOIN [dbo].[tbl_Attendance] on  [dbo].[tbl_Attendance].[RosterID]=[dbo].[tbl_Duty].[RosterID]

 WHERE  [dbo].[tbl_Duty].[supervisorID]=@name And [dbo].[tbl_Duty].[Day]= @wday  And [dbo].[tbl_Attendance].[Start_time] is not null  order by rosterId ASC">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="wday" />
            <asp:Parameter Name="name" />
        </SelectParameters>
</asp:SqlDataSource>

                 <ul class="sigNav">
      <li class="drawIt"><a href="#draw-it" >Sign Here</a></li>
      <li class="clearButton"><a href="#clear">Clear</a></li>
    </ul>
    <div class="sig sigWrapper">
      <div class="typed"></div>
      <canvas class="pad" width="400" height="100" id="thecanvasend" style="    background-color: white"></canvas>
      <input type="hidden" name="output" class="output"/>
    </div>
            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
    
<%--       <input type="button" id="btnSave" name="btnSave" value="Save the canvas to server"  />
           

--%>
               


    <asp:Button ID="Button3" runat="server" Text="Submit end time" OnClick="Button3_Click" OnClientClick ="return testend()" class="big-button" />
            </div>



            </div>
            <div id="endTimesEmpty" class="empty-text" runat="server">
                <h1>All worker times have been completed.</h1>
            </div>
        </asp:View>
    </asp:MultiView>
    <script src="../js/jquery.signaturepad.js"></script>
  <script>
    $(document).ready(function() {
      $('.sigPad').signaturePad({drawOnly:true});
    });
  </script>
  <script src="../js/json2.min.js"></script>
  <image id="embedImage"></image>
</asp:Content>



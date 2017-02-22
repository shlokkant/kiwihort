<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContractorProfile.aspx.cs" Inherits="ContractorProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Settings</title>
    <link rel="stylesheet" href="../login.css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet" />
</head>
<body>



    <div class="background-image"></div>

    <div class="entire-wrap">
        <div class="heading">
            <h3 style="text-align: center; margin-top: 20px;">Settings</h3>
            
        </div>

        <div class="row">
            <div class="cell cell-12 login-container">
                <form id="form1" class="settingsForm" runat="server">
    <div class="formThings" id="form-1">
    <h3 style="text-align: center; margin-top: 20px;">Edit Profile</h3>
            
        <h3>First Name</h3>
        <asp:TextBox ID="txt_firstName" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
        <h3>Middle Name</h3>
        <asp:TextBox ID="txt_middleName" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
        <h3>Last Name</h3>
        <asp:TextBox ID="txt_lastName" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
        <h3>Profile Image</h3>
        <div class="imageUploadTexts">
            <asp:FileUpload ID="fup_picture" runat="server" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="You can only upload JPG files." ControlToValidate="fup_picture" ValidationExpression="^.*\.(jpg|JPG|jpeg|JPEG|png|PNG)$"></asp:RegularExpressionValidator>
        </div>

        <h3>Email Address</h3>
        <asp:TextBox ID="txt_email" class="profileSettingsTextBox"  runat="server" CausesValidation="True" TextMode="Email" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
        <h3>Address</h3>
        <asp:TextBox ID="txt_address1" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        <asp:TextBox ID="txt_address2" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
        <h3>City</h3>
        <asp:TextBox ID="txt_city" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
        <h3>Region</h3>
        <asp:TextBox ID="txt_region" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>

        <h3>Postcode</h3>
        <asp:TextBox ID="txt_postcode" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        <%--This VISA section is only for workers. Also, there should be an option for New Zealand born individuals, or immigrants that don't require a Visa (like Australians)
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Visa Details"></asp:Label>
        <br />
        Visa Number<br />
        <asp:TextBox ID="txt_visaNumber" runat="server" CausesValidation="True"></asp:TextBox>
        <br />
        Registration Date<br />
        <asp:TextBox ID="txt_visaStartDate" runat="server" CausesValidation="True" TextMode="Date"></asp:TextBox>
        <br />
        Expiry Date<br />
        <asp:TextBox ID="txt_visaEndDate" runat="server" CausesValidation="True" TextMode="Date"></asp:TextBox>
        <br />
        Type<br />
        <asp:TextBox ID="txt_visaType" runat="server" CausesValidation="True"></asp:TextBox> --%>
        <br />
        <br />
        <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="Update Profile Settings"/>
        <h3 style="text-align: center; margin-top: 20px;">Worker Registration Code</h3>
        <asp:Button ID="btn_code" runat="server" OnClick="btn_code_Click" Text="Generate Code"/>
        <asp:TextBox ReadOnly="true" ID="txt_code" class="profileSettingsTextBox" runat="server" CausesValidation="True" onfocus="this.select();" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
    
    </div>
        <div class="formThings" id="form-2">
            <h3 style="text-align: center; margin-top: 20px;">View Farm Details</h3>
            <asp:DropDownList ID="cbo_selectFarm" runat="server" DataSourceID="SqlDataSource1" DataTextField="Farm_Name" DataValueField="FarmId">

            </asp:DropDownList><asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT * FROM tbl_farms"></asp:SqlDataSource>
            <h3 style="text-align: center; margin-top: 20px;">Add/Update Farm Details</h3>
        <h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sds_farms">
                <Columns>
                    <asp:BoundField DataField="Farm_Name" HeaderText="Farm_Name" SortExpression="Farm_Name" />
                    <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1" />
                    <asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="Address2" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" />
                    <asp:BoundField DataField="postcode" HeaderText="postcode" SortExpression="postcode" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds_farms" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="select [dbo].[tbl_farms].[Farm_Name] , [dbo].[tbl_address].[Address1],[dbo].[tbl_address].[Address2],[dbo].[tbl_address].[City],[dbo].[tbl_address].[Region], [dbo].[tbl_address].[postcode] from [dbo].[tbl_address] 

inner join [dbo].[tbl_farms] on [dbo].[tbl_farms].[FarmId]=[dbo].[tbl_address].[AddressId]"></asp:SqlDataSource>
            
            Farm Name</h3>

        <asp:TextBox ID="txt_farmName" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>

        
        <h3>Address</h3>
        <asp:TextBox ID="txt_addressFarm" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        <asp:TextBox ID="txt_address2Farm" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
        <h3>City</h3>
        <asp:TextBox ID="txt_cityFarm" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
        <h3>Region</h3>
        <asp:TextBox ID="txt_regionFarm" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>

        <h3>Postcode</h3>
        <asp:TextBox ID="txt_postcodeFarm" class="profileSettingsTextBox" runat="server" CausesValidation="True" AutoPostBack="True" OnTextChanged="txt_firstName_TextChanged"></asp:TextBox>
        
        <asp:Button ID="btn_submitFarm" runat="server" Text="Submit Farm Details" OnClick="btn_submitFarm_Click"/>
        <asp:Button ID="btn_cancel" runat="server" OnClick="btn_cancel_Click" Text="Return" />
    
    </div>
    </form>
            </div>
        </div>
    </div>

















    
</body>
</html>

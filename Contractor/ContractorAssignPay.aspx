<%@ Page Title="" Language="C#" MasterPageFile="~/Contractor/ContractorMaster.master" AutoEventWireup="true" CodeFile="ContractorAssignPay.aspx.cs" Inherits="Contractor_ContractorAssignPay" %>
    <asp:Content ID="Content2" ContentPlaceHolderID="Head" Runat="Server">

    
    </asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="cph_mainSection" Runat="Server">
    <script>
        moveIcon(3);
    </script>
    <asp:DropDownList ID="cbo_worker" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbo_worker_SelectedIndexChanged"></asp:DropDownList>
    $<asp:TextBox ID="txt_pay" runat="server"></asp:TextBox>
        
    <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" />

    <asp:RangeValidator MinimumValue="12.20" MaximumValue="50" ID="RangeValidator1" runat="server" ErrorMessage="Worker pay can't be less than $12.20 or greater than $50.00" ControlToValidate="txt_pay"></asp:RangeValidator>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="payrate" HeaderText="payrate" SortExpression="payrate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT RTRIM(firstname) + ' ' + RTRIM(lastname) AS name, '$' + CAST(CAST(payrate AS MONEY) AS VARCHAR(MAX)) AS payrate FROM tbl_worker"></asp:SqlDataSource>

</asp:Content>


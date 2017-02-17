<%@ Page Title="" Language="C#" MasterPageFile="~/Contractor/ContractorMaster.master" AutoEventWireup="true" CodeFile="ContractorReport.aspx.cs" Inherits="Contractor_ContractorReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_mainSection" Runat="Server">

    <script>

            moveIcon(2); //was 2
        </script>

    <div class="report-params">
        <h2>Search Filters</h2>
        <asp:DropDownList ID="cbo_day" class="dropdown dropdown-day" runat="server" OnSelectedIndexChanged="cbo_day_SelectedIndexChanged" autopostback="true"></asp:DropDownList>
        <asp:DropDownList ID="cbo_week" class="dropdown dropdown-week" runat="server" OnSelectedIndexChanged="cbo_week_SelectedIndexChanged" autopostback="true"></asp:DropDownList>
        <asp:DropDownList ID="cbo_farm" class="dropdown dropdown-farm" runat="server"></asp:DropDownList>
        <asp:Button ID="btn_submit" class="get-report-button" runat="server" Text="Get Report" OnClick="btn_submit_Click" />
    </div>

    <div class="report-table">
        <asp:GridView ID="dgd_workers" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:kiwihortdbConnectionString %>" SelectCommand="">
        

    </asp:SqlDataSource>




</asp:Content>


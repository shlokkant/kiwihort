<%@ Page Title="" Language="C#" MasterPageFile="~/Monitor/MonitorMaster.master" AutoEventWireup="true" CodeFile="MonitorBudget.aspx.cs" Inherits="Monitor_MonitorBudget" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="cph_mainSection" ContentPlaceHolderId="cph_mainSection" runat="server">

    <script>

            moveIcon(2);
        </script>

    <div class="monitor-budget-container">
        <div class="a-heading">
            <h2>Budgetting</h2>
        </div>

        <div class="farm-contractor">
            <div class="budget-farmlist budget-div">
                <label>Farm</label>
                <asp:DropDownList ID="dl_Farm" runat="server"></asp:DropDownList>
            </div>

            <div class="budget-contractor budget-div">
                <label>Contractor</label>
                <asp:DropDownList ID="dl_Contractor" runat="server"></asp:DropDownList>
            </div>
        </div>

        <div class="main-sub">
            <div class="budget-main-cat budget-div">
                <label>Main Category</label>
                <asp:DropDownList ID="dl_Mcat" runat="server" OnSelectedIndexChanged="dl_Mcat_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>

            <div class="budget-sub-cat budget-div">
                <label>Sub Category</label>
                <asp:DropDownList ID="dl_Cat" runat="server"></asp:DropDownList>
            </div>
        </div>

        
        <div class="amount-note">
            <div class="budget-amount budget-div">
                <label>Amount</label>
                $<asp:TextBox ID="txt_amount" runat="server"></asp:TextBox>
                <div class="budget-buttons budget-div">
                    <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" />
                </div>
            </div>

            <div class="budget-note budget-div">
                <label>Note</label>
                <asp:TextBox ID="txt_note" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>

        </div>

        <div class="budget-table">
            <div class="a-heading">
                <h2>Table Title</h2>
            </div>
            <asp:GridView ID="gv_budget" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Grower" HeaderText="Grower" SortExpression="Grower" />
                    <asp:BoundField DataField="Farm Name" HeaderText="Farm Name" SortExpression="Farm Name" />
                    <asp:BoundField DataField="Main Job Category" HeaderText="Main Job Category" SortExpression="Main Job Category" />
                    <asp:BoundField DataField="Job Subcategory" HeaderText="Job Subcategory" SortExpression="Job Subcategory" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                    <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" />
                </Columns>
            </asp:GridView>
        </div>
        

        

        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT * FROM [tbl_Budget]"></asp:SqlDataSource>

        

        

        
    </div>

</asp:Content>
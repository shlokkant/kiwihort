<%@ Page Title="" Language="C#" MasterPageFile="~/Monitor/MonitorMaster.master" AutoEventWireup="true" CodeFile="MonitorOrganiser.aspx.cs" Inherits="Monitor_MonitorOrganiser" %>

<asp:Content ID="cph_mainSection" ContentPlaceHolderID="cph_mainSection" Runat="Server">

    <script>

            moveIcon(1);
        </script>
    <br />
    <b>Contractor</b><br /><br />
    <asp:DropDownList ID="cbo_contractor" runat="server" AutoPostBack="True"></asp:DropDownList>

    <asp:GridView ID="dgd_contractorView" runat="server" AutoGenerateColumns="False" DataSourceID="sds_contractorView">
        <Columns>
            <asp:BoundField DataField="Workers" HeaderText="Workers" ReadOnly="True" SortExpression="Workers" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sds_contractorView" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT	RTRIM([dbo].[tbl_worker].[FirstName]) + ' ' + RTRIM([dbo].[tbl_worker].[LastName]) AS 'Workers'
FROM	[dbo].[tbl_worker]	INNER JOIN [dbo].[tbl_employees]
							ON [dbo].[tbl_worker].[WorkersId]
							 = [dbo].[tbl_employees].[workersid]
							INNER JOIN [dbo].[tbl_grower]
							ON [dbo].[tbl_employees].[growersid]
							 = [dbo].[tbl_grower].[GrowersId]
WHERE	[dbo].[tbl_employees].[growersid] IN
		(SELECT [workersid] FROM [dbo].[tbl_employees]
		WHERE [growersid] = 'monitr1') ORDER BY [dbo].[tbl_worker].[FirstName], [dbo].[tbl_worker].[LastName]"></asp:SqlDataSource>

    <br />
    <b>Work Assignment View</b><br /><br />
    <asp:DropDownList ID="cbo_startDate" runat="server" AutoPostBack="True" DataSourceID="sds_date" DataTextField="Date" DataValueField="Day"></asp:DropDownList>
    <asp:SqlDataSource ID="sds_date" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT DISTINCT CONVERT(VARCHAR, [dbo].[tbl_Duty].[Day], 103) AS 'Date', [dbo].[tbl_Duty].[Day] FROM [dbo].[tbl_Duty] WHERE [GrowerID] = 'grower4' ORDER BY [dbo].[tbl_Duty].[Day] DESC"></asp:SqlDataSource>
    <asp:DropDownList ID="cbo_endDate" runat="server" AutoPostBack="True" DataSourceID="sds_date" DataTextField="Date" DataValueField="Date"></asp:DropDownList>

    <asp:GridView ID="dgd_farmView" runat="server" AutoGenerateColumns="False" DataSourceID="sds_farmView">
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
            <asp:BoundField DataField="Farm" HeaderText="Farm" SortExpression="Farm" />
            <asp:BoundField DataField="Worker" HeaderText="Worker" ReadOnly="True" SortExpression="Worker" />
            <asp:BoundField DataField="Start Time" HeaderText="Start Time" ReadOnly="True" SortExpression="Start Time" />
            <asp:BoundField DataField="End Time" HeaderText="End Time" ReadOnly="True" SortExpression="End Time" />
            <asp:BoundField DataField="Total Hours" HeaderText="Total Hours" ReadOnly="True" SortExpression="Total Hours" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sds_farmView" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT	CONVERT(VARCHAR, [dbo].[tbl_Duty].[Day], 103) AS 'Date',
		[dbo].[tbl_farms].[Farm_Name] AS 'Farm',
		RTRIM([dbo].[tbl_worker].[FirstName]) + ' ' + RTRIM([dbo].[tbl_worker].[LastName]) AS 'Worker',
		CONVERT(VARCHAR, [dbo].[tbl_Shift].[Shiftstarttime], 100) AS 'Start Time',
		CONVERT(VARCHAR, [dbo].[tbl_Shift].[ShiftendTime], 100) AS 'End Time',
		CONVERT(VARCHAR, [dbo].[tbl_Shift].[TotalTime], 108) AS 'Total Hours'
FROM	[dbo].[tbl_worker]	INNER JOIN [dbo].[tbl_Duty]
							ON [dbo].[tbl_worker].[WorkersId]
							 = [dbo].[tbl_Duty].[WorkerID]
							INNER JOIN [dbo].[tbl_Shift]
							ON [dbo].[tbl_Duty].[ShiftID]
							 = [dbo].[tbl_Shift].[ShiftID]
							INNER JOIN [dbo].[tbl_farms]
							ON [dbo].[tbl_Shift].[farmId]
							 = [dbo].[tbl_farms].[FarmId]
							INNER JOIN [dbo].[tbl_employees]
							ON [dbo].[tbl_Duty].[GrowerID]
							 = [dbo].[tbl_employees].[workersid]
WHERE [dbo].[tbl_Duty].[Day] &gt;= '01/23/2017' AND [dbo].[tbl_Duty].[Day] &lt;= '02/23/2017' AND [dbo].[tbl_employees].[growersid] = 'monitr1' ORDER BY [dbo].[tbl_Duty].[Day] DESC, [dbo].[tbl_farms].[Farm_Name]"></asp:SqlDataSource>


</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="ContractorMaster.master" AutoEventWireup="true" CodeFile="ContractorHome.aspx.cs" Inherits="ContractorHome" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ContentPlaceHolderId="cph_mainSection" runat="server">


    <div class="topStatsBox">
        <div class="singleStat">
            <h4>Workers Employed in <asp:Label ID="lbl_month1" runat="server"></asp:Label></h4>
            <h3><asp:Label ID="lbl_monthVal1" runat="server">XX</asp:Label></h3>
            <%--<h3><asp:Label ID="lbl_workerRegion" runat="server" Text="lbl_workerRegion"></asp:Label></h3>--%>
            <%--<h2></h2>--%>
        </div>
        <div class="singleStat">
            <h4>Workers Employed in <asp:Label ID="lbl_month2" runat="server"></asp:Label></h4>
            <h3><asp:Label ID="lbl_monthVal2" runat="server">XX</asp:Label></h3>
            <%--<h4>Top workers in your region</h4>
            <h3>X</h3>
            <h2>For current month</h2>--%>
        </div>
        <div class="singleStat">
            <h4>Workers Employed in <asp:Label ID="lbl_month3" runat="server"></asp:Label></h4>
            <h3><asp:Label ID="lbl_monthVal3" runat="server">XX</asp:Label></h3>
        </div>
        <div class="singleStat">
            <h4>Workers Employed This Month</h4>
            <h3><asp:Label ID="lbl_monthVal4" runat="server">XX</asp:Label></h3>
        </div>
        <div class="singleStat-weather">
         <a href="http://www.accuweather.com/en/nz/tauranga/246959/weather-forecast/246959" class="aw-widget-legal">
                </a><div id="awcc1481679051332" class="aw-widget-current"  data-locationkey="246959" data-unit="c" data-language="en-us" data-useip="false" data-uid="awcc1481679051332"></div><script type="text/javascript" src="http://oap.accuweather.com/launch.js"></script>
                    
        </div>
    </div>

    
    <script type="text/javascript" src="http://oap.accuweather.com/launch.js"></script>

    <div class="pie-holders">
        <%--<div class="pie-single">
            <h2>Allocated Budget</h2>
            <h4>For this month</h4>
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource3" PaletteCustomColors="137, 181, 61; 203, 203, 203" BackColor="Transparent" BackImageTransparentColor="Transparent" BorderlineColor="Transparent" Palette="None" PageColor="Transparent">
                <Series>
                    <asp:Series Name="Series1" ChartType="Doughnut" XValueMember="S" YValueMembers="S" CustomProperties="DoughnutRadius=10, PieStartAngle=270" IsValueShownAsLabel="False">

                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent"></asp:ChartArea>
                </ChartAreas>
                <BorderSkin BackColor="Transparent" PageColor="Transparent"  />
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT SUM(Amount) AS 'S' FROM tbl_budget"></asp:SqlDataSource>
            
            <asp:Label ID="lbl_percentage1" runat="server" Text="X%"></asp:Label>
            <asp:Label ID="lbl_ammount1" runat="server" Text="$X"></asp:Label>
            <%--<img src="../img/100.png" class="pie-graphs-image-1" />
        </div>--%>

        <%--<div class="pie-single">--%>
            <h2>Remaining Budget</h2>
            <h4>For this month</h4>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" PaletteCustomColors="203, 203, 203; 137, 181, 61" BackColor="Transparent" BackImageTransparentColor="Transparent" BorderlineColor="Transparent" Palette="None" PageColor="Transparent" AntiAliasing="Graphics" Height="250px" Width="500px">
                <Series>
                    <asp:Series Name="Series1" ChartType="Doughnut" XValueMember="grouper" YValueMembers="S" CustomProperties="DoughnutRadius=10, PieLabelStyle=Disabled, PieStartAngle=270" IsValueShownAsLabel="False" Legend="Legend1">

                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent"></asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend BackColor="Transparent" Name="Legend1" Alignment="Center" DockedToChartArea="ChartArea1" Font="Roboto Light, 9.75pt" IsDockedInsideChartArea="False" IsTextAutoFit="False">
                    </asp:Legend>
                </Legends>
                <BorderSkin BackColor="Transparent" PageColor="Transparent"  />
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT SUM(Amount) FROM tbl_budget WHERE MONTH(TimeStamp) = 1"></asp:SqlDataSource>
            <div class="percentage-1">
                <asp:Label ID="lbl_percentage2" runat="server" Text="X%"></asp:Label>
            </div>
            <div class="percentage-2">
                <asp:Label ID="lbl_amount2" runat="server" Text="$X"></asp:Label>
            </div>    
            <%--<img src="../img/37.png" class="pie-graphs-image-3" />--%>
        <%--</div>--%>

        <%--<div class="pie-single">
            <h2>Usage Prediction</h2>
            <h4>Coming Soon...</h4>
            <img src="../img/5.6.png" class="pie-graphs-image-3" />
        </div>

        <div class="pie-single">
            <h2>Remaining Budget</h2>
            <h4>Coming Soon...</h4>
            <img src="../img/31.4.png" class="pie-graphs-image-4" />
        </div>--%>
        
    </div>





    <div class="graphPlaceholder">
        <asp:Chart ID="Chart2" runat="server" BackColor="Transparent" BorderlineColor="" DataSourceID="SqlDataSource1" Palette="None" Width="800px" Height="400px" TextAntiAliasingQuality="Normal" AntiAliasing="Graphics">
            <Series>
                <asp:Series Name="Workers Paid" BorderWidth="2" ChartType="Line" Color="137, 181, 61" Legend="Legend1" XValueMember="month" YValueMembers="workers paid" Font="Roboto Light, 8.25pt"></asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Legend1" Name="Budget Recieved" XValueMember="month" YValueMembers="budget recieved" Font="Roboto Light, 8.25pt">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BackColor="Transparent"></asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1" BackColor="Transparent" Font="Roboto Light, 9.75pt" IsTextAutoFit="False">
                </asp:Legend>
            </Legends>
            <BorderSkin BackSecondaryColor="White" BorderColor="Maroon" BorderDashStyle="Solid" BorderWidth="5" />
        </asp:Chart>
        <%--<img src="../img/ChartImg.png" />--%>
    </div>
    
    <div class="workingTodayBox">
        <asp:Label ID="lbl_workerTodayTitle" runat="server" Text="Working for you today"></asp:Label>
        <hr class="workingTodayHR" />
        <div class="workingTodayBoxContent">
            <asp:Label ID="lbl_workerTodayContent" runat="server" Text="lbl_workerTodayContent"></asp:Label>
        </div>
    </div>

    <div class="workingTomorrowBox">
        <asp:Label ID="lbl_workerTomorrowTitle" runat="server" Text="Working for you tomorrow"></asp:Label>
        <hr class="workingTodayHR" />
        <div class="workingTomorrowBoxContent">
            <asp:Label ID="lbl_workerTomorrowContent" runat="server" Text="lbl_workerTomorrowContent"></asp:Label>
        </div>
    </div>


    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="ViewBudgetAndWorkerPay" SelectCommandType="StoredProcedure">
        <%--<SelectParameters>
            <asp:Parameter DefaultValue="5" Name="loops" Type="Int32" />
            <asp:Parameter DefaultValue="grower1" Name="growerId" Type="String" />
            <asp:Parameter DefaultValue="01-01-2017" Name="startDate" Type="String" />
            <asp:Parameter DefaultValue="02-01-2017" Name="endDate" Type="String" />
        </SelectParameters>--%>
    </asp:SqlDataSource>
</asp:Content>

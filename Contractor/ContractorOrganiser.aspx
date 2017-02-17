<%@ Page Title="" Language="C#" MasterPageFile="ContractorMaster.master" AutoEventWireup="true" CodeFile="ContractorOrganiser.aspx.cs" Inherits="ContractorOrganiser" %>

<asp:Content ContentPlaceHolderId="cph_mainSection" runat="server">

    <asp:MultiView ID="MultiView1" runat="server">
        
    </asp:MultiView>

    <div class="workerList">
        <div class="a-heading">
            <h2>Worker Assignment</h2>
        </div>
        <h3 class="organiserTitles">Workers: </h3>
        <div class="workerListSub">
            <asp:CheckBoxList ID="chk_workers" runat="server">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="sds_workers" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT [tbl_worker].[FirstName], [tbl_worker].[LastName], [tbl_worker].[WorkersId], [tbl_login].[type] FROM [tbl_worker] INNER JOIN [tbl_login] ON [tbl_login].[Id]=[tbl_worker].[WorkersId] ORDER BY [tbl_worker].[FirstName]"></asp:SqlDataSource>
        </div>


        <hr class="workersWeekListSep"/>

        <script>

            moveIcon(1); //was 2
        </script>



        <div class="weekList">

        <div class="titleDropDownBox1">
            <h3 class="organiserTitles">Week Start Date: </h3>

            <asp:DropDownList ID="cbo_weekStart" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbo_weekStart_SelectedIndexChanged"></asp:DropDownList>

        </div>


        <div class="singleTime">
            <h3 class="singleTimeTitle">Monday</h3>
            <div class="timeStart">
                <h3 class="organiserTitles2">Start Time:</h3> 
                <asp:TextBox ID="txt_mondayStart" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="timeEnd">
                <h3 class="organiserTitles2">End Time: </h3>
                <asp:TextBox ID="txt_mondayEnd" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="farm">
                <h3 class="organiserTitles2">Farm: </h3>
                <asp:DropDownList ID="cbo_mondayFarm" class="farm-name" runat="server" CausesValidation="true"></asp:DropDownList>
            </div>
            
        </div>

        <div class="singleTime">
            <h3 class="singleTimeTitle">Tuesday</h3>
            <div class="timeStart">
                <h3 class="organiserTitles2">Start Time: </h3>
                <asp:TextBox ID="txt_tuesdayStart" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="timeEnd">
                <h3 class="organiserTitles2">End Time: </h3>
                <asp:TextBox ID="txt_tuesdayEnd" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="farm">
                <h3 class="organiserTitles2">Farm: </h3>
                <asp:DropDownList ID="cbo_tuesdayFarm" class="farm-name" runat="server" CausesValidation="true"></asp:DropDownList>
            </div>
        </div>

        <div class="singleTime">
            <h3 class="singleTimeTitle">Wednesday</h3>
            
            <div class="timeStart">
                <h3 class="organiserTitles2">Start Time: </h3>
                <asp:TextBox ID="txt_wednesdayStart" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="timeEnd">
                <h3 class="organiserTitles2">End Time: </h3>
                <asp:TextBox ID="txt_wednesdayEnd" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="farm">
                <h3 class="organiserTitles2">Farm: </h3>
                <asp:DropDownList ID="cbo_wednesdayFarm" class="farm-name" runat="server" CausesValidation="true"></asp:DropDownList>
            </div>
        </div>

        <div class="singleTime">
            <h3 class="singleTimeTitle">Thursday</h3>
            <div class="timeStart">
                <h3 class="organiserTitles2">Start Time: </h3>
                <asp:TextBox ID="txt_thursdayStart" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="timeEnd">
                <h3 class="organiserTitles2">End Time: </h3>
                <asp:TextBox ID="txt_thursdayEnd" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="farm">
                <h3 class="organiserTitles2">Farm: </h3>
                <asp:DropDownList ID="cbo_thursdayFarm" class="farm-name" runat="server" CausesValidation="true"></asp:DropDownList>
            </div>
        </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT[ShiftID],[Shiftstarttime],[ShiftendTime],[TotalTime],[Farm_Name] FROM tbl_Shift inner join[dbo].[tbl_farms] on[dbo].[tbl_farms].[FarmId]=[dbo].[tbl_Shift].[farmId] WHERE ShiftID = @0">
                <SelectParameters>
                    <asp:Parameter Name="0" />
                </SelectParameters>
                </asp:SqlDataSource>

        <div class="singleTime">
            <h3 class="singleTimeTitle">Friday
            </h3>
            <div class="timeStart">
                <h3 class="organiserTitles2">Start Time: </h3>
                <asp:TextBox ID="txt_fridayStart" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="timeEnd">
                <h3 class="organiserTitles2">End Time: </h3>
                <asp:TextBox ID="txt_fridayEnd" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="farm">
                <h3 class="organiserTitles2">Farm: </h3>
                <asp:DropDownList ID="cbo_fridayFarm" class="farm-name" runat="server" CausesValidation="true"></asp:DropDownList>
            </div>
        </div>


        <div class="singleTime">
            <h3 class="singleTimeTitle">Saturday</h3>
            <div class="timeStart">
                <h3 class="organiserTitles2">Start Time: </h3>
                <asp:TextBox ID="txt_saturdayStart" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="timeEnd">
                <h3 class="organiserTitles2">End Time: </h3>
                <asp:TextBox ID="txt_saturdayEnd" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="farm">
                <h3 class="organiserTitles2">Farm: </h3>
                <asp:DropDownList ID="cbo_saturdayFarm" class="farm-name" runat="server" CausesValidation="true"></asp:DropDownList>
            </div>
        </div>
        
        
        <div class="singleTime">
            <h3 class="singleTimeTitle">Sunday</h3>
            <div class="timeStart">
                <h3 class="organiserTitles2">Start Time: </h3>
                <asp:TextBox ID="txt_sundayStart" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="timeEnd">
                <h3 class="organiserTitles2">End Time: </h3>
                <asp:TextBox ID="txt_sundayEnd" runat="server" CausesValidation="True" CssClass="timeInput" TextMode="Time"></asp:TextBox>
            </div>
            <div class="farm">
                <h3 class="organiserTitles2">Farm: </h3>
                <asp:DropDownList ID="cbo_sundayFarm" class="farm-name" runat="server" CausesValidation="true"></asp:DropDownList>
            </div>
        </div>


        <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="SUBMIT" />




    </div>












    </div>

    

    <div class="workerTimeList">
        <div class="a-heading">
            <h2>Worker Viewing</h2>
        </div>
        <div class="titleDropDownBox2">
            <h3 class="organiserTitles">Selected Day:</h3>
        </div>
        

        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <%--<asp:UpdatePanel ID="upd_weekStartSubmit" runat="server">
            <ContentTemplate>--%>
                <asp:DropDownList ID="cbo_weekStart2" runat="server" AutoPostBack="false" OnSelectedIndexChanged="cbo_weekStart2_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:DropDownList ID="cbo_farmWorker" runat="server" AutoPostBack="false" OnSelectedIndexChanged="cbo_weekStart2_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:TextBox ID="txt_search" runat="server" placeholder="Worker Name"></asp:TextBox>
                <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" />
        
                <%--<asp:DropDownList ID="cbo_supervisorWorker" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbo_weekStart2_SelectedIndexChanged">
                </asp:DropDownList>--%>
            <%--</ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="cbo_weekStart2" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>--%>


        <%--DELETED TABLE HEADER--%>
        <div class="no-results-holder" style="position: absolute;width: calc(100% - 20px);height: auto;background-color: transparent;margin-top: 130px;text-align:center;">
            <asp:Label ID="lbl_noContent" runat="server" Visible="false" Text="Your search has returned no results" style="width: 100%; transparent;margin: 0 auto;font-family: Roboto;font-weight: 300;font-size: 16px;"></asp:Label>
        </div>
        <div class="tableContent">
            <asp:HiddenField ID="hdf_flag" runat="server" /> <!-- I never got this working -->
                
            <%--<asp:Button ID="btn_submit2" runat="server" OnClientClick="document.getElementById('hdf_flag').value='false'" Text="Submit" />--%>
            <asp:GridView ID="dgd_organiserWorkers" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="dgd_organiserWorkers_SelectedIndexChanged" ShowHeader="True">
                <SelectedRowStyle BackColor="#E1E1E1" />
            </asp:GridView>
        </div>
        
    </div>

    <div class="supervisor-assignment">
        <div class="a-heading">
            <h2>Supervisor Assignment</h2>
        </div>
        <asp:DropDownList ID="cbo_workerAssignDay" runat="server" OnSelectedIndexChanged="cbo_workerAssignDay_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList>
         
        <asp:DropDownList ID="cbo_workerAssignFarm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbo_workerAssignFarm_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="cbo_workerAssignSupervisor" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbo_workerAssignSupervisor_SelectedIndexChanged">
            <asp:ListItem>Select Supervisor</asp:ListItem>
        </asp:DropDownList>


        <asp:CheckBoxList ID="chk_workersForSupervisors" runat="server">
        </asp:CheckBoxList>
            
        <asp:SqlDataSource ID="sds_workersForSupervisors" runat="server" ConnectionString="<%$ ConnectionStrings:KiwihortData %>" SelectCommand="SELECT [tbl_worker].[FirstName], [tbl_worker].[LastName], [tbl_worker].[WorkersId], [tbl_login].[type] FROM [tbl_worker] INNER JOIN [tbl_login] ON [tbl_login].[Id]=[tbl_worker].[WorkersId] INNER JOIN [tbl_duty] ON [tbl_Duty].[workerId]=[tbl_worker].[WorkersId] INNER JOIN [tbl_Shift] ON [tbl_Shift].[ShiftID]=[tbl_duty].[ShiftId]"></asp:SqlDataSource>

        <asp:Button ID="btn_workerAssign" runat="server" Text="Assign" OnClick="btn_workerAssign_Click" />
    </div>
    
 
    
</asp:Content>
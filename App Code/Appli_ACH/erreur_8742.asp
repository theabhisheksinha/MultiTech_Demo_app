<%@enablesessionstate=false%>
<%Option Explicit

Dim strDirectory, strRootPath
strDirectory = "../../../"
strRootPath = "../../"

' *** ADO Configuration - Add to Top (INCLUDE ALL LINES ABOVE)
Response.Buffer=True

If Request("Download") = "YES" then
   Response.ContentType = "application/vnd.ms-excel"
End If

' End ADO Configuration - Add to Top

' *** ADO Configuration - Create Table_Key# variables for each of the key fields - up to 6
' *** ADO Configuration - Create Table_Name variables for the update/add/delete table name

dim Table_Key_Value(5)
dim Title, Full_Title, Path, File, Table_Alias, Table_Name, Period, NoPeriodAlias, CodeValue
dim dbUnit, dbSQLInput, dbSelect, dbFrom, dbWhere, dbWhereFilter, strDefaultSortBy
dim GridNavigationExtras, FormNavigationExtras, dbNavigationItem, Standard_Buttons
dim GridUpdateButton, GridDeleteButton, EditParams, TempSQL, objTempConn, objTempRS
dim Edit_Priority, BVACounter, SumTitle, DefaultValueAdd, objRecSet
dim TotalRecords, MaxCounter

'********
    Title = "Business Value Assessement"
    Path = "PM_Process/PM_Balanced_Scorecard/"
    File = "Balanced_Scorecard.asp"
    Table_Alias = "SRAS."
    Table_Name = "Project_Assessment_TBL"
    Table_Key_Value(0) = "AS_SCALE_VALUE_FLD"
    Table_Key_Value(1) = "BV_CRITERIA_ID_FLD"
    Table_Key_Value(2) = "BV_CRITERIA_TYPE_FLD"
    Table_Key_Value(3) = "PR_PROJECT_ID_FLD"
    Table_Key_Value(4) = "PA_ASSESSMENT_DATE_FLD"
    Table_Key_Value(5) = ""
'*  Author: VCS
'*
'*  Description:  This page allows the user to update the business value for a specific
'*      Project.  It is similar to the BVA page used to create the request.
'*      The standard VPMi DLL page is used with an HTML Form around it.  The HTML
'*      Form is also populated with VPMi database attributes.
'***********

dbUnit = Replace(Title," ","_")
If request("Project_Name_Display") <> "" Then
  Project_Name_Display = request("Project_Name_Display")
  response.cookies ("VCS_VPMI_COOKIE")("Project_Name_Display") = Project_Name_Display
End If

IF Request("Edit_Priority")="YES" or Request("New_Project")="YES" then
    Edit_Priority="YES"
End If

%><!-- #include File=../../General/VCS_Default_PageStart.asp --><%

If Request("New_Project")="YES" then
    Full_Title = "New Project Business Value - Step 2 of 3"
Else

  Full_Title = "Project: " & Project_Name_Display & " - " & Title
End If

' *** ADO Configuration - Place IF statement around standard heading
If Request("Download") <> "YES" then
  %><!-- #include File="../../General/page_header.asp" --><%
End If

'* Main ASP Settings

' Identify the source of the data

dbSelect = "Select Distinct " &_
  "PROJ.PR_Project_ID_FLD,  " &_
  "ASCR.BV_Description_FLD, " &_
  " '1' Update_AS_Scale_Value_Desc_FLD, " &_
  " '1' Update_PA_Justification_FLD, " &_
  "ASSC.AS_Scale_Value_Desc_FLD,  " &_
  "SRAS.AS_Scale_Value_FLD,  " &_
  "SRAS.BV_Criteria_ID_FLD,  " &_
  "SRAS.PA_Justification_FLD ,  " &_
  "'1' Edit " 

dbFrom = "FROM " & Application("Ora_Username") & ".Project_TBL PROJ,  " &_
  " " & Application("Ora_Username") & ".Project_Assessment_TBL SRAS,  " &_
  " " & Application("Ora_Username") & ".Assignment_Scale_TBL ASSC,  " &_
  " " & Application("Ora_Username") & ".BUSINESS_VALUE_CRITERIA_TBL ASCR  " 
  
dbWhere = "WHERE PROJ.PR_Project_ID_FLD = SRAS.PR_Project_ID_FLD  " &_
" AND  SRAS.AS_Scale_Value_FLD = ASSC.AS_Scale_Value_FLD   " &_
" AND  SRAS.BV_Criteria_ID_FLD = ASSC.BV_Criteria_ID_FLD  " &_
" AND  SRAS.BV_Criteria_Type_FLD = ASSC.BV_Criteria_Type_FLD  " &_
" AND  ASCR.BV_Criteria_ID_FLD = ASSC.BV_Criteria_ID_FLD  " &_
" AND  ASCR.BV_Criteria_Type_FLD = ASSC.BV_Criteria_Type_FLD  " &_
" AND  SRAS.BV_Criteria_Type_FLD = 'BUSVL'  " &_
" AND  PROJ.PR_Project_ID_FLD = '" & Project_ID & "'" 

strDefaultSortBy = " SRAS.BV_Criteria_ID_FLD "


' Setup the Security Levels for Grid and Edit or Form Modes

If ACCESS_LEVEL = "1" then
  GridNavigationExtras = "" 'Variable appended to the dbNavigationItem in Grid mode
  FormNavigationExtras = ""  'Variable appended to the dbNavigationItem in Form mode
  EditParams = "" 'Variable appended to dbEditParams to display update and/or delete icons
End If

If ACCESS_LEVEL = "2" then
  GridNavigationExtras = "" 'Variable appended to the dbNavigationItem in Grid mode
  FormNavigationExtras = ""  'Variable appended to the dbNavigationItem in Form mode
  EditParams = "" 'Variable appended to dbEditParams to display update and/or delete icons
End If

If ACCESS_LEVEL = "3" then
  GridNavigationExtras = "" 'Variable appended to the dbNavigationItem in Grid mode
  FormNavigationExtras = ""  'Variable appended to the dbNavigationItem in Form mode
  EditParams = "" 'Variable appended to dbEditParams to display update and/or delete icons
End If

If ACCESS_LEVEL = "4" then
  GridNavigationExtras = "" 'Variable appended to the dbNavigationItem in Grid mode
  FormNavigationExtras = ""  'Variable appended to the dbNavigationItem in Form mode
  EditParams = "" 'Variable appended to dbEditParams to display update and/or delete icons
End If

If ADMIN = "Y" then
  GridNavigationExtras = "" 'Variable appended to the dbNavigationItem in Grid mode
  FormNavigationExtras = ""  'Variable appended to the dbNavigationItem in Form mode
  EditParams = "" 'Variable appended to dbEditParams to display update and/or delete icons
End If

' ****
' *** ADO Configuration - Start of new DLL replacement code
' ****
dbNavigationItem = Standard_Buttons & GridNavigationExtras & FormNavigationExtras

' *** ADO Configuration - make sure all of the variables for the select - from - where statements are accounted for
dbSQLInput = dbSelect & dbFrom & dbWhere & dbWhereFilter

' *** ADO Configuration - Standard backgroud color for the table
strTablebgcolor = "#ffffff"

' *** ADO Configuration - Standard background color for the cells
strCellbgcolor = "#ffffff"

' *** ADO Configuration - Replace for blanks in cell
showblank="&nbsp;"

' *** ADO Configuration - Replace for null
shownull="<small>No Entry</small>"

' *** ADO Configuration - NO if you do not want to show the standard header
TopNavigationBarDisplay = "NO" 

' *****
' Subroutine UserInterfaceItem
' Variables: DisplayName (Name or START to open table and END to close table or BREAK for a new line of buttons)
'            UserHyperLink (Link to page)
'            PageView (GRID/FORM/BOTH)
' Description: Paints the customized top navigation for grid, form, update, add, filter, and delete
' *****
If Request("New_Project") <> "YES" Then
  UserInterfaceItem "START","","BOTH"
  UserInterfaceItem "Return to " & Project_Name_Display,"../PM_Project_Pages/Project_Filter.asp?ProjectMode=YES&Last_Button=form&Project_Name_Display=" & Project_Name_Display & "&UpdateID0=" & Project_ID & "&Form_Mode=YES","BOTH"
  UserInterfaceItem "END","","BOTH"
End If

' *****
' Subroutine EditUpdateBVA
' Variables:  none
' Description: Performs error checking and the update of a record to the database
' Author: VCS | Date: 12/20/2001
' *****
SUB EditUpdateBVA
    On Error Resume Next

    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.open DSN_Connection

    Set RS = Conn.Execute(SQLStmt)
    If  err.number>0 then
          response.write "VBScript Errors Occured:" & "<P>"
          response.write "Error Number=" & err.number & "<P>"
          response.write "Error Descr.=" & err.description & "<P>"
          response.write "Help Context=" & err.helpcontext & "<P>"
          response.write "Help Path=" & err.helppath & "<P>"
          response.write "Native Error=" & err.nativeerror & "<P>"
          response.write "Source=" & err.source & "<P>"
          response.write "SQLState=" & err.sqlstate & "<P>"
    End if

    IF  conn.errors.count> 0 then
          response.write "Database Errors Occured" & "<HR>"
          response.write SQLStmt & "<HR>"

      for counter= 0 to conn.errors.count
            response.write "Error #" & conn.errors(counter).number & "<P>"
            response.write "Error desc. -> " & conn.errors(counter).description & "<P>"
      next
    end if

    Set rstemp=nothing
    Conn.Close
    Set conntemp=nothing
END SUB

If Request("B1")<>"" Then
  set objRecSet = Server.CreateObject("ADODB.Recordset")

  strSQL = "select count(BV_CRITERIA_ID_FLD) TotalCount from " & Application("Ora_Username") & ".BUSINESS_VALUE_CRITERIA_TBL " &_
   "where BV_CRITERIA_TYPE_FLD = 'BUSVL' "
  objRecSet.Open strSQL, strConnection, 0, 1

  if not objRecSet.EOF  then
      TotalRecords = objRecSet("TotalCount")
      TotalRecords = (Cint(TotalRecords))
  end if

  objRecSet.Close

  MaxCounter = (TotalRecords)
  Dim Counter
  FOR Counter = 0 to MaxCounter
      SQLStmt = "UPDATE " & Application("Ora_Username") & ".Project_Assessment_TBL SET  " &_
      "" & Application("Ora_Username") & ".Project_Assessment_TBL.AS_Scale_Value_FLD = '" & Request.form("BVA_Selection" & Counter) & "' ,  " &_
      "" & Application("Ora_Username") & ".Project_Assessment_TBL.Update_Employee_ID_FLD = '" & UCase(VCS_VPMI_ID) & "',  " &_
      "" & Application("Ora_Username") & ".Project_Assessment_TBL.PA_Justification_FLD = '" & Request.form("BVA_JustifyText" & Counter) & "'  " &_
      "WHERE (((" & Application("Ora_Username") & ".Project_Assessment_TBL.BV_Criteria_ID_FLD) = '" & Request.form("Hidden_CRIT_ID" & Counter) & "') " &_
      " AND  ((" & Application("Ora_Username") & ".Project_Assessment_TBL.BV_Criteria_Type_FLD)='BUSVL') AND ((" & Application("Ora_Username") & ".Project_Assessment_TBL.PR_Project_ID_FLD) = '" & Project_ID & "'))"
    
    EditUpdateBVA
  NEXT

  SQLStmt="Update " & Application("Ora_Username") & ".Project_TBL set PR_Weighted_BVA_Rate_FLD = " &_
    "(select sum(sras.AS_Scale_Value_FLD * ascr.BV_Value_Weight_FLD) bva " &_
    "from   " & Application("Ora_Username") & ".Business_Value_Criteria_TBL      ascr, " &_
    " " & Application("Ora_Username") & ".Project_Assessment_TBL  sras " &_
    " where sras.PR_Project_ID_FLD = '" & Project_ID & "' " &_
    " and   ascr.BV_Criteria_Type_FLD = 'BUSVL' " &_
    " and   sras.BV_Criteria_ID_FLD = ascr.BV_Criteria_ID_FLD " &_
    " and   sras.BV_Criteria_Type_FLD = ascr.BV_Criteria_Type_FLD) " &_
    " where  PR_Project_ID_FLD = '" & Project_ID & "'"
  EditUpdateBVA
End If

If Request("B1")<>"" and UCase(New_Project)="ENTERED" Then
  Response.redirect("../PM_Routing/PM_Routing.asp?New_Project=ENTERED")
End If

If Request("New_Project") <> "YES" AND UCase(Project_Unit_Number) <> "" AND UCase(Startup_Filter_Mode) <> "YES" then
  UserInterfaceItem "START","","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("AssessmentLink") = "YES" Then UserInterfaceItem "Assessment","../../PM_Process/PM_Project_Sign_Off/SignOff.asp?EditPriority=YES&First=YES&Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("RiskLink") = "YES" Then UserInterfaceItem "Risks","../../PM_Process/PM_Sub_Project_Pages/Risks.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("MilestoneLink") = "YES" Then UserInterfaceItem "Milestones","../../PM_Process/PM_Sub_Project_Pages/Milestones.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("ActionLink") = "YES" Then UserInterfaceItem "Action Log","../../PM_Process/PM_Sub_Project_Pages/Action_Log.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("SupportLink") = "YES" Then UserInterfaceItem "Support Log","../../PM_Process/PM_Sub_Project_Pages/Support_Log.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("IssueLink") = "YES" Then UserInterfaceItem "Issues","../../PM_Process/PM_Sub_Project_Pages/Issues.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("StatusLink") = "YES" Then UserInterfaceItem "Status Reports","../../PM_Process/PM_Sub_Project_Pages/Progress.asp?Last_Button=resetfilter","BOTH"
  UserInterfaceItem "BREAK","","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("FeedbackLink") = "YES" Then UserInterfaceItem "Feedback","../../General/Maintenance/Feedback.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("ProgramLink") = "YES" Then UserInterfaceItem "Programs","../../PM_Process/PM_Sub_Project_Pages/ProjectPrograms.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("DependencyLink") = "YES" Then UserInterfaceItem "Dependencies","../../PM_Process/PM_Project_Pages/Project_Filter.asp?Last_Button=resetfilter&ByPassAdd=YES&Dependency=YES&DepFirst=YES&DepEdit=YES&ByPassPageEnd=YES","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("ChangeLink") = "YES" Then UserInterfaceItem "Changes","../../PM_Process/PM_Sub_Project_Pages/Change_Requests.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("TeamLink") = "YES" Then UserInterfaceItem "Team","../../PM_Process/PM_Sub_Project_Pages/Team.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("DeliverableLink") = "YES" Then UserInterfaceItem "Deliverables","../../PM_Process/PM_Sub_Project_Pages/Deliverable.asp?Last_Button=resetfilter","BOTH"
  If Request.Cookies ("VCS_VPMI_COOKIE")("RoutingLink") = "YES" Then UserInterfaceItem "Routing","../../PM_Process/PM_Routing/PM_Routing.asp?Last_Button=resetfilter","BOTH"
  UserInterfaceItem "END","","BOTH"
End If

%><!--#include file="../../General/ado_default_start.asp" --><%

' *****
' Beginning of GRID Mode
' *****

If (Form_Mode <> "YES" and Last_Button <> "form" and Last_Button <> "update" and Last_Button <> "add" and Last_Button <> "delete" and Last_Button <> "filter") or Request.Querystring="" Then

    response.write "    <form onSubmit=""return EditValidate(this)"" form method=""POST"" "
    response.write "    action=""" & File & "?Entered=YES"" name=""BVA"" target=""_top"">"
    response.write "    <div align=""center""><center><p>"

    response.write "      <Table border=""1"" width='100%' cellspacing='0' cellpadding='0' bgcolor=" & strTablebgcolor & ">"
    response.write "        <tr>"

    ' *** ADO Configuration - Setup the column sorts

    ' *****
    ' Column Sorting - DisplayColumnSort
    ' Variables:  AdditionalHTML (HTML after the hyperlink)
    '    SortField (Table column name to sort by),
    '    ColumnName (logical name to display)
    '    HTMLOnly
    ' Description:  Paints the column heading and creates the sorting functionality.
    '    Note: There is no GRID lookup so all sorts must be in the SQL
    ' *****

    DisplayColumnSort "","","","Assessment Criteria" & DisplayInfo("PROJECT_ASSESSMENT_TBL","BV_CRITERIA_ID_FLD","BVA","../../")
    DisplayColumnSort "","","","Assessment Scale"  & DisplayInfo("PROJECT_ASSESSMENT_TBL","AS_SCALE_VALUE_FLD","BVA","../../") 
    DisplayColumnSort "","","","Justification" & DisplayInfo("PROJECT_ASSESSMENT_TBL","PA_JUSTIFICATION_FLD","BVA","../../") 
        response.write "</tr>"

    BVACounter = 0

       FOR rowcounter= iStart TO iStop
         FOR fieldcounter = iCounter TO iHowManyFields
              If iCounter < 6 then
			    DisplayColumn(iCounter)=aResults(SelectOrder(iCounter),rowcounter)
		    Else
			    DisplayColumn(iCounter)=ConvertToType(aResults(SelectOrder(iCounter),rowcounter),"long")		    
		    End If
              iCounter = iCounter+1
         NEXT
         iCounter = 0

       DisplayColumn(1)=CleanField(DisplayColumn(1))

    ' *** ADO Configuration - Setup the grid fields

    ' *****
    ' DisplayGridItem
    ' Variables:  SelectOrderField (Starting with 0, order appears in select statement),
    '        HTMLAlternative (The alternative to the standard data display),
    '        Orientation (LEFT/RIGHT/CENTER)
    ' Description:  Paints the rows of data in the grid view.
    '        Note: There is no GRID lookup (for performance) so all items must be in the SQL
    ' *****

    If Edit_Priority="YES" Then
       DisplayGridItem DisplayColumn(1),"","CENTER"
        TempSQL = "Select distinct AS_SCALE_VALUE_FLD, AS_SCALE_VALUE_DESC_FLD FROM " & Application("Ora_Username") & ".ASSIGNMENT_SCALE_TBL WHERE BV_CRITERIA_TYPE_FLD = 'BUSVL' AND BV_CRITERIA_ID_FLD = '" & DisplayColumn(6) & "' ORDER BY AS_SCALE_VALUE_FLD"
        GridSelect DisplayColumn(5),"NO",TempSQL,""
       DisplayGridItem "<select name='BVA_Selection" & BVACounter & "'>" & DropDownBox & "</select>","","LEFT"
       DisplayGridItem "<textarea rows=2 name=BVA_JustifyText" & BVACounter & " cols='25'>" & DisplayColumn(7) & "</textarea>" &_
                   "<input type='hidden' name=Hidden_CRIT_ID" & BVACounter & " value=" & DisplayColumn(6) & ">" &_
                "<input type='Hidden' name=BVA_Update" & BVACounter & " value=" & BVACounter & ">","","CENTER"
    
      BVACounter = BVACounter + 1
    Else
       DisplayGridItem DisplayColumn(1),"","CENTER"
       DisplayGridItem DisplayColumn(4),"","CENTER"
       DisplayGridItem DisplayColumn(7),"","CENTER"
    End If

       ' Show the standard update and delete buttons
       response.write "</tr>"
    NEXT
    

    response.write "</Table>"

    If Edit_Priority="YES" AND (Form_Mode <> "YES" and Last_Button <> "form" and Last_Button <> "update" and Last_Button <> "add" and Last_Button <> "delete" and Last_Button <> "filter") or Request.Querystring="" Then
      response.write "<br><center><input type=""submit"" value=""Enter Business Value Changes"" name=""B1""><br>"
    End If

    If Request("Edit_Priority") = "YES" AND Request("First") = "YES" Then
      SumTitle = "Previous BVA"
    Else
      SumTitle = "Calculated BVA"
    End If

    ' *** ADO Configuration - Setup a message and a SQL calculated value at the bottom of the GRID
                TempSQL = "select 'DISPLAYONLY', ('" & SumTitle & " = ' || sum(sras.AS_Scale_Value_FLD * ascr.BV_Value_Weight_FLD)) bva " &_
            "from   " & Application("Ora_Username") & ".Business_Value_Criteria_TBL      ascr, " &_
            " " & Application("Ora_Username") & ".Project_Assessment_TBL  sras, " &_
            " " & Application("Ora_Username") & ".Project_TBL proj " &_
            " where sras.PR_Project_ID_FLD = '" & Project_ID & "' " &_
            " and sras.PR_Project_ID_FLD =  proj.PR_Project_ID_FLD " &_
            " and   ascr.BV_Criteria_Type_FLD = 'BUSVL' " &_
            " and   sras.BV_Criteria_ID_FLD = ascr.BV_Criteria_ID_FLD " &_
            " and   sras.BV_Criteria_Type_FLD = ascr.BV_Criteria_Type_FLD "
'			response.write TempSQL
                response.write "<br><center><font color='Navy' face='Verdana,Arial' size='2'><B>"
    SingleFieldLookup(TempSQL)
    response.write "</B></Font></center><br><br>"

End If

response.write "</body></html>"
' ****
' *** ADO Configuration - End of new DLL replacement code
' ****

' *** ADO Configuration - Skip bottom borders if download to Excel activated
If Request("Download") <> "YES" then
  %><!-- #include File=../../General/page_footer.asp --><%
End If

IF Edit_Priority="YES" then%>
<script LANGUAGE="JavaScript">

<!-- Begin
var submitcount=0;
function EditValidate(which)
  {

   if (checkLength(document.forms[0].elements[1], 2000,"Justification", document.forms[0].elements[1].value.length) == false)
      {return false;}

   if (checkLength(document.forms[0].elements[5], 2000,"Justification", document.forms[0].elements[5].value.length) == false)
      {return false;}

   if (checkLength(document.forms[0].elements[9], 2000,"Justification", document.forms[0].elements[9].value.length) == false)
      {return false;}

   if (checkLength(document.forms[0].elements[13], 2000,"Justification", document.forms[0].elements[13].value.length) == false)
      {return false;}

   if (checkLength(document.forms[0].elements[17], 2000,"Justification", document.forms[0].elements[17].value.length) == false)
      {return false;}

   if (checkLength(document.forms[0].elements[21], 2000,"Justification", document.forms[0].elements[21].value.length) == false)
      {return false;}

   if (checkLength(document.forms[0].elements[25], 2000,"Justification", document.forms[0].elements[25].value.length) == false)
      {return false;}

    if (submitcount == 0)
      {
      submitcount++;
      return true;
      }
    else
      {
      alert("This form has already been submitted.");
      return false;
      }
    }
//  End -->
</script>
<%End If%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
%@ taglib uri="/WEB-INF/tags/datagrid.tld" prefix="grd" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.freeware.gridtag.*" %> 
<%
int intCurr = 1;
int intSortOrd = 0;
String strTmp = null;
String strSQL = null;
String strSortCol = null;
String strSortOrd = "ASC";
boolean blnSortAsc = true; 
strSQL = "SELECT CLICORPORATION, CLICLIENT, CLIDESCRIPTION, " +
         "CLIENABLED, CLIUPDSTAMP FROM CLIENTMASTER "; 
Connection objCnn    = null;
Class      objDrvCls = null;
objDrvCls = Class.forName("oracle.jdbc.driver.OracleDriver");
objCnn = DriverManager.getConnection("jdbc:oracle:thin:@Host:port:sid", 
                                     "cashincpri", "cashincpri");
if (objDrvCls != null) objDrvCls = null;
strTmp = request.getParameter("txtCurr");
try
{
  if (strTmp != null)
  intCurr = Integer.parseInt(strTmp);
}
catch (NumberFormatException NFEx)
{
}
strSortCol = request.getParameter("txtSortCol");
strSortOrd = request.getParameter("txtSortAsc");
if (strSortCol == null) strSortCol = "CLICLIENT";
if (strSortOrd == null) strSortOrd = "ASC";
blnSortAsc = (strSortOrd.equals("ASC"));
%>
<html>
<head>
<title>Grid Tag Demonstration</title>
<link REL="StyleSheet" HREF="css/GridStyle.css">
<script LANGUAGE="javascript">
function doNavigate(pstrWhere, pintTot)
{
  var strTmp;
  var intPg; 
  strTmp = document.frmMain.txtCurr.value;
  intPg = parseInt(strTmp);
  if (isNaN(intPg)) intPg = 1; 
  if ((pstrWhere == 'F' || pstrWhere == 'P') && intPg == 1)
  {
    alert("You are already viewing first page!");
    return;
  }
  else if ((pstrWhere == 'N' || pstrWhere == 'L') && intPg == pintTot)
  {
    alert("You are already viewing last page!");
    return;
  }
  if (pstrWhere == 'F')
    intPg = 1;
  else if (pstrWhere == 'P')
    intPg = intPg - 1;
  else if (pstrWhere == 'N')
    intPg = intPg + 1;
  else if (pstrWhere == 'L')
    intPg = pintTot; 
  if (intPg < 1) intPg = 1;
  if (intPg > pintTot) intPg = pintTot;
  document.frmMain.txtCurr.value = intPg;
  document.frmMain.submit();
}
function doSort(pstrFld, pstrOrd)
{
  document.frmMain.txtSortCol.value = pstrFld;
  document.frmMain.txtSortAsc.value = pstrOrd;
  document.frmMain.submit();
}
</script>
</head>
<body>
<h2>Grid Example</h2>
<form NAME="frmMain" METHOD="post">
<grd:dbgrid id="tblStat" name="tblStat" width="100" pageSize="10" 
    currentPage="<%=intCurr%>" border="0" cellSpacing="1" cellPadding="2" 
    dataMember="<%=strSQL%>" dataSource="<%=objCnn%>" cssClass="gridTable">
 <grd:gridpager imgFirst="images/First.gif" imgPrevious="images/Previous.gif" 
      imgNext="images/Next.gif" imgLast="images/Last.gif"/>
 <grd:gridsorter sortColumn="<%=strSortCol%>" sortAscending="<%=blnSortAsc%>"/>
 <grd:rownumcolumn headerText="#" width="5" HAlign="right"/>
 <grd:imagecolumn headerText="" width="5" HAlign="center" 
      imageSrc="images/Edit.gif" 
      linkUrl="javascript:doEdit('{CLICORPORATION}', '{CLICLIENT}')" 
      imageBorder="0" imageWidth="16" imageHeight="16" 
      alterText="Click to edit"/>
 <grd:textcolumn dataField="CLICLIENT" headerText="Client" 
      width="10" sortable="true"/>
 <grd:textcolumn dataField="CLIDESCRIPTION" headerText="Description" 
      width="50" sortable="true"/>
 <grd:decodecolumn dataField="CLIENABLED" headerText="Enabled" width="10" 
      decodeValues="Y,N" displayValues="Yes,No" valueSeperator=","/>
 <grd:datecolumn dataField="CLIUPDSTAMP" headerText="Last Updated" 
      dataFormat="dd/MM/yyyy HH:mm:ss" width="20"/>
</grd:dbgrid>
<input TYPE="hidden" NAME="txtCurr" VALUE="<%=intCurr%>">
<input TYPE="hidden" NAME="txtSortCol" VALUE="<%=strSortCol%>">
<input TYPE="hidden" NAME="txtSortAsc" VALUE="<%=strSortOrd%>">
</form>
</body>
</html>
<%
try
{
    if (objCnn != null)
        objCnn.close();
}
catch (SQLException SQLExIgnore)
{
}
if (objCnn != null) objCnn = null;
%>
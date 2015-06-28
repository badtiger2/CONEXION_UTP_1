<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
</head>

<body>

<ul id="MenuBar1" class="MenuBarVertical">

<%Connection conex=null;
Statement sqlMenu=null;
Statement sqlSubMenu=null;

try
{
  Class.forName("com.mysql.jdbc.Driver");
  conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/CMLBS","root","");
  sqlMenu=conex.createStatement();
  
  String queryMenu ="SELECT distinct idsitemap,url,parent,profile,name FROM sitemap where parent=0";
  ResultSet rsMenu = sqlMenu.executeQuery(queryMenu);
  while (rsMenu.next())
  {
      int idsitemap =rsMenu.getInt("IdSiteMap");
      String name = rsMenu.getString("name");
    %> 
    
    <li><a class="MenuBarItemSubmenu" href="#">  <%=name%></a> 
            <% sqlSubMenu=conex.createStatement();
                String querySubMenu ="select * from sitemap where parent="+idsitemap;
                ResultSet rsSubMenu = sqlSubMenu.executeQuery(querySubMenu); %>
                <ul>
             <% while (rsSubMenu.next())
                {
                String namesub= rsSubMenu.getString("Name");
                String url= rsSubMenu.getString("Url");   %>
                        <li><a href=<%=url%>><%=namesub%></a></li>
                  
                <%
                }%>  </ul>
    </li>
    <% 
 }
}
    catch(Exception e){
    out.print("Error en la conexion"+ e);
}
    %>
</ul>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script> 
</body>
</html>

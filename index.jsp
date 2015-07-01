<%@ page import="ConexionBD.Conexion"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%!   String name = "";
      String url ="";
	
%>
<%
HttpSession objSesion = request.getSession(false); 
String usuario = (String)objSesion.getAttribute("userid");
out.println("Usuario en sesion: " + usuario);
%>
<!DOCTYPE html>
<html>
<head>
    	 <link rel="shortcut icon" href="Imagenes/servicios.png" width="500" height="500" alt="Icono" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
        <link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <title>LA BUENA SALUD</title>
    <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
    
<style>

</style>
</head>
    <body>
    <div class="container">
   	  	<div class="row" style="background-color:#ADD6C2">
   			<div class="col-lg-3"><img src="Imagenes/servicios.png" width="118" height="114" alt="ientras"></div>
            <div class="col-lg-9"><h1 style="font-family:Toonish; margin-top:50px;" class="text-center">CLINICA LA BUENA SALUD<h1></div>
        </div>
        <div class="row" style="background-color:#D6EBE0">
   			<div class="col-lg-12"><br></div>
        </div>
        <div class="row" style="background-color:#D6EBE0">
           	<div class="col-lg-2">
           	  <ul id="MenuBar1" class="MenuBarVertical panel panel-success" style="width:100%">
			  <%
                Statement sqlMenu=null;
                Statement sqlSubMenu=null;
                
                try
                {
                   Conexion con=new Conexion();
       Connection conex=con.getConexion();
                  sqlMenu=conex.createStatement();
                  
                  String queryMenu ="SELECT distinct idsitemap,url,parent,profile,name FROM sitemap where parent=0";
                  ResultSet rsMenu = sqlMenu.executeQuery(queryMenu);
				
                  while (rsMenu.next())
                  {
                      int idsitemap =rsMenu.getInt("IdSiteMap");
                      name = rsMenu.getString("name");
					  url= rsMenu.getString("Url");
                    %> 
                    <%=url%>
                    <li style="width:100%"><a class="MenuBarItemSubmenu sub" id="<%=idsitemap%>">  <%=url%> </a>
                    <label style="display:none" id="label<%=idsitemap%>"><%=url%></label> 
                            <% sqlSubMenu=conex.createStatement();
                                String querySubMenu ="select * from sitemap where parent="+idsitemap;
                                ResultSet rsSubMenu = sqlSubMenu.executeQuery(querySubMenu); %>
                                <ul style="width:100%">
                             <% while (rsSubMenu.next())
                                {
                                String namesub= rsSubMenu.getString("Name");
								 int idsitemapsub =rsSubMenu.getInt("IdSiteMap");
                                 urlsub= rsSubMenu.getString("Url");   %>
                                        <li style="width:100%"><a class="sub" id="<%=idsitemapsub%>"><%=urlsub%></a></li>
                                  
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
           	</div>
            <div class="col-lg-7" style="float:left" id="contenido"><p class="text-justify">La salud es uno de los elementos más relevantes para el desarrollo de una vida larga y cualitativa. En este sentido, la importancia de la salud reside en permitir que el organismo de una persona, o de un animal, mantenga buenos estándares de funcionamiento y pueda así realizar las diferentes actividades que están en su rutina diaria. La salud es un fenómeno que se logra a partir de un sinfín de acciones y que puede mantenerse por mucho tiempo o perderse debido a diversas razones. La salud es algo que se puede recuperar también pero muchas veces puede costar lograrlo. Cuando hablamos de importancia de la salud estaremos entonces refiriéndonos al valor que la salud tiene para que una persona pueda llevar una buena calidad de vida en todos sus diversos aspectos.

... de Importancia: http://www.importancia.org/importancia-de-la-salud.php</p></div>
<form method="post" action="login.jsp">

		<div class="col-lg-3" style="float:left">
        	<div style="background-color:#eee; border:0px solid #CCC">
            <div style="margin-left:20px; margin-right:20px;">
           <label class="text-center" style="margin-left:44px; margin-top:20px"> INICIO DE SESIÓN</label>
           <br><br>
           <label>Usuario</label>
            <input type="text" name="uname" class="form-control">
           <label>Contraseña</label>
           <input type="text" name="pass" class="form-control">
           <br>
           <input type="submit" value="ENTRAR" class="btn btn-default" style="margin-left: 70px; margin-bottom:20px">
		         <br>    Yet Not Registered!! <a href="reg.jsp">Register Here</a>
           </div>
            </div>
        </div>
		    </form>
        </div>
        <div class="row" style="background-color:#EBF5F0">
       		<div class="col-lg-12 text-center">© - 2015</div>
        </div>
    </div>
    <script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
	$(".sub").on('click', function()
	{	var id = $(this).attr('id');
		var url = $("#label"+id).html();
		alert(url);
		$("#contenido").load('url');
	});
//alert("Hola");
	

    </script>
    
    
    </body>
</html>

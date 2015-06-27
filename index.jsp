<%-- 
    Document   : newjsp
    Created on : jun 27, 2015, 2:20:41 p.m.
    Author     : acedeno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    	 <link rel="shortcut icon" href="Imagenes/servicios.png" width="500" height="500" alt="Icono" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
        <link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LA BUENA SALUD</title>
    <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>
    <body>
    <div class="container">
   	  	<div class="row">
   			<div class="col-lg-12"><img src="Imagenes/servicios.png" width="118" height="114" alt="ientras"></div>
        </div>
        <div class="row">
           	<div class="col-lg-4">
           	  <ul id="MenuBar1" class="MenuBarVertical">
           	    <li><a class="MenuBarItemSubmenu" href="#">Elemento 1</a>
           	      <ul>
           	        <li><a href="#">Elemento 1.1</a></li>
           	        <li><a href="#">Elemento 1.2</a></li>
           	        <li><a href="#">Elemento 1.3</a></li>
       	          </ul>
       	        </li>
           	    <li><a href="#">Elemento 2</a></li>
           	    <li><a class="MenuBarItemSubmenu" href="#">Elemento 3</a>
           	      <ul>
           	        <li><a class="MenuBarItemSubmenu" href="#">Elemento 3.1</a>
           	          <ul>
           	            <li><a href="#">Elemento 3.1.1</a></li>
           	            <li><a href="#">Elemento 3.1.2</a></li>
       	              </ul>
       	            </li>
           	        <li><a href="#">Elemento 3.2</a></li>
           	        <li><a href="#">Elemento 3.3</a></li>
       	          </ul>
       	        </li>
           	    <li><a href="#">Elemento 4</a></li>
       	      </ul>
           	</div>
            <div class="col-lg-8" style="float:left">CONTENIDO</div>
        </div>
        <div class="row">
       		<div class="col-lg-12 text-center">2015</div>
        </div>
    </div>
    <script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
    </script>
    </body>
</html>

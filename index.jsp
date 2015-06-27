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
   			<div class="col-lg-3"><img src="Imagenes/servicios.png" width="118" height="114" alt="ientras"></div>
            <div class="col-lg-9"><h1 style="font-family:Toonish">CLINICA LA BUENA SALUD<h1></div>
        </div>
        <div class="row">
   			<div class="col-lg-12"><br></div>
        </div>
        <div class="row">
           	<div class="col-lg-2">
           	  <ul id="MenuBar1" class="MenuBarVertical" style="width:100%">
           	    <li style="width:100%"><a class="MenuBarItemSubmenu" href="#">Elemento 1</a>
           	      <ul>
           	        <li><a href="#">Elemento 1.1</a></li>
           	        <li><a href="#">Elemento 1.2</a></li>
           	        <li><a href="#">Elemento 1.3</a></li>
       	          </ul>
       	        </li>
           	    <li style="width:100%"><a href="#">Elemento 2</a></li>
           	    <li style="width:100%"><a class="MenuBarItemSubmenu" href="#">Elemento 3</a>
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
           	    <li style="width:100%"><a href="#">Elemento 4</a></li>
       	      </ul>
           	</div>
            <div class="col-lg-10" style="float:left"><p class="text-justify">La salud es uno de los elementos más relevantes para el desarrollo de una vida larga y cualitativa. En este sentido, la importancia de la salud reside en permitir que el organismo de una persona, o de un animal, mantenga buenos estándares de funcionamiento y pueda así realizar las diferentes actividades que están en su rutina diaria. La salud es un fenómeno que se logra a partir de un sinfín de acciones y que puede mantenerse por mucho tiempo o perderse debido a diversas razones. La salud es algo que se puede recuperar también pero muchas veces puede costar lograrlo. Cuando hablamos de importancia de la salud estaremos entonces refiriéndonos al valor que la salud tiene para que una persona pueda llevar una buena calidad de vida en todos sus diversos aspectos.

... de Importancia: http://www.importancia.org/importancia-de-la-salud.php</p></div>
        </div>
        <div class="row">
       		<div class="col-lg-12 text-center">© - 2015</div>
        </div>
    </div>
    <script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
    </script>
    </body>
</html>

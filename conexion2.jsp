<%@ page import="ConexionBD.Conexion"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>


<%
Statement sql=null;

try
{
        Conexion con=new Conexion();
       Connection conex=con.getConexion();
            
  sql=conex.createStatement();

  
  ResultSet rs = sql.executeQuery("select first_name, last_name, uname,pass from members");

out.println("<table border=1>");

out.println("<tr><th>Id</th><th>Nombre</th><th>Precio</th></tr>");

while (rs.next()) {

out.println("<tr>");
        
out.println("<td>");    
        
out.println(rs.getString("first_name")+rs.getString("last_name"));

out.println("</td><td>");

out.println(rs.getString("uname"));

out.println("</td><td>");

out.println(rs.getInt("pass"));

out.println("</td>");

out.println("</tr>");

}

out.println("</table>");

rs.close();
sql.close();
conex.close();

}
catch(Exception e){
    out.print("Error en la conexion"+ e);
}
%>
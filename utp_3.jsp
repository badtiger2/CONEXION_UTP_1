
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.Statement"
        import="java.sql.SQLException"   
%>

<%Connection conex=null;
Statement sql=null;

try
{
  Class.forName("com.mysql.jdbc.Driver");
  conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/sakila","root","");
  sql=conex.createStatement();
  out.print("Conexion establecida");
  
  ResultSet rs = sql.executeQuery("select city_id, city, country_id from city");

out.println("<table border=1>");

out.println("<tr><th>Id</th><th>Nombre</th><th>Precio</th></tr>");
out.println("<tr>Esta es mi prueba</tr>");
while (rs.next()) {



out.println("<tr>");
        
out.println("<td>");    
        
out.println(rs.getInt("city_id"));

out.println("</td><td>");

out.println(rs.getString("city"));

out.println("</td><td>");

out.println(rs.getInt("country_id"));

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
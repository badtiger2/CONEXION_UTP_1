<%@ page import="ConexionBD.Conexion"%>
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
  
       Conexion con=new Conexion();
       Connection conex=con.getConexion();
	   
    Statement st = conex.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from members where uname='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        //response.sendRedirect("success.jsp");
		 response.sendRedirect("index.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
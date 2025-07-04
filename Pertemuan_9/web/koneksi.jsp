<%-- 
    Document   : koneksi
    Created on : 13 Jun 2025, 11.37.45
    Author     : F.Nurhayati
--%>

<%@ page import="java.sql.*" %>
<%
    // connection string, tidak perlu dirubah
    String DBDRIVER = "com.mysql.cj.jdbc.Driver";

    // URI database
    String DBCONNECTION = "jdbc:mysql://localhost:3306/test";

    // username & password database
    String DBUSER = "root";
    String DBPASS = "";

    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        // menyiapkan koneksi
        Class.forName(DBDRIVER);
        conn = DriverManager.getConnection(DBCONNECTION, DBUSER, DBPASS);
        st = conn.createStatement();

        // eksekusi query
        rs = st.executeQuery("SELECT * FROM daftar");
    } catch (Exception e) {
        out.println("Error");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- loop membaca data -->
        <% while (rs.next()) {%>
            <%= rs.getInt("id")%><br>
            <%= rs.getString("nama")%><br>
            <%= rs.getInt("nilai")%><br>
            <hr>
        <% } %>
    
        <%  // tutup koneksi database
            rs.close();
            st.close();
            conn.close();
        %>
    </body>
</html>

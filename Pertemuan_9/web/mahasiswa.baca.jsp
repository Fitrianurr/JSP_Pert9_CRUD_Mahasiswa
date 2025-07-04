<%-- 
    Document   : mahasiswa.baca
    Created on : 13 Jun 2025, 12.03.55
    Author     : F.Nurhayati
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="CRUD.Mahasiswa" %>

<%
    String message = "";
    String messageType = "";
    Mahasiswa mahasiswa = new Mahasiswa();
    boolean dataFound = false;
    
    // Proses pencarian data
    if ("POST".equals(request.getMethod())) {
        String nim = request.getParameter("nim");
        
        if (nim != null && !nim.trim().isEmpty()) {
            if (mahasiswa.baca(nim.trim())) {
                dataFound = true;
                message = "Data mahasiswa ditemukan!";
                messageType = "success";
            } else {
                message = "Data mahasiswa dengan NIM " + nim + " tidak ditemukan!";
                messageType = "error";
            }
        } else {
            message = "NIM harus diisi untuk mencari data!";
            messageType = "error";
        }
    }
    
    // Set attributes untuk view
    request.setAttribute("message", message);
    request.setAttribute("messageType", messageType);
    request.setAttribute("mahasiswa", mahasiswa);
    request.setAttribute("dataFound", dataFound);
%>

<jsp:forward page="mahasiswa.baca.view.jsp" />
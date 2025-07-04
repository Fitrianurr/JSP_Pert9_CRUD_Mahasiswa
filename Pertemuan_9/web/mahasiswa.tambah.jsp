<%-- 
    Document   : mahasiswa.tambah
    Created on : 13 Jun 2025, 11.44.56
    Author     : F.Nurhayati
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="CRUD.Mahasiswa" %>
<%
    String message = "";
    String messageType = "";
    boolean showForm = true;

    // Proses form submission
    if ("POST".equals(request.getMethod())) {
        String nim = request.getParameter("nim");
        String nama = request.getParameter("nama");
        String nilaiStr = request.getParameter("nilai");

        // Validasi input
        if (nim != null && !nim.trim().isEmpty() && 
            nama != null && !nama.trim().isEmpty() && 
            nilaiStr != null && !nilaiStr.trim().isEmpty()) {

            try {
                int nilai = Integer.parseInt(nilaiStr);

                // Validasi nilai (0-100)
                if (nilai >= 0 && nilai <= 100) {
                    Mahasiswa mhs = new Mahasiswa(nim.trim(), nama.trim(), nilai);
                    if (mhs.tambah()) {
                        message = "Data mahasiswa berhasil ditambahkan!";
                        messageType = "success";
                        showForm = false;
                    } else {
                        message = "Gagal menambahkan data. NIM mungkin sudah ada.";
                        messageType = "error";
                    }
                } else {
                    message = "Nilai harus antara 0-100!";
                    messageType = "error";
                }
            } catch (NumberFormatException e) {
                message = "Format nilai tidak valid!";
                messageType = "error";
            }
        } else {
            message = "Semua field harus diisi!";
            messageType = "error";
        }
    }

    // Set attributes untuk view
    request.setAttribute("message", message);
    request.setAttribute("messageType", messageType);
    request.setAttribute("showForm", showForm);
%>

<jsp:forward page="mahasiswa.tambah.view.jsp" />

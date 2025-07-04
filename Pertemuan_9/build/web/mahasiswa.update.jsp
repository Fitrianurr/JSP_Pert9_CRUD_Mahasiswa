<%-- 
    Document   : Mahasiswa.update
    Created on : 13 Jun 2025, 11.52.00
    Author     : F.Nurhayati
--%>

<%@ page import="CRUD.Mahasiswa" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String message = "";
    String messageType = "";
    Mahasiswa mahasiswa = new Mahasiswa();
    boolean dataFound = false;
    String step = request.getParameter("step");
    
    if ("search".equals(step)) {
        // Step 1: Mencari data berdasarkan NIM
        String nim = request.getParameter("nim");
        
        if (nim != null && !nim.trim().isEmpty()) {
            if (mahasiswa.baca(nim.trim())) {
                dataFound = true;
                message = "Data mahasiswa ditemukan. Silakan ubah data yang diperlukan.";
                messageType = "info";
            } else {
                message = "Data mahasiswa dengan NIM " + nim + " tidak ditemukan!";
                messageType = "error";
            }
        } else {
            message = "NIM harus diisi untuk mencari data!";
            messageType = "error";
        }
        
    } else if ("update".equals(step)) {
        // Step 2: Update data
        String nim = request.getParameter("nim");
        String nama = request.getParameter("nama");
        String nilaiStr = request.getParameter("nilai");
        
        if (nim != null && !nim.trim().isEmpty() && 
            nama != null && !nama.trim().isEmpty() && 
            nilaiStr != null && !nilaiStr.trim().isEmpty()) {
            
            try {
                int nilai = Integer.parseInt(nilaiStr);
                
                if (nilai >= 0 && nilai <= 100) {
                    mahasiswa.setNim(nim.trim());
                    mahasiswa.setNama(nama.trim());
                    mahasiswa.setNilai(nilai);
                    
                    if (mahasiswa.update()) {
                        message = "Data mahasiswa berhasil diupdate!";
                        messageType = "success";
                        dataFound = false; // Reset form
                    } else {
                        message = "Gagal mengupdate data mahasiswa.";
                        messageType = "error";
                        // Tetap tampilkan form dengan data yang sudah diisi
                        dataFound = true;
                    }
                } else {
                    message = "Nilai harus antara 0-100!";
                    messageType = "error";
                    dataFound = true;
                }
            } catch (NumberFormatException e) {
                message = "Format nilai tidak valid!";
                messageType = "error";
                dataFound = true;
            }
        } else {
            message = "Semua field harus diisi!";
            messageType = "error";
            dataFound = true;
        }
    }
    
    // Set attributes untuk view
    request.setAttribute("message", message);
    request.setAttribute("messageType", messageType);
    request.setAttribute("mahasiswa", mahasiswa);
    request.setAttribute("dataFound", dataFound);
    request.setAttribute("step", step);
%>

<jsp:forward page="mahasiswa.update.view.jsp" />

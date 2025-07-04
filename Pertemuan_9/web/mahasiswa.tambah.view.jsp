<%-- 
    Document   : Mahasiswa.tambah.view
    Created on : 13 Jun 2025, 12.12.29
    Author     : F.Nurhayati
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Data Mahasiswa</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 2rem 0;
        }
        .form-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #5a6fd8 0%, #6a4190 100%);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="form-container p-5">
                    <div class="text-center mb-4">
                        <h2 class="text-dark">
                            <i class="bi bi-plus-circle"></i> Tambah Data Mahasiswa
                        </h2>
                        <p class="text-muted">Masukkan data mahasiswa baru</p>
                    </div>
                    
                    <!-- Menampilkan pesan -->
                    <% String message = (String) request.getAttribute("message");
                       String messageType = (String) request.getAttribute("messageType");
                       Boolean showForm = (Boolean) request.getAttribute("showForm");
                       
                       if (message != null && !message.isEmpty()) { %>
                        <div class="alert alert-<%= "success".equals(messageType) ? "success" : "danger" %> alert-dismissible fade show">
                            <i class="bi bi-<%= "success".equals(messageType) ? "check-circle" : "exclamation-triangle" %>"></i>
                            <%= message %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <% } %>
                    
                    <% if (showForm == null || showForm) { %>
                    <!-- Form Input -->
                    <form method="POST" action="mahasiswa.tambah.jsp">
                        <div class="mb-3">
                            <label for="nim" class="form-label">
                                <i class="bi bi-person-badge"></i> NIM
                            </label>
                            <input type="text" class="form-control" id="nim" name="nim" 
                                   value="<%= request.getParameter("nim") != null ? request.getParameter("nim") : "" %>"
                                   placeholder="Masukkan NIM mahasiswa" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="nama" class="form-label">
                                <i class="bi bi-person"></i> Nama Lengkap
                            </label>
                            <input type="text" class="form-control" id="nama" name="nama" 
                                   value="<%= request.getParameter("nama") != null ? request.getParameter("nama") : "" %>"
                                   placeholder="Masukkan nama lengkap" required>
                        </div>
                        
                        <div class="mb-4">
                            <label for="nilai" class="form-label">
                                <i class="bi bi-graph-up"></i> Nilai
                            </label>
                            <input type="number" class="form-control" id="nilai" name="nilai" 
                                   value="<%= request.getParameter("nilai") != null ? request.getParameter("nilai") : "" %>"
                                   min="0" max="100" step="0.01" placeholder="Masukkan nilai (0-100)" required>
                            <div class="form-text">Nilai harus antara 0 sampai 100</div>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="index.jsp" class="btn btn-secondary me-md-2">
                                <i class="bi bi-arrow-left"></i> Kembali
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-save"></i> Simpan Data
                            </button>
                        </div>
                    </form>
                    <% } else { %>
                    <!-- Tombol setelah berhasil -->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                        <a href="mahasiswa.tambah.jsp" class="btn btn-primary me-md-2">
                            <i class="bi bi-plus"></i> Tambah Lagi
                        </a>
                        <a href="index.jsp" class="btn btn-secondary">
                            <i class="bi bi-house"></i> Ke Beranda
                        </a>
                        <a href="mahasiswa.baca.view.jsp" class="btn btn-primary me-md-2">
                            <i class="bi bi-plus"></i> Baca Data
                        </a>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
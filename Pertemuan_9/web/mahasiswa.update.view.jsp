<%-- 
    Document   : Mahasiswa.update.view
    Created on : 13 Jun 2025, 12.15.59
    Author     : F.Nurhayati
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="CRUD.Mahasiswa" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Data Mahasiswa</title>
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
        .search-section {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 2rem;
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
                            <i class="bi bi-pencil-square"></i> Update Data Mahasiswa
                        </h2>
                        <p class="text-muted">Cari dan ubah data mahasiswa</p>
                    </div>
                    
                    <%
                        String message = (String) request.getAttribute("message");
                        String messageType = (String) request.getAttribute("messageType");
                        Mahasiswa mahasiswa = (Mahasiswa) request.getAttribute("mahasiswa");
                        Boolean dataFound = (Boolean) request.getAttribute("dataFound");
                        String step = (String) request.getAttribute("step");
                    %>
                    
                    <!-- Menampilkan pesan -->
                    <% if (message != null && !message.isEmpty()) { %>
                        <div class="alert alert-<%= "success".equals(messageType) ? "success" : "info".equals(messageType) ? "info" : "danger" %> alert-dismissible fade show">
                            <i class="bi bi-<%= "success".equals(messageType) ? "check-circle" : "info".equals(messageType) ? "info-circle" : "exclamation-triangle" %>"></i>
                            <%= message %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <% } %>
                    
                    <% if (dataFound == null || !dataFound) { %>
                    <!-- Form Pencarian -->
                    <div class="search-section">
                        <h5 class="mb-3">
                            <i class="bi bi-search"></i> Cari Data Mahasiswa
                        </h5>
                        <form method="POST" action="mahasiswa.update.jsp">
                            <input type="hidden" name="step" value="search">
                            <div class="row g-3 align-items-end">
                                <div class="col-md-8">
                                    <label for="searchNim" class="form-label">NIM</label>
                                    <input type="text" class="form-control" id="searchNim" name="nim" 
                                           placeholder="Masukkan NIM yang akan diupdate" required>
                                </div>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary w-100">
                                        <i class="bi bi-search"></i> Cari
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <% if ("success".equals(messageType)) { %>
                    <!-- Tombol setelah berhasil update -->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                        <a href="Mahasiswa_update.jsp" class="btn btn-primary me-md-2">
                            <i class="bi bi-pencil"></i> Update Lagi
                        </a>
                        <a href="mahasiswa.baca.view.jsp" class="btn btn-secondary">
                            <i class="bi bi-eye"></i> Lihat Data
                        </a>
                    </div>
                    <% } %>
                    
                    <% } else { %>
                    <!-- Form Update -->
                    <div class="search-section">
                        <h5 class="mb-3">
                            <i class="bi bi-pencil-square"></i> Update Data
                        </h5>
                        <form method="POST" action="mahasiswa.update.jsp">
                            <input type="hidden" name="step" value="update">
                            
                            <div class="mb-3">
                                <label for="nim" class="form-label">
                                    <i class="bi bi-person-badge"></i> NIM
                                </label>
                                <input type="text" class="form-control" id="nim" name="nim" 
                                       value="<%= mahasiswa.getNim() %>" readonly>
                                <div class="form-text">NIM tidak dapat diubah</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="nama" class="form-label">
                                    <i class="bi bi-person"></i> Nama Lengkap
                                </label>
                                <input type="text" class="form-control" id="nama" name="nama" 
                                       value="<%= mahasiswa.getNama() %>" 
                                       placeholder="Masukkan nama lengkap" required>
                            </div>
                            
                            <div class="mb-4">
                                <label for="nilai" class="form-label">
                                    <i class="bi bi-graph-up"></i> Nilai
                                </label>
                                <input type="number" class="form-control" id="nilai" name="nilai" 
                                       value="<%= mahasiswa.getNilai() %>"
                                       min="0" max="100" step="0.01" placeholder="Masukkan nilai (0-100)" required>
                                <div class="form-text">Nilai harus antara 0 sampai 100</div>
                            </div>
                            
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a href="mahasiswa.update.jsp" class="btn btn-secondary me-md-2">
                                    <i class="bi bi-arrow-left"></i> Cari Lagi
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-save"></i> Update Data
                                </button>
                            </div>
                        </form>
                    </div>
                    <% } %>
                    
                    <div class="text-center mt-4">
                        <a href="index.jsp" class="btn btn-outline-secondary">
                            <i class="bi bi-house"></i> Kembali ke Beranda
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
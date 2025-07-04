<%-- 
    Document   : Mahasiswa.baca.view
    Created on : 13 Jun 2025, 12.23.58
    Author     : F.Nurhayati
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="CRUD.Mahasiswa" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baca Data Mahasiswa</title>
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
        .data-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 10px;
            padding: 2rem;
            margin-top: 1rem;
        }
        .data-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            padding: 0.75rem;
            background-color: rgba(255,255,255,0.1);
            border-radius: 8px;
        }
        .data-icon {
            font-size: 1.5rem;
            margin-right: 1rem;
            min-width: 2rem;
        }
        .data-label {
            font-weight: bold;
            min-width: 80px;
        }
        .data-value {
            flex: 1;
            font-size: 1.1rem;
        }
        .alert-info {
            background: linear-gradient(135deg, #17a2b8 0%, #138496 100%);
            border: none;
            color: white;
        }
        .data-table {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-top: 2rem;
        }
        .table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            font-weight: 600;
            text-align: center;
        }
        .table td {
            vertical-align: middle;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
        }
        .search-highlight {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="form-container p-4">
                    <div class="text-center mb-4">
                        <h2 class="text-primary">
                            <i class="bi bi-people"></i> Data Mahasiswa
                        </h2>
                        <p class="text-muted">Kelola dan cari informasi mahasiswa</p>
                    </div>

                    <!-- Form Pencarian -->
                    <div class="search-section">
                        <form method="post" action="">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label for="nim" class="form-label">
                                            <i class="bi bi-person-badge"></i> Cari berdasarkan NIM (Opsional)
                                        </label>
                                        <input type="text" 
                                               class="form-control" 
                                               id="nim" 
                                               name="nim" 
                                               placeholder="Masukkan NIM untuk pencarian spesifik..."
                                               value="<%= request.getParameter("nim") != null ? request.getParameter("nim") : "" %>">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label">&nbsp;</label>
                                        <button type="submit" class="btn btn-primary w-100">
                                            <i class="bi bi-search"></i> Cari Data
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <%
                    // Logika untuk menangani pencarian data dan menampilkan semua data
                    String nim = request.getParameter("nim");
                    boolean isSearching = (nim != null && !nim.trim().isEmpty());
                    
                    if (isSearching) {
                        // Mode pencarian spesifik berdasarkan NIM
                        try {
                            Mahasiswa mahasiswa = new Mahasiswa();
                            boolean dataFound = mahasiswa.baca(nim.trim());
                            
                            if (dataFound) {
                                // Data ditemukan - tampilkan dalam format card
                    %>
                    <div class="data-card">
                        <div class="text-center mb-3">
                            <h4><i class="bi bi-person-check"></i> Data Mahasiswa Ditemukan</h4>
                        </div>
                        
                        <div class="data-item">
                            <i class="bi bi-person-badge data-icon"></i>
                            <span class="data-label">NIM:</span>
                            <span class="data-value"><%= mahasiswa.getNim() %></span>
                        </div>
                        
                        <div class="data-item">
                            <i class="bi bi-person data-icon"></i>
                            <span class="data-label">Nama:</span>
                            <span class="data-value"><%= mahasiswa.getNama() %></span>
                        </div>
                        
                       <div class="data-item">
                            <i class="bi bi-award data-icon"></i>
                            <span class="data-label">Nilai:</span>
                            <span class="data-value"><%= mahasiswa.getNilai() %></span>
                        </div>
                        
                        <div class="text-center mt-3">
                            <a href="?" class="btn btn-light">
                                <i class="bi bi-list"></i> Lihat Semua Data
                            </a>
                        </div>
                    </div>
                    <%
                            } else {
                                // Data tidak ditemukan
                    %>
                    <div class="alert alert-info mt-3">
                        <i class="bi bi-info-circle"></i>
                        <strong>Informasi:</strong> Data mahasiswa dengan NIM "<%= nim %>" tidak ditemukan dalam database.
                        <br><a href="?" class="text-white text-decoration-underline">Klik di sini untuk melihat semua data</a>
                    </div>
                    <%
                            }
                            
                        } catch (Exception e) {
                            // Terjadi error
                    %>
                    <div class="alert alert-danger mt-3">
                        <i class="bi bi-exclamation-triangle"></i>
                        <strong>Error:</strong> Terjadi kesalahan saat mencari data: <%= e.getMessage() %>
                    </div>
                    <%
                        }
                    } else {
                        // Mode tampil semua data
                        try {
                            ResultSet rs = Mahasiswa.getAllMahasiswa();
                            if (rs != null) {
                    %>
                    <!-- Tabel untuk menampilkan semua data -->
                    <div class="data-table">
                        <div class="p-3 bg-light border-bottom">
                            <h5 class="mb-0"><i class="bi bi-table"></i> Semua Data Mahasiswa</h5>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th style="width: 15%">No</th>
                                        <th style="width: 25%">NIM</th>
                                        <th style="width: 40%">Nama</th>
                                        <th style="width: 20%">Nilai</th>
                                    </tr>
                                </thead>
                                <tbody>
                    <%
                                int no = 1;
                                boolean hasData = false;
                                while (rs.next()) {
                                    hasData = true;
                    %>
                                    <tr>
                                        <td><%= no++ %></td>
                                        <td><strong><%= rs.getString("nim") %></strong></td>
                                        <td><%= rs.getString("nama") %></td>
                                        <td>
                                            <span class="badge bg-primary fs-6">
                                                <%= (int) rs.getDouble("nilai") %>
                                            </span>
                                        </td>
                                    </tr>
                    <%
                                }
                                
                                if (!hasData) {
                    %>
                                    <tr>
                                        <td colspan="4" class="text-center text-muted py-4">
                                            <i class="bi bi-inbox display-4"></i><br>
                                            Belum ada data mahasiswa
                                        </td>
                                    </tr>
                    <%
                                }
                    %>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="p-3 bg-light border-top text-center">
                            <small class="text-muted">
                                <i class="bi bi-info-circle"></i> 
                                Total data: <%= hasData ? (no-1) : 0 %> mahasiswa
                            </small>
                        </div>
                    </div>
                    <%
                                rs.close();
                            } else {
                    %>
                    <div class="alert alert-danger mt-3">
                        <i class="bi bi-exclamation-triangle"></i>
                        <strong>Error:</strong> Tidak dapat mengambil data dari database.
                    </div>
                    <%
                            }
                        } catch (Exception e) {
                    %>
                    <div class="alert alert-danger mt-3">
                        <i class="bi bi-exclamation-triangle"></i>
                        <strong>Error:</strong> Terjadi kesalahan saat mengambil data: <%= e.getMessage() %>
                    </div>
                    <%
                        }
                    }
                    %>

                    <!-- Tombol Navigasi -->
                    <div class="text-center mt-4">
                        <a href="index.jsp" class="btn btn-secondary me-2">
                            <i class="bi bi-house"></i> Kembali ke Menu
                        </a>
                        <a href="mahasiswa.tambah.view.jsp" class="btn btn-success">
                            <i class="bi bi-plus-circle"></i> Tambah Data Baru
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
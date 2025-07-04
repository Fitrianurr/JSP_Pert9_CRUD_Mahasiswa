<%-- 
    Document   : index
    Created on : 13 Jun 2025, 12.18.28
    Author     : F.Nurhayati
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Manajemen Data Mahasiswa</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 2rem 0;
        }
        .main-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .menu-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            color: white;
        }
        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }
        .menu-card.delete-card {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%);
        }
        .menu-card .card-body {
            text-align: center;
            padding: 2rem;
        }
        .menu-card i {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        .menu-card a {
            color: white;
            text-decoration: none;
        }
        .menu-card a:hover {
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="main-container p-5">
                    <div class="text-center mb-5">
                        <h1 class="display-4 text-dark mb-3">
                            <i class="bi bi-book"></i> Sistem Manajemen Data Mahasiswa
                        </h1>
                        <p class="lead text-muted">Aplikasi CRUD dengan Java EE dan JSP menggunakan pola MVC</p>
                    </div>
                    
                    <div class="row g-4 mb-5">
                        <div class="col-md-6 col-lg-3">
                            <div class="card menu-card h-100">
                                <div class="card-body">
                                    <a href="mahasiswa.tambah.jsp">
                                        <i class="bi bi-plus-circle"></i>
                                        <h4 class="card-title">Tambah Data</h4>
                                        <p class="card-text">Menambahkan data mahasiswa baru ke dalam database</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-3">
                            <div class="card menu-card h-100">
                                <div class="card-body">
                                    <a href="mahasiswa.baca.view.jsp">
                                        <i class="bi bi-eye"></i>
                                        <h4 class="card-title">Baca Data</h4>
                                        <p class="card-text">Mencari dan menampilkan data mahasiswa berdasarkan NIM</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-3">
                            <div class="card menu-card h-100">
                                <div class="card-body">
                                    <a href="mahasiswa.update.jsp">
                                        <i class="bi bi-pencil-square"></i>
                                        <h4 class="card-title">Update Data</h4>
                                        <p class="card-text">Mengubah data mahasiswa yang sudah ada dalam database</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-3">
                            <div class="card menu-card delete-card h-100">
                                <div class="card-body">
                                    <a href="mahasiswa.hapus.jsp">
                                        <i class="bi bi-trash"></i>
                                        <h4 class="card-title">Hapus Data</h4>
                                        <p class="card-text">Menghapus data mahasiswa dari database</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="alert alert-info">
                        <h5 class="alert-heading">
                            <i class="bi bi-info-circle"></i> Informasi Aplikasi
                        </h5>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Teknologi yang digunakan:</strong></p>
                                <ul class="list-unstyled">
                                    <li><i class="bi bi-check-circle text-success"></i> Java EE dengan JSP</li>
                                    <li><i class="bi bi-check-circle text-success"></i> MySQL Database</li>
                                    <li><i class="bi bi-check-circle text-success"></i> Pola MVC</li>
                                    <li><i class="bi bi-check-circle text-success"></i> Bootstrap 5</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Fitur yang tersedia:</strong></p>
                                <ul class="list-unstyled">
                                    <li><i class="bi bi-plus text-primary"></i> CREATE: Menambah data baru</li>
                                    <li><i class="bi bi-eye text-info"></i> READ: Membaca data</li>
                                    <li><i class="bi bi-pencil text-warning"></i> UPDATE: Mengubah data</li>
                                    <li><i class="bi bi-trash text-danger"></i> DELETE: Menghapus data</li>
                                    <li><i class="bi bi-shield-check text-success"></i> Validasi dan error handling</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="border-top pt-4 text-center text-muted">
                        <p class="mb-1">Dibuat untuk tugas Java EE - Pemrograman Java Lanjut</p>
                        <p class="mb-0">Menggunakan pola MVC dengan pemisahan Controller dan View</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
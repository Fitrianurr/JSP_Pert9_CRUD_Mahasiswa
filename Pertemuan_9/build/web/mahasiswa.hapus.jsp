<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="CRUD.Mahasiswa" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Hapus Mahasiswa</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 2rem 0;
            min-height: 100vh;
        }
        .form-container {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
        }
        .btn-danger {
            background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
            border: none;
        }
        .alert-success, .alert-danger {
            color: white;
            border: none;
        }
        .alert-success {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        }
        .alert-danger {
            background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
        }
        .data-item {
            margin-bottom: 1rem;
            font-size: 1.1rem;
        }
        .data-label {
            font-weight: bold;
            width: 80px;
            display: inline-block;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="form-container">
                <h3 class="text-center text-primary mb-4">
                    <i class="bi bi-trash3"></i> Hapus Mahasiswa
                </h3>

                <!-- Form pencarian -->
                <form method="post" action="mahasiswa.hapus.jsp">
                    <div class="mb-3">
                        <label for="nim" class="form-label">
                            <i class="bi bi-search"></i> Cari berdasarkan NIM
                        </label>
                        <input type="text" class="form-control" id="nim" name="nim"
                               placeholder="Masukkan NIM"
                               value="<%= request.getParameter("nim") != null ? request.getParameter("nim") : "" %>">
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-search"></i> Cari Data
                        </button>
                    </div>
                </form>

                <hr class="my-4">

                <%
                    String nim = request.getParameter("nim");
                    String hapus = request.getParameter("hapus");
                    Mahasiswa mhs = new Mahasiswa();

                    if (hapus != null && hapus.equals("true") && nim != null && !nim.trim().isEmpty()) {
                        // Proses penghapusan
                        if (mhs.baca(nim.trim())) {
                            boolean sukses = mhs.hapus();
                            if (sukses) {
                %>
                    <div class="alert alert-success mt-3 text-center">
                        <i class="bi bi-check-circle-fill"></i> Data mahasiswa dengan NIM <strong><%= nim %></strong> berhasil dihapus.
                    </div>
                <%
                            } else {
                %>
                    <div class="alert alert-danger mt-3 text-center">
                        <i class="bi bi-x-circle-fill"></i> Gagal menghapus data mahasiswa.
                    </div>
                <%
                            }
                        } else {
                %>
                    <div class="alert alert-danger mt-3 text-center">
                        <i class="bi bi-exclamation-triangle-fill"></i> Data dengan NIM <strong><%= nim %></strong> tidak ditemukan.
                    </div>
                <%
                        }
                    } else if (nim != null && !nim.trim().isEmpty()) {
                        // Mode tampilkan data dulu
                        if (mhs.baca(nim.trim())) {
                %>
                    <div class="alert alert-light border p-3">
                        <h5 class="text-center text-primary mb-3">
                            <i class="bi bi-person-check"></i> Data Mahasiswa Ditemukan
                        </h5>
                        <div class="data-item"><span class="data-label">NIM:</span> <%= mhs.getNim() %></div>
                        <div class="data-item"><span class="data-label">Nama:</span> <%= mhs.getNama() %></div>
                        <div class="data-item"><span class="data-label">Nilai:</span> <%= mhs.getNilai() %></div>

                        <form method="post" action="mahasiswa.hapus.jsp" class="mt-4">
                            <input type="hidden" name="nim" value="<%= mhs.getNim() %>">
                            <input type="hidden" name="hapus" value="true">
                            <div class="d-grid">
                                <button type="submit" class="btn btn-danger">
                                    <i class="bi bi-trash3-fill"></i> Konfirmasi Hapus Data Ini
                                </button>
                            </div>
                        </form>
                    </div>
                <%
                        } else {
                %>
                    <div class="alert alert-danger mt-3 text-center">
                        <i class="bi bi-exclamation-triangle-fill"></i> Data mahasiswa dengan NIM "<%= nim %>" tidak ditemukan.
                    </div>
                <%
                        }
                    }
                %>

                <!-- Tombol Navigasi -->
                <div class="text-center mt-4">
                    <a href="index.jsp" class="btn btn-secondary me-2">
                        <i class="bi bi-house"></i> Menu Utama
                    </a>
                    <a href="mahasiswa.baca.view.jsp" class="btn btn-success">
                        <i class="bi bi-list"></i> Lihat Semua Data
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

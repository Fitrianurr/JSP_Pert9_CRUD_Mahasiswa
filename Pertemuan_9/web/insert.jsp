<%-- 
    Document   : insert
    Created on : 13 Jun 2025, 11.40.02
    Author     : F.Nurhayati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Form Tambah Mahasiswa</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Tambah Mahasiswa</h2>
    <form action="Mahasiswa_tambah.jsp" method="post">
        NIM: <input type="text" name="nim"><br>
        Nama: <input type="text" name="nama"><br>
        Nilai: <input type="number" name="nilai"><br>
        <input type="submit" value="Simpan"> | <a href="index.jsp" class="btn">Kembali</a>
    </form>
</body>
</html>
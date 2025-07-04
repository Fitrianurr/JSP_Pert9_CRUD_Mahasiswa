# JSP_Pert9_CRUD_Mahasiswa
# CRUD Mahasiswa (Pertemuan 9)

Proyek ini adalah implementasi sederhana aplikasi **CRUD (Create, Read, Update, Delete)** data mahasiswa menggunakan **Java JSP/Servlet** dan **MySQL**, dikembangkan sebagai bagian dari latihan perkuliahan pada Pertemuan ke-9.

## Fitur

- Tambah data mahasiswa  
- Lihat daftar mahasiswa  
- Update data mahasiswa  
- Hapus data mahasiswa  
- Terhubung ke database MySQL  
- Tampilan sederhana berbasis JSP  

## Struktur Folder

```
Pertemuan\_9/
├── build.xml
├── build/
│   └── web/
│       ├── index.jsp
│       ├── insert.jsp
│       ├── koneksi.jsp
│       ├── mahasiswa.baca.jsp
│       ├── mahasiswa.baca.view\.jsp
│       ├── mahasiswa.hapus.jsp
│       ├── mahasiswa.tambah.jsp
│       ├── mahasiswa.tambah.view\.jsp
│       ├── mahasiswa.update.jsp
│       ├── mahasiswa.update.view\.jsp
│       ├── META-INF/
│       └── WEB-INF/
│           ├── classes/
│           │   └── CRUD/Mahasiswa.class
│           └── lib/mysql-connector-j-9.3.0.jar
├── nbproject/
│   └── (file-file konfigurasi NetBeans)

````

## Teknologi yang Digunakan

- Java EE (JSP/Servlet)  
- MySQL Database  
- Apache Tomcat  
- NetBeans IDE  
- JDBC (via `mysql-connector-j`)  

## Cara Menjalankan

1. **Clone repo atau buka project di NetBeans**
2. Pastikan MySQL aktif dan buat database yang sesuai (lihat di `koneksi.jsp`)
3. Sesuaikan konfigurasi koneksi database:
   ```jsp
   String url = "jdbc:mysql://localhost:3306/nama_database";
   String user = "root";
   String pass = "";
4. Jalankan project di NetBeans (gunakan Tomcat)



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CRUD;
import java.sql.*;
/**
 *
 * @author F.Nurhayati
 */

public class Mahasiswa {
    private String nim;
    private String nama;
    private int nilai;
    
    // Database connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/test";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    
    // Constructor
    public Mahasiswa() {}
    
    public Mahasiswa(String nim, String nama, int nilai) {
        this.nim = nim;
        this.nama = nama;
        this.nilai = nilai;
    }
    
    // Getters and Setters
    public String getNim() {
        return nim;
    }
    
    public void setNim(String nim) {
        this.nim = nim;
    }
    
    public String getNama() {
        return nama;
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    
    public int getNilai() {
        return nilai;
    }
    
    public void setNilai(int nilai) {
        this.nilai = nilai;
    }
    
    // Method untuk mendapatkan koneksi database
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver MySQL tidak ditemukan", e);
        }
    }
    
    // Method untuk menambah data mahasiswa
    public boolean tambah() {
        String sql = "INSERT INTO mahasiswa (nim, nama, nilai) VALUES (?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, this.nim);
            pstmt.setString(2, this.nama);
            pstmt.setInt(3, this.nilai);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat menambah data: " + e.getMessage());
            return false;
        }
    }
    
    // Method untuk update data mahasiswa
    public boolean update() {
        String sql = "UPDATE mahasiswa SET nama = ?, nilai = ? WHERE nim = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, this.nama);
            pstmt.setInt(2, this.nilai);
            pstmt.setString(3, this.nim);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat update data: " + e.getMessage());
            return false;
        }
    }
    
    // Method untuk membaca data mahasiswa berdasarkan NIM
    public boolean baca(String nim) {
        String sql = "SELECT nim, nama, nilai FROM mahasiswa WHERE nim = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, nim);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                this.nim = rs.getString("nim");
                this.nama = rs.getString("nama");
                this.nilai = rs.getInt("nilai");
                return true;
            } else {
                return false;
            }
            
        } catch (SQLException e) {
            System.err.println("Error saat membaca data: " + e.getMessage());
            return false;
        }
    }
    
    // Method untuk menghapus data mahasiswa
    public boolean hapus() {
        String sql = "DELETE FROM mahasiswa WHERE nim = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, this.nim);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error saat menghapus data: " + e.getMessage());
            return false;
        }
    }
    
    // Method untuk mendapatkan semua data mahasiswa
    public static ResultSet getAllMahasiswa() {
        String sql = "SELECT nim, nama, nilai FROM mahasiswa ORDER BY nim";
        
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement pstmt = conn.prepareStatement(sql);
            return pstmt.executeQuery();
        } catch (SQLException e) {
            System.err.println("Error saat mengambil semua data: " + e.getMessage());
            return null;
        }
    }
}
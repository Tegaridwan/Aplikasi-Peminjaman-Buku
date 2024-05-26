/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package perpustakaan;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Tegar
 */
public class koneksi {
    private static java.sql.Connection koneksi;
    
    public static java.sql.Connection getKoneksi () {
    if(koneksi == null){
    try {
        String url = "jdbc:mysql://localhost/perpustakaan";
        
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        
        koneksi = (java.sql.Connection) DriverManager.getConnection(url);
    }catch(SQLException t) {
         System.out.println("Error Membuat Koneksi");
    }
    }
    return koneksi;
    }
    
}

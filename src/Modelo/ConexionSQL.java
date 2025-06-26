/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class ConexionSQL {
    // Datos de conexión (¡cambia estos valores!)
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=SistemaSensores;trustServerCertificate=true;";
    private static final String USER = "sa";          // Usuario de SQL Server
    private static final String PASSWORD = "123";  // Contraseña del usuario

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Método para probar la conexión (opcional)
    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            System.out.println("¡Conexión exitosa a SQL Server!");
            JOptionPane.showMessageDialog(null, "Conexión exitosa", "Éxito", JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException e) {
            System.err.println("Error al conectar: " + e.getMessage());
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
    
    


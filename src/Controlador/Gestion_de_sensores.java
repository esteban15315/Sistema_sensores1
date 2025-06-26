package Controlador;

import Modelo.ConexionSQL;
import java.sql.*;
import javax.swing.JOptionPane;

public class Gestion_de_sensores {
    
    public static void agregarSensor(String tipo, int numSensor, double fechaInicio, double fechaRevision) {
        String sql = "INSERT INTO sensores (tipo_sensor, num_sensor, fecha_inicio, fecha_revision) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = ConexionSQL.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, tipo);
            pstmt.setInt(2, numSensor);
            pstmt.setDouble(3, fechaInicio);
            pstmt.setDouble(4, fechaRevision);
            
            pstmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Sensor agregado correctamente");
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al guardar: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public static String buscarSensor(int numSensor) {
        String sql = "SELECT * FROM sensores WHERE num_sensor = ?";
        StringBuilder resultado = new StringBuilder();
        
        try (Connection conn = ConexionSQL.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, numSensor);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                resultado.append("ID: ").append(rs.getInt("id"))
                         .append("\tTipo: ").append(rs.getString("tipo_sensor"))
                         .append("\nFecha Inicio: ").append(rs.getDouble("fecha_inicio"))
                         .append("\tFecha Revisión: ").append(rs.getDouble("fecha_revision"))
                         .append("\n\n");
            }
            
            if (resultado.length() == 0) {
                return "No se encontró el sensor";
            }
            
        } catch (SQLException e) {
            return "Error en la búsqueda: " + e.getMessage();
        }
        
        return resultado.toString();
    }
    
    public static void eliminarSensor(int numSensor) {
        String sql = "DELETE FROM sensores WHERE num_sensor = ?";
        
        try (Connection conn = ConexionSQL.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, numSensor);
            int filas = pstmt.executeUpdate();
            
            if (filas > 0) {
                JOptionPane.showMessageDialog(null, "Sensor eliminado correctamente");
            } else {
                JOptionPane.showMessageDialog(null, "No se encontró el sensor", "Advertencia", JOptionPane.WARNING_MESSAGE);
            }
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al eliminar: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
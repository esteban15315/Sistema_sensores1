package Controlador;

import Modelo.ConexionSQL;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class Actualizar_sistema_de_sensores {
    
    // Método para agregar una nueva actualización
    public static void agregarActualizacion(int numSensor, String descripcionActualizacion, String estado) {
        String sql = "INSERT INTO actualizaciones_sensores (num_sensor, descripcion, estado, fecha_actualizacion) VALUES (?, ?, ?, GETDATE())";
        
        try (Connection conn = ConexionSQL.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, numSensor);
            pstmt.setString(2, descripcionActualizacion);
            pstmt.setString(3, estado);
            
            pstmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Actualización registrada correctamente");
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al registrar actualización: " + e.getMessage(), 
                                       "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    // Método para cargar actualizaciones en una tabla
    public static void cargarActualizaciones(DefaultTableModel modeloTabla) {
        String sql = "SELECT a.num_sensor, s.tipo_sensor, a.descripcion, "
                   + "a.estado, FORMAT(a.fecha_actualizacion, 'dd/MM/yyyy HH:mm') "
                   + "FROM actualizaciones_sensores a "
                   + "JOIN sensores s ON a.num_sensor = s.num_sensor "
                   + "ORDER BY a.fecha_actualizacion DESC";
        
        try (Connection conn = ConexionSQL.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            // Limpiar la tabla existente
            modeloTabla.setRowCount(0);
            
            // Llenar la tabla con los nuevos datos
            while (rs.next()) {
                Object[] fila = {
                    rs.getInt(1),    // num_sensor
                    rs.getString(2), // tipo_sensor
                    rs.getString(3), // descripcion
                    rs.getString(4), // estado
                    rs.getString(5)  // fecha_actualizacion formateada
                };
                modeloTabla.addRow(fila);
            }
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar actualizaciones: " + e.getMessage(), 
                                       "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    // Método para actualizar el estado de un sensor
    public static void actualizarEstadoSensor(int numSensor, String nuevoEstado) {
        String sql = "UPDATE actualizaciones_sensores SET estado = ? WHERE num_sensor = ?";
        
        try (Connection conn = ConexionSQL.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, nuevoEstado);
            pstmt.setInt(2, numSensor);
            
            int filasAfectadas = pstmt.executeUpdate();
            if (filasAfectadas > 0) {
                JOptionPane.showMessageDialog(null, "Estado del sensor actualizado");
            } else {
                JOptionPane.showMessageDialog(null, "Sensor no encontrado", 
                                           "Advertencia", JOptionPane.WARNING_MESSAGE);
            }
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al actualizar estado: " + e.getMessage(), 
                                       "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
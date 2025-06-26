package Controlador;

import Modelo.ConexionSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Parametros_y_Alerta {
    public static void guardarParametros(double phMax, double phMin, double oxMax, double oxMin, 
                                    double tempMax, double tempMin, double turbMax, double turbMin, 
                                    String nivelAlerta) {
    // Validar ANTES de preparar la consulta SQL
    if (phMin >= phMax) {
        JOptionPane.showMessageDialog(null, "El pH mínimo no puede ser mayor al máximo", "Error", JOptionPane.ERROR_MESSAGE);
        return;
    }
    if (oxMin >= oxMax) {
        JOptionPane.showMessageDialog(null, "El oxígeno mínimo no puede ser mayor al máximo", "Error", JOptionPane.ERROR_MESSAGE);
        return;
    }
    if (tempMin >= tempMax) {
        JOptionPane.showMessageDialog(null, "La temperatura mínima no puede ser mayor al máximo", "Error", JOptionPane.ERROR_MESSAGE);
        return;
    }
    if (turbMin >= turbMax) {
        JOptionPane.showMessageDialog(null, "La turbidez mínima no puede ser mayor al máximo", "Error", JOptionPane.ERROR_MESSAGE);
        return;
    }

    String sql = "INSERT INTO parametros_alertas (ph_max, ph_min, ox_max, ox_min, temp_max, temp_min, turb_max, turb_min, nivel_alerta) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    try (Connection conn = ConexionSQL.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        
        // Asignar parámetros (sin validaciones intermedias)
        pstmt.setDouble(1, phMax);
        pstmt.setDouble(2, phMin);
        pstmt.setDouble(3, oxMax);
        pstmt.setDouble(4, oxMin);
        pstmt.setDouble(5, tempMax);
        pstmt.setDouble(6, tempMin);
        pstmt.setDouble(7, turbMax);
        pstmt.setDouble(8, turbMin);
        pstmt.setString(9, nivelAlerta);
        
        pstmt.executeUpdate();
        JOptionPane.showMessageDialog(null, "Parámetros guardados correctamente");
        
    } catch (SQLException e) {
        JOptionPane.showMessageDialog(null, "Error al guardar: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
}
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class InsetsAdm {
    public static void main(String[] args) {
        
        try {
            Connection connection = (Connection) new ConnectionPool().getConnection();
            String sql = "insert into usuarios (nome, email, senha, tipo, acesso) values (?,?,?,?,?)";
            PreparedStatement instruction = connection.prepareStatement(sql);
            
            instruction.setString(1, "Ricardo Ferreira Pariz Silva");
            instruction.setString(2, "opentag@gmail.com");
            instruction.setString(3, BCrypt.hashpw("1234", BCrypt.gensalt()));
            instruction.setString(4, "adm");
            instruction.setString(5, "liberado");

            int result = instruction.executeUpdate();
            instruction.close();
            
            if (result == 1) {
                System.out.println("Cadastro de administrador efetuado com sucesso");                
            } else {
                System.out.println("Cadastro não efetuado");
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        
    }
}

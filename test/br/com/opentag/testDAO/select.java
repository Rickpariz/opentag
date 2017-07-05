/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.testDAO;

import br.com.opentag.dao.ConnectionPool;
import br.com.opentag.dao.UserDAO;
import br.com.opentag.modelo.User;
import com.mysql.jdbc.Connection;
import java.sql.SQLException;

/**
 *
 * @author Ricardo Ferreira Pariz Sikva
 */
public class select {
    public static void main(String[] args) {
        try {
            Connection connection = (Connection) new ConnectionPool().getConnection();
            UserDAO dao = new UserDAO(connection);
            User user = dao.searchEmail("opentagg@gmail.com");
            
            if ( user == null) {
                System.out.println("Não achou");
            } else {
                System.out.println("Achou");
            }
        } catch (SQLException ex) {
            System.out.println("Erro");        }
    }
}

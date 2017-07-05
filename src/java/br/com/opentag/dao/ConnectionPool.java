/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.dao;

import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class ConnectionPool {
    
    private final MysqlConnectionPoolDataSource dataSorce;
    
    public ConnectionPool(){
        MysqlConnectionPoolDataSource pool = new MysqlConnectionPoolDataSource();
        pool.setURL("jdbc:mysql://127.0.0.1:3306/opentag");
        pool.setUser("root");
        pool.setPassword("123456");
        this.dataSorce = pool;
    }
    
    public Connection getConnection() throws SQLException{
        Connection connection = this.dataSorce.getConnection();
       return connection;
    }
}

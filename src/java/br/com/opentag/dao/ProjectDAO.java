/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.dao;

import br.com.opentag.modelo.Project;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class ProjectDAO {
    private final Connection connection;

    public ProjectDAO(Connection connection) {
        this.connection = connection;
    }
    
    public boolean enterBasicInformation(Project project) throws SQLException{
        String sql = "insert into projetos (nome, id_usuario, descricao, plano) values (?,?,?,?)";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setString(1, project.getName());
        instruction.setLong(2, project.getId_user());
        instruction.setString(3, project.getDescription());
        instruction.setString(4, project.getPlan());
        int result = instruction.executeUpdate();
        instruction.close();
        return result == 1;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.dao;

import br.com.opentag.modelo.Project;
import br.com.opentag.modelo.Tools;
import br.com.opentag.modelo.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class ProjectDAO {

    private final Connection connection;

    public ProjectDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean enterBasicInformation(Project project) throws SQLException {
        String sql = "insert into projetos (nome, id_usuario, descricao, plano, status) values (?,?,?,?,?)";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setString(1, project.getName());
        instruction.setLong(2, project.getUser().getId());
        instruction.setString(3, project.getDescription());
        instruction.setString(4, project.getPlan());
        instruction.setString(5, project.getStatus());
        int result = instruction.executeUpdate();
        instruction.close();
        return result == 1;
    }

    public List searchProjects() throws SQLException {
        List<Project> projects = new ArrayList<>();
        String sql = "select  p.id, p.nome, p.id_usuario, p.descricao, p.plano, p.prazo, p.prioridade, p.status, p.porcentagem, u.nome, u.email from projetos P join usuarios U on (P.id_usuario = u.id) order by id desc";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.executeQuery();
        ResultSet result = instruction.getResultSet();
        while (result.next()) {
            User user = new User(result.getLong("id_usuario"), result.getString("u.nome"), result.getString("email"));
            Project project = new Project(
                    result.getLong("id"),
                    result.getString("nome"),
                    result.getString("descricao"),
                    user,
                    result.getString("plano"),
                    Tools.formattedDate(result.getString("prazo")),
                    result.getString("prioridade"),
                    result.getString("status"),
                    result.getInt("porcentagem")
            );
            projects.add(project);
        }
        return projects;
    }

    public Project searchProjectByid(int id) throws SQLException {
        Project project = null;
        String sql = "select  p.id, p.nome, p.id_usuario, p.descricao, p.plano, p.prazo, p.prioridade, p.status, p.porcentagem, u.nome, u.email from projetos P join usuarios U on (P.id_usuario = u.id) where p.id = ?";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setInt(1, id);
        instruction.executeQuery();
        ResultSet result = instruction.getResultSet();
        if (result.next()) {
            User user = new User(result.getLong("id_usuario"), result.getString("u.nome"), result.getString("email"));
            project = new Project(
                    result.getLong("id"),
                    result.getString("nome"),
                    result.getString("descricao"),
                    user,
                    result.getString("plano"),
                    Tools.formattedDate(result.getString("prazo")),
                    result.getString("prioridade"),
                    result.getString("status"),
                    result.getInt("porcentagem")
            );
        }

        return project;
    }

    public boolean updateProject(Project project) throws SQLException {
        String sql = "update projetos set nome = ?,"
                + " descricao = ?, plano = ?, status = ?,"
                + " prioridade = ?, prazo = ?,"
                + " porcentagem = ? where id = ? ";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setString(1, project.getName());
        instruction.setString(2, project.getDescription());
        instruction.setString(3, project.getPlan());
        instruction.setString(4, project.getStatus());
        instruction.setString(5, project.getPriority());
        instruction.setString(6, project.getDeadline());
        instruction.setInt(7, project.getPercentege());
        instruction.setLong(8, project.getId());
        int result = instruction.executeUpdate();
        instruction.close();

        return result == 1;
    }

    public List<Project> searchProjectByIdClient(int id) throws SQLException {
        List<Project> projects = new ArrayList<>();
        String sql = "select * from projetos where id_usuario = ? order by id desc";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setInt(1, id);
        instruction.executeQuery();
        ResultSet result = instruction.getResultSet();
        while (result.next()) {
            Project project = new Project(
                    result.getLong("id"),
                    result.getString("nome"),
                    result.getString("descricao"),
                    result.getString("plano"),
                    Tools.formattedDate(result.getString("prazo")),
                    result.getString("status"),
                    result.getInt("porcentagem")
            );
            projects.add(project);
        }
        
        return projects;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.web;

import br.com.opentag.dao.ConnectionPool;
import br.com.opentag.dao.ProjectDAO;
import br.com.opentag.interfaces.Run;
import br.com.opentag.modelo.Project;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class SearchProjects implements Run {

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String json = null;
        try {
            Connection connection = new ConnectionPool().getConnection();
            ProjectDAO dao = new ProjectDAO(connection);
            List<Project> projects = dao.searchProjects();
            json = gson.toJson(projects);
        } catch (SQLException ex) {
            System.out.println("Error no banco " + ex.getMessage());
        }
        return json;
    }

    @Override
    public String getMethod() {
        return "ajax";
    }

}

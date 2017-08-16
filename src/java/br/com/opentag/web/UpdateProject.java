/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.web;

import br.com.opentag.dao.ConnectionPool;
import br.com.opentag.dao.ProjectDAO;
import br.com.opentag.interfaces.Run;
import br.com.opentag.modelo.MyJsonResponse;
import br.com.opentag.modelo.Project;
import br.com.opentag.modelo.Tools;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class UpdateProject implements Run {

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyJsonResponse jsonResponse = new MyJsonResponse();
        int porc = Integer.parseInt(request.getParameter("porcentagem-projeto"));
        Gson gson = new Gson();
        Project project = new Project(Long.parseLong(request.getParameter("id-projeto")),
                request.getParameter("nome-projeto"),
                request.getParameter("descricao-projeto"),
                request.getParameter("plano"),
                Tools.converteDate(request.getParameter("prazo-projeto")), request.getParameter("prioridade"),
                request.getParameter("status"),
                porc);

        try {
            Connection connection = new ConnectionPool().getConnection();
            ProjectDAO dao = new ProjectDAO(connection);
            if (dao.updateProject(project)) {
                jsonResponse.setStatus(true);
                jsonResponse.setMessage("O projeto foi Editado com sucesso !");
            }
        } catch (SQLIntegrityConstraintViolationException ex) {
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Este nome já foi usado, digite outro");
        } catch (SQLException e) {
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro ao inserir no banco de dados");
            System.out.println(e.getMessage());
        } catch (Exception e) {
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro desconhecido");
        }
        
        String json = gson.toJson(jsonResponse);
        return json;
    }

    @Override
    public String getMethod() {
        return "ajax";
    }

}

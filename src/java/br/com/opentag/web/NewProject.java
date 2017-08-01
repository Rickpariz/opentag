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
public class NewProject implements Run {

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyJsonResponse jsonResponse = new MyJsonResponse();
        Gson gson = new Gson();
        try {
            Project project = new Project(request.getParameter("nome"), request.getParameter("descricao"),
            Long.parseLong(request.getParameter("id_user")), request.getParameter("plano"));
            Connection connection = new ConnectionPool().getConnection();
            ProjectDAO dao = new ProjectDAO(connection);
            if(dao.enterBasicInformation(project)){
              jsonResponse.setStatus(true);
                jsonResponse.setMessage("Projeto solicitado com sucesso ! aguarde a nossa equipe confirmar e fique atento no seu status");
            } else {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Erro ao cadastrar usuário");
            }
            connection.close();
        } catch(SQLIntegrityConstraintViolationException ex){
             jsonResponse.setStatus(false);
             jsonResponse.setMessage("Nome do projeto já existe !");
        } catch(SQLException ex){
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro no DB");
        } catch(Exception ex){
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

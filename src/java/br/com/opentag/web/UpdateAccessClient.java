/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.web;

import br.com.opentag.dao.ConnectionPool;
import br.com.opentag.dao.UserDAO;
import br.com.opentag.interfaces.Run;
import br.com.opentag.modelo.MyJsonResponse;
import br.com.opentag.modelo.Response;
import br.com.opentag.modelo.User;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class UpdateAccessClient implements Run {

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyJsonResponse jsonResponse = new MyJsonResponse();
        Gson gson = new Gson();
        Response resp = new Response();
        User user = new User(Long.parseLong(request.getParameter("id")),
                request.getParameter("nome"),
                request.getParameter("email"));
        user.setAccess(request.getParameter("acesso"));
        try {
            Connection connection = new ConnectionPool().getConnection();
            UserDAO dao = new UserDAO(connection);
            boolean update = dao.updateAccess(user);
            if (update) {
                jsonResponse.setStatus(true);
                jsonResponse.setMessage("O Acesso do Cliente foi Editado com Sucesso !");
                resp.setObjects(user);
                resp.setObjects(jsonResponse);
            }
        } catch (SQLException e) {
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro ao Editar no banco de dados");
            System.out.println(e.getMessage());
        } catch (Exception e) {
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro desconhecido");
        }
        
        String json = gson.toJson(resp);
        return json;
    }

    @Override
    public String getMethod() {
        return "ajax";
    }

}

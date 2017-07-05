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
import com.google.gson.Gson;
import java.io.IOException;
import static java.lang.Long.parseLong;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class UpdatePassword implements Run {

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("senha");
        long id = parseLong(request.getParameter("id"));
        Gson gson = new Gson();
        MyJsonResponse jsonResponse = new MyJsonResponse();
        Connection connection;
        try {
            connection = new ConnectionPool().getConnection();
            UserDAO dao = new UserDAO(connection);
            password = BCrypt.hashpw(password, BCrypt.gensalt());
            if (dao.updatePassword(password, id)) {
                jsonResponse.setStatus(true);
                jsonResponse.setMessage(" Senha editada com sucesso ");
            } else {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage(" Erro ao editar senha ");
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            jsonResponse.setStatus(false);
            jsonResponse.setMessage(" Erro no Banco de Dados ");
        }

        String json = gson.toJson(jsonResponse);
        return json;
    }

    @Override
    public String getMethod() {
        return "ajax";
    }

}

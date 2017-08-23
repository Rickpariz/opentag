/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.web;

import br.com.opentag.dao.ConnectionPool;
import br.com.opentag.dao.UserDAO;
import br.com.opentag.interfaces.Run;
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
public class SearchUserById implements Run {

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String json = null;
        try {
            Connection connection = new ConnectionPool().getConnection();
            UserDAO dao = new UserDAO(connection);
            User user = dao.searchById(Long.parseLong(request.getParameter("id")));
            if (user != null) {
                json = gson.toJson(user);
            } else {
                System.out.println("Error ! User is null");
            }
        } catch (SQLException e) {
            System.out.println("Error in Data Base" + e.getMessage());
        }

        return json;
    }

    @Override
    public String getMethod() {
        return "ajax";
    }

}

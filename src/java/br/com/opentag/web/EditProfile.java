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
import br.com.opentag.modelo.User;
import com.google.gson.Gson;
import java.io.IOException;
import static java.lang.Long.parseLong;
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
public class EditProfile implements Run {

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pegando dados
        long id = parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        
        // criando o user
        User userEdit = new User(name);
        userEdit.setEmail(email);
        userEdit.setId(id);
        // criando objetos de resposta e conexão
        Gson gson = new Gson();
        MyJsonResponse jsonResponse = new MyJsonResponse();
        Connection connection;

        try {
            // abrindo conexao
            connection = new ConnectionPool().getConnection();
            UserDAO dao = new UserDAO(connection);
            // fazendo o update
            if (dao.updateProfile(userEdit)) {
                // setando resposta
                jsonResponse.setStatus(true);
                jsonResponse.setMessage("Editado com sucesso ! A pagina será recarregada");
                // pegando user da session
                User userSession = (User) request.getSession().getAttribute("userSession");
                // sobreescrevendo os valores editados
                userSession.setEmail(userEdit.getEmail());
                userSession.setName(userEdit.getName());
                // Colocando o usuario editado na sessão
                request.getSession().setAttribute("userSession", userSession);
            }

        } catch (SQLIntegrityConstraintViolationException ex) {
            String exception = ex.getMessage();
            if (exception.contains("nome")) {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Este nome já foi usado, digite outro");
            } else {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Esse email já foi usado, digite outro");
            }
        } catch (SQLException e) {
            System.out.println("Erro ao inserir no banco de dados: " + e.getMessage());
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro ao inserir no banco de dados");

        } catch (Exception e) {
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro desconhecido");
            System.out.println("Erro desconhecido");
        }

        String json = gson.toJson(jsonResponse);
        return json;
    }

    @Override
    public String getMethod() {
        return "ajax";
    }

}

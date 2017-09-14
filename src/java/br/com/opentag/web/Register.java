
package br.com.opentag.web;

import br.com.opentag.dao.ConnectionPool;
import br.com.opentag.dao.UserDAO;
import br.com.opentag.interfaces.Run;
import br.com.opentag.modelo.MyJsonResponse;
import br.com.opentag.modelo.User;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class Register implements Run {

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyJsonResponse jsonResponse = new MyJsonResponse();
        Gson gson = new Gson();
        try {
            String name = request.getParameter("nome");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Connection connection = new ConnectionPool().getConnection();
            password = BCrypt.hashpw(password, BCrypt.gensalt());
            User user = new User(email, password);
            user.setName(name);
            UserDAO dao = new UserDAO(connection);
            if (dao.insert(user)) {
                jsonResponse.setStatus(true);
                jsonResponse.setMessage("Usuário cadastrado com sucesso");
            } else {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Erro ao cadastrar usuário");
            }
            connection.close();
        } catch (SQLIntegrityConstraintViolationException ex) {
            String exception = ex.getMessage();
            if (exception.contains("nome")) {
                System.out.println("Nome duplicado");
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Este nome já foi usado, digite outro");
            } else {
                System.out.println("Email duplicado");
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

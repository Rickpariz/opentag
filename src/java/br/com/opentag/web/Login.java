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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 * @author Ricardo Ferreira Pariz Silva
 */
public class Login implements Run {

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = new User(email, password);
        Connection connection;
        MyJsonResponse jsonResponse = new MyJsonResponse();
        try {
            connection = new ConnectionPool().getConnection();
            UserDAO userDAO = new UserDAO(connection);
            User userCheck = userDAO.searchEmail(email);

            if (userCheck == null || !BCrypt.checkpw(password, userCheck.getPassword())) {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Email ou Senha Inválido");
                System.out.println(jsonResponse.getMessage());

            } else {

                jsonResponse.setStatus(true);
                HttpSession session = request.getSession();
                
                session.setAttribute("userSession", userCheck);
                if (userCheck.getType().equals("adm")) {
                    jsonResponse.setMessage("admin/dashboard");
                } else {
                    jsonResponse.setMessage("dashboard");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

        Gson gson = new Gson();
        String json = gson.toJson(jsonResponse);
        return json;
    }

    @Override
    public String getMethod() {
        return "ajax";
    }
   
}

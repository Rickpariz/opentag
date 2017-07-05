/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.controller;

import br.com.opentag.interfaces.Run;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
@WebServlet(name = "Controller", urlPatterns = {"/tag"})
public class Controller extends HttpServlet {

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String run = request.getParameter("execute");
        if (run == null) {
            throw new IllegalArgumentException("Nenhum argumento de execução foi encontrado");
        }
        try {
            run = "br.com.opentag.web." + run;
            Class<?> classRun = Class.forName(run);
            Run instance = (Run) classRun.newInstance();
            String data = instance.run(request, response);
            String method = instance.getMethod();

            switch (method) {
                case "ajax":
                    response.setContentType("text/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().print(data);
                    break;
                case "request":
                    RequestDispatcher dispatcher = request.getRequestDispatcher(data);
                    dispatcher.forward(request, response);
                    break;
                default:
                    response.sendRedirect(data);
                    break;
            }

        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            throw new ServletException(ex);
        }
    }
}

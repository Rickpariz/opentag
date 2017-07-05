/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.web;

import br.com.opentag.interfaces.Run;
import br.com.opentag.modelo.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class Logout implements Run{

    @Override
    public String run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("userSession");
        return "index.html";
    }

    @Override
    public String getMethod() {
        return "response";
    }
    
}

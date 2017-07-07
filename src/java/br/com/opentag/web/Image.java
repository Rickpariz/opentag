/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bahia
 */
@WebServlet(name = "Image", urlPatterns = {"/Image/*"})
public class Image extends HttpServlet {

    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Pegando o nome da imagem da url
        String pathInfo = request.getPathInfo();
        // tirando o caracter barra (/) da String
        String nameImage = pathInfo.replace("/", "");
        // caminho da nossa pasta Upload
        Path path = Paths
                .get("C:\\upload");
        
        File file = new File(path + File.separator + nameImage);
        
        if (file.exists()) {
//            BufferedImage imagem = ImageIO.read(file);
            Files.copy(file.toPath(), response.getOutputStream());
            System.out.println("foi");
        } else {
            System.out.println("Imagem não existe !");
        }
        System.out.println(nameImage);
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

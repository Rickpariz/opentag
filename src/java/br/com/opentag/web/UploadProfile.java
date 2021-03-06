/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.web;

import br.com.opentag.dao.ConnectionPool;
import br.com.opentag.dao.UserDAO;
import br.com.opentag.modelo.MyJsonResponse;
import br.com.opentag.modelo.User;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
@WebServlet(name = "UploadProfile", urlPatterns = {"/dashboard/updateProfile"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 3)
public class UploadProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Pegando informações do usuario da sessão
        User user = (User) request.getSession().getAttribute("userSession");
        Gson gson = new Gson();
        MyJsonResponse jsonResponse = new MyJsonResponse();
        Connection connection;
        Path path = Paths
                .get("C:\\upload");

        try {
            // pegando a imagem
            Part imagem = request.getPart("perfil");

            if (!imagem.getContentType().contains("image")) {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Arquivo invalido ! selecione uma imagem ");
            } else {
                // criando referencia do arquivo
                File img = new File(path + File.separator + "profile" + user.getName() + ".png");
                // criando arquivo em si
                img.createNewFile();
                // gravando imagem no arquivo
                imagem.write(path + File.separator + "profile" + user.getName() + ".png");
                connection = new ConnectionPool().getConnection();
                // grava no db
                if (new UserDAO(connection).insertPictureProfile(user.getId(), img.getName())) {
                    jsonResponse.setStatus(true);
                    jsonResponse.setMessage("Imagem alterada com sucesso ! a pagina será recarregada");
                    // apagando sessão antiga
                    request.getSession().removeAttribute("userSession");
                    // salvando user com dados atualizados na sessão
                    user.setPictureProfile(img.getName());
                    request.getSession().setAttribute("userSession", user);
                } else {
                    jsonResponse.setStatus(false);
                    jsonResponse.setMessage("Erro ao inserir imagem no DB");
                }

            }

        } catch (IOException ex) {
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro ao salvar imagem no local correto");
        } catch (SQLException ex) {
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro no DB");
        } catch (IllegalStateException ex){
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Erro ! tamanho do arquivo maior que 5 MB");
        }
        
        String json = gson.toJson(jsonResponse);
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(json);
    }

}

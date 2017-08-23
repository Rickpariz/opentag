/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.dao;

import br.com.opentag.modelo.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class UserDAO {

    private final Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    public User searchEmail(String email) throws SQLException {
        String sql = "Select * from usuarios where email = ?";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setString(1, email);
        instruction.executeQuery();
        ResultSet resultSet = instruction.getResultSet();
        if (resultSet.next()) {
            String senha = resultSet.getString("senha");
            String emaill = resultSet.getString("email");
            User user = new User(emaill, senha);
            user.setType(resultSet.getString("tipo"));
            user.setId(resultSet.getLong("id"));
            user.setName(resultSet.getString("nome"));
            user.setPictureProfile(resultSet.getString("pictureProfile"));
            user.setPictureCover(resultSet.getString("pictureCover"));
            user.setAccess(resultSet.getString("acesso"));
            return user;
        }

        resultSet.close();
        instruction.close();

        return null;

    }

    public boolean insert(User user) throws SQLException {
        String sql = "insert into usuarios (nome, email, senha) values (?,?,?)";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        String name = user.getName();
        instruction.setString(1, name);
        instruction.setString(2, user.getEmail());
        instruction.setString(3, user.getPassword());

        int result = instruction.executeUpdate();
        instruction.close();
        return result == 1;
    }

    public boolean updateProfile(User user) throws SQLException {
        String sql = "update usuarios set nome= ?, email= ? where id = ?";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        String nome = user.getName();
        instruction.setString(1, nome);
        instruction.setString(2, user.getEmail());
        instruction.setLong(3, user.getId());
        int result = instruction.executeUpdate();
        instruction.close();

        return result == 1;
    }

    public String searchPassword(long id) throws SQLException {
        String sql = "Select senha from usuarios where id = ?";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setLong(1, id);
        instruction.executeQuery();
        ResultSet resultSet = instruction.getResultSet();
        if (resultSet.next()) {
            return resultSet.getString("senha");
        }

        resultSet.close();
        instruction.close();

        return null;
    }

    public boolean updatePassword(String password, long id) throws SQLException {
        String sql = "update usuarios set senha= ? where id = ?";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setString(1, password);
        instruction.setLong(2, id);
        int result = instruction.executeUpdate();
        instruction.close();

        return result == 1;
    }

    public boolean insertPictureProfile(long id,String name) throws SQLException {
        String sql = "update usuarios set pictureProfile= ? where id = ?";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setString(1, name);
        instruction.setLong(2, id);
        int result = instruction.executeUpdate();
        instruction.close();

        return result == 1;
    }

    public List<User> searchUsersClient() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "Select * from usuarios where tipo = ? order by id desc";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setString(1, "cli");
        instruction.executeQuery();
        ResultSet result = instruction.getResultSet();
        while(result.next()){
            User user = new User(result.getLong("id"),
                    result.getString("nome"),
                    result.getString("email"));
            user.setAccess(result.getString("acesso"));
            users.add(user);
        }
        return users;
    }

    public User searchById(long id) throws SQLException {
        User user = null;
        String sql = "select * from usuarios where id=?";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setLong(1, id);
        instruction.executeQuery();
        ResultSet result = instruction.getResultSet();
        if (result.next()) {
            user = new User(result.getLong("id"), result.getString("nome"), result.getString("email"));
            user.setAccess(result.getString("acesso"));
        }
        return user;
    }

    public boolean updateAccess(User user) throws SQLException {
        String sql = "update usuarios set acesso= ? where id = ?";
        PreparedStatement instruction = this.connection.prepareStatement(sql);
        instruction.setString(1, user.getAccess());
        instruction.setLong(2, user.getId());
        int result = instruction.executeUpdate();
        instruction.close();
        return result == 1;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.modelo;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class Project {
    private long id;
    private String name;
    private String description;
    private User user;
    private String plan;
    private String deadline;
    private String priority;
    private String status;
    private int percentege;
    private int id_information;

    public Project(String name, String description, User user, String plan, String status) {
        this.name = name;
        this.description = description;
        this.user = user;
        this.plan = plan;
        this.status = status;
    }

    public Project(long id, String name, String description, User user, String plan, String deadline, String priority, String status, int percentege, int id_information) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.user = user;
        this.plan = plan;
        this.deadline = deadline;
        this.priority = priority;
        this.status = status;
        this.percentege = percentege;
        this.id_information = id_information;
    }
    
    // Getters

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPercentege() {
        return percentege;
    }

    public void setPercentege(int percentege) {
        this.percentege = percentege;
    }

    public int getId_information() {
        return id_information;
    }

    public void setId_information(int id_information) {
        this.id_information = id_information;
    }
    
    
}

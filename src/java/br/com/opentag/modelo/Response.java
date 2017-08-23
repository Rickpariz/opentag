/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.modelo;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ricardo Ferreira Pariz Silva
 */
public class Response {
    private List<Entity> objects = new ArrayList<>();

    public List<Entity> getObjects() {
        return objects;
    }

    public void setObjects(Entity objects) {
        this.objects.add(objects);
    }
    
    
}

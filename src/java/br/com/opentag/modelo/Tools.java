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
public class Tools {

    public static String converteDate(String data) {
        String[] split = data.split("/");
        return split[2] + "-" + split[1] + "-" + split[0];
    }

    public static String formattedDate(String data) {
        if (data == null || data.equals("")) {
            return data;
        } else {
            String[] split = data.split("-");
            return split[2] + "/" + split[1] + "/" + split[0];
        }
    }
}

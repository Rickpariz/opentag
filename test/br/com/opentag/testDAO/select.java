/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.opentag.testDAO;

/**
 *
 * @author Ricardo Ferreira Pariz Sikva
 */
public class select {
    public static void main(String[] args) {
        String data = "2017-08-12";
        String[] split = data.split("-");
        System.out.println( split[2] + "/" + split[1] + "/" + split[0]);
        
    }
}

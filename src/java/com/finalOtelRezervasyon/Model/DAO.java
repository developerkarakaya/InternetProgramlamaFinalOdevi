/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.finalOtelRezervasyon.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "root";
    public DAO() {}
    public  Connection getConnection() {
        Connection connection = null;
         
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
           
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
}

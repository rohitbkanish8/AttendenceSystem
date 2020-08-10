/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author vk
 */
public class DatabaseUtils {
    public static ResultSet executeQuery(String query,Connection con) {
        ResultSet rs = null;
        try{
             Class.forName("com.mysql.jdbc.Driver"); 
             con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(query);
             rs = ps.executeQuery();
        }catch(Exception e) {
            //TODO Handle Exception here
        }
        return rs;
    }
}

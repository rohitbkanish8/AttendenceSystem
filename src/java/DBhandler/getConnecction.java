/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBhandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Rohit B. Kanish
 */
public class getConnecction {
    private static final String url = "jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull"; 
    private static final String user = "root"; 
    private static final String password = "";
    
    private static Connection con =null;
    private static Statement stmt;
    private static ResultSet rs;
    
    public static Connection getDBcon() throws ClassNotFoundException
	    {
	    	try {
				Class.forName("com.mysql.jdbc.Driver");
                                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return con;
	    }
//    public static void main(String[] args) throws ClassNotFoundException {
//        Connection conn = getDBcon();
//        System.out.println("Here is : ");
//    }
}

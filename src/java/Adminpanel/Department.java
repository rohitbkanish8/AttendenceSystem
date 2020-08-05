/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Adminpanel;

import static DBhandler.getConnecction.getDBcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Rohit B. Kanish
 */
public class Department {
    public String putData(String dept) throws ClassNotFoundException, SQLException {
        Connection conn = getDBcon();
        System.out.println("Here is : ");
        PreparedStatement st = conn.prepareStatement("INSERT INTO at_department(dept_name) VALUES('"+dept+"')");
        int x= st.executeUpdate();
                    if(x>0){
                        return "Department added successfully";
                    }
                    else{
                        return "Department creation fails";
                    }
    }
    
    public ResultSet getData(int dept) throws ClassNotFoundException, SQLException {
        Connection conn = getDBcon();
        System.out.println("Here is : ");
        PreparedStatement st = conn.prepareStatement("SELECT * FROM at_department WHERE dept_id='"+dept+"'");
        ResultSet rs = st.executeQuery();
        return rs;
    }
    
    public ResultSet viewData() throws ClassNotFoundException, SQLException {
        Connection conn = getDBcon();
        System.out.println("Here is : ");
        PreparedStatement st = conn.prepareStatement("SELECT * FROM at_department");
        ResultSet rs = st.executeQuery();
        return rs;
    }
    
    public String editData(int dept_id, String dept) throws ClassNotFoundException, SQLException {
        Connection conn = getDBcon();
        System.out.println("Here is : ");
        PreparedStatement st = conn.prepareStatement("UPDATE at_department SET dept_name='"+dept+"' WHERE dept_id='"+dept_id+"'");
        int x= st.executeUpdate();
                    if(x>0){
                        return "Department updated successfully";
                    }
                    else{
                        return "Department updation fails";
                    }
    }
}

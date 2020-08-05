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
public class Course {
    public String putData(int dept,String course) throws ClassNotFoundException, SQLException {
        Connection conn = getDBcon();
        System.out.println("Here is : ");
        PreparedStatement st = conn.prepareStatement("INSERT INTO at_course (course_name,dept_id) VALUES('"+course+"','"+dept+"')");
        int x= st.executeUpdate();
                    if(x>0){
                        return "Course added successfully";
                    }
                    else{
                        return "Course creation fails";
                    }
    }
    
    public ResultSet getData(int c_id) throws ClassNotFoundException, SQLException {
        Connection conn = getDBcon();
        System.out.println("Here is : ");
        PreparedStatement st = conn.prepareStatement("SELECT * FROM at_course WHERE course_id='"+c_id+"'");
        ResultSet rs = st.executeQuery();
        return rs;
    }
    
    public ResultSet viewData() throws ClassNotFoundException, SQLException {
        Connection conn = getDBcon();
        System.out.println("Here is : ");
        PreparedStatement st = conn.prepareStatement("SELECT * FROM at_course");
        ResultSet rs = st.executeQuery();
        return rs;
    }
    
    public String editData(int c_id,int dept_id, String course) throws ClassNotFoundException, SQLException {
        Connection conn = getDBcon();
        System.out.println("Here is : ");
        PreparedStatement st = conn.prepareStatement("UPDATE at_course SET course_name='"+course+"', dept_id='"+dept_id+"' WHERE course_id='"+c_id+"'");
        int x= st.executeUpdate();
                    if(x>0){
                        return "Department updated successfully";
                    }
                    else{
                        return "Department updation fails";
                    }
    }
}

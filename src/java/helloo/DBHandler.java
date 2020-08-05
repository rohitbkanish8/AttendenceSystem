package icsd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.pool.OracleDataSource;

public class DBHandler {
	Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rset=null;
	
	public Connection getDBcon()
	    {
	    	Connection con=null;
	    	try {
				OracleDataSource ods = new OracleDataSource();
				ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
				con=ods.getConnection("g1","icsd");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return con;
	    }
	
	public ClsProduct getRowfromProductbyPid(String strPid)
	{
		ClsProduct obj=null;
		Connection con = getDBcon();
		PreparedStatement stmt;
		System.out.println(strPid+"mai frse print hua ");
		System.out.println("function called");
		try {
			stmt = con.prepareStatement("select * from products where Prodid=?");
			stmt.setString(1, strPid);
			ResultSet rset = stmt.executeQuery();
			if(rset.next())
			{
				System.out.println("rset mai aagya");
				String strProdId=rset.getString("ProdId"),
				       strProdName=rset.getString("ProdName"),
				       strCatId = rset.getString("CategoryId"),
				       strProdImg = rset.getString("ProdImg"),
				       strProdDesc = rset.getString("ProdDesc");
				double dblPrice=rset.getDouble("Price");
				int intQty = rset.getInt("qty");
				obj= new ClsProduct(strProdId, strCatId, strProdName, strProdImg, strProdDesc, dblPrice, intQty);
				System.out.println("function se bhr aagye");
				System.out.println(obj);
		   }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return(obj);
		
	} 
		public boolean isValidUser(String strunm,String strpwd) {
			con=getDBcon();
			try {
			stmt=con.prepareStatement("select * from login_id where username=? and pass=?");
			stmt.setString(1, strunm);
			stmt.setString(2, strpwd);
			rset=stmt.executeQuery();
			if(rset.next())
			{
				return true;
			}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		return false;	
	}
}


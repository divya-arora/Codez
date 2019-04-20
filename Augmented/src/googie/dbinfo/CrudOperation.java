package googie.dbinfo;
import java.sql.*;
public class CrudOperation 
{
	private static Connection con = null;
	public static Connection createConnection()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
	catch(ClassNotFoundException cne)
	{
		System.out.println(cne);
		cne.printStackTrace();
	}
		try
		{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/augment","root","admin");
			
		}
	catch(SQLException se)
	{System.out.println(se);
	}
	return con;
	}
}

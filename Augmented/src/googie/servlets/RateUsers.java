package googie.servlets;

import googie.beans.Reg;
import googie.dbinfo.CrudOperation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RateUsers
 */
@WebServlet("/RateUsers")
public class RateUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
    private PreparedStatement ps=null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RateUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession hs=request.getSession(false);
		String likeid=(String)hs.getAttribute("userinfo");
	 String uid=(String)request.getParameter("txtuid");
        String urate=(String)request.getParameter("gender");
        int flag=0;
        Reg r=new Reg();
        r.setUserid(uid);
        r.setRate(urate);
        System.out.print("hjhj"+uid);
        System.out.print(urate);
        PrintWriter pw=response.getWriter();
       con=CrudOperation.createConnection();
       String stcheck="select * from rating";
       String strrate="insert into rating(userid,rate,likeid,lstatus,comments) values(?,?,?,?,?)";
       try
       {
      	 ps=con.prepareStatement(strrate);
      	 ps.setString(1,r.getUserid());
      	 ps.setString(2,r.getRate());
      	 ps.setString(3,likeid);
      	 ps.setInt(4,1);
      	 ps.setString(5,"null");
      	
       try
       {
    	   PreparedStatement pscheck=con.prepareStatement(stcheck);
    	   ResultSet rsc=pscheck.executeQuery();
    	   if(rsc!=null)
    	   {
    while(rsc.next())
    	   {
    		   String present=rsc.getString("likeid");
    		   String user=rsc.getString("userid");
    		   int like=rsc.getInt("lstatus");
    		   if(like==1 && present.equalsIgnoreCase(likeid) && user.equalsIgnoreCase(uid))
    		   {
    			 pw.print("already rated");  
    			 flag=1;
    		   }
    			   
    	   }
       }
       }
       catch(SQLException see)
		{
			System.out.print(see);
		}
		if(flag==0)
			{
       
   
        		int rs=ps.executeUpdate();
        		if(rs>0)
        		{
         
         System.out.println("1 row inserted");
         response.sendRedirect("/Augmented/notify/rating.html");
        		}
        		else
        		{
        			response.sendRedirect("/Augmented/jsp/Views.jsp");
        		}
         }
       }
        catch (SQLException e) {
			// TODO: handle exception
        	System.out.print(e);
		}
	

       }
	}

	
	
	
	
	
	

	
	
	



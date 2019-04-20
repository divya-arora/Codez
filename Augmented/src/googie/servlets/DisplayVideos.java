package googie.servlets;
import googie.dbinfo.*;

import java.io.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class DisplayVideos
 */
@WebServlet("/DisplayVideos")
public class DisplayVideos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con =null;
	private HttpSession hs=null;
	private PreparedStatement ps =null;
	private ResultSet rs =null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayVideos() {
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
				
				int t=0;
		con=CrudOperation.createConnection();
		String playing="select name from videos";
		try
		{
			
			ps=con.prepareStatement(playing);
			int rw=ps.executeUpdate();
			if(rs.next())
			{
				
				System.out.println("1 row inserted");
				response.sendRedirect("/Augmented/jsp/createprofile.jsp?ms2=Welcome!!Profile has been created!!");
			}
		
		}
		
		catch (SQLException ef) {
			System.out.println(ef);
		
		}
		}
	}


	
	

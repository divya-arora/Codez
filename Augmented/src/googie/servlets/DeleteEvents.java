package googie.servlets;

import googie.dbinfo.CrudOperation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteEvents
 */
@WebServlet("/DeleteEvents")
public class DeleteEvents extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEvents() {
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
	int flag=0;
	String strdel="Delete from eventss where eventid=?";
	
	con=CrudOperation.createConnection();
	try
	{
		String [] deluserid=request.getParameterValues("chkaccdel");
		ps=con.prepareStatement(strdel);
		con.setAutoCommit(false);
		for(int i=0;i<deluserid.length;i++)
		{
			ps.setString(1, deluserid[i]);
			ps.addBatch();
		}
			int[] ru=ps.executeBatch();
			con.commit();
			flag=1;
			if(flag==1)
			{
				String strdelusers="Delete from eventusers where eventid=?";	
				try
				{
					String [] deluseridu=request.getParameterValues("chkaccdel");
					PreparedStatement psusers=con.prepareStatement(strdelusers);
					con.setAutoCommit(false);
					for(int i=0;i<deluseridu.length;i++)
					{
						psusers.setString(1, deluseridu[i]);
						psusers.addBatch();
					}
						int[] ruu=psusers.executeBatch();
						con.commit();
						con.setAutoCommit(true);
				}
						catch(SQLException se)
						{
							System.out.println(se);
						}

String strdelimg="Delete from eventimages where eventid=?";	
try
{
	String [] deluseridi=request.getParameterValues("chkaccdel");
	PreparedStatement psimg=con.prepareStatement(strdelimg);
	con.setAutoCommit(false);
	for(int i=0;i<deluseridi.length;i++)
	{
		psimg.setString(1, deluseridi[i]);
		psimg.addBatch();
	}
		int[] rui=psimg.executeBatch();
		con.commit();
		response.sendRedirect("/Augmented/jsp/deleteevents.jsp");
		con.setAutoCommit(true);
}
		catch(SQLException se)
		{
			System.out.println(se);
		}
			String strdelaudio="Delete from eventaudios where eventid=?";	
			try
			{
				String [] deluserida=request.getParameterValues("chkaccdel");
				PreparedStatement psaudio=con.prepareStatement(strdelaudio);
				con.setAutoCommit(false);
				for(int i=0;i<deluserida.length;i++)
				{
					psaudio.setString(1, deluserida[i]);
					psaudio.addBatch();
				}
					int[] rua=psaudio.executeBatch();
					con.commit();
					con.setAutoCommit(true);
			}
					catch(SQLException see)
					{
						System.out.println(see);
					}
					
			String strdelvideo="Delete from eventvideos where eventid=?";	
			try
			{
				String [] deluseridv=request.getParameterValues("chkaccdel");
				PreparedStatement psvideo=con.prepareStatement(strdelvideo);
				con.setAutoCommit(false);
				for(int i=0;i<deluseridv.length;i++)
				{
					psvideo.setString(1, deluseridv[i]);
					psvideo.addBatch();
				}
					int[] ruv=psvideo.executeBatch();
					con.commit();
					
			con.setAutoCommit(true);
			}
					catch(SQLException see)
					{
						System.out.println(see);
					}
			
con.setAutoCommit(true);
flag=0;
			}
			else if(flag==0)
			{
				response.sendRedirect("/Augmented/jsp/deleteevents.jsp");
			}
				
	}
					catch(SQLException ses)
					{
						System.out.println(ses);
						
					}
			
	
	}

	
}



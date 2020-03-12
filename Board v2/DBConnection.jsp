<%@ page import="java.sql.*" %>
<%@ page import="java.sql.SQLException" %>
<%
class DBConnection{
	final static String url = "IP주소";
	final static String user = "ID";
	final static String password = "PASSWORD";
	
	public DBConnection(){}
	
	public Connection getConnection() throws SQLException{
		Connection conn = null;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,user,password);
		} 
		catch(Exception e){
			 if(e instanceof ClassNotFoundException){
				System.out.println("드라이버 로딩 실패 : " + e.toString());
				return conn;
			}else{
				System.out.println("디비 연결 에러 : " + e.toString());
				return conn;
			}
		}
		return conn;
	}
}
%>

<%@ include file="DBConnection.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	class Paging{
		//전체 게시물 수를 구하는 함수
		public int getTotal(){
			int countTotal=0;
			
			String strSQL = "Select count(*) countTotal from test_nsz.tb_Board";
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://220.69.247.5:3306/here?characterEncoding=UTF-8&serverTimezone=UTC","root","1q2w3e4r!");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(strSQL);
				
				if(rs.next()){
					countTotal = rs.getInt("countTotal");
				}
			} 
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				try{
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				}
				catch(SQLException e){
				}
			}
			return countTotal;
		}
	}
	class UpViews{
		public int updateView(int num,int views){
			String strSQL = "Update test_nsz.tb_Board SET views="+views+" where num="+num+";";
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://220.69.247.5:3306/here?characterEncoding=UTF-8&serverTimezone=UTC","root","1q2w3e4r!");
				stmt = conn.createStatement();
				if(stmt.executeUpdate(strSQL)>0){
					
				}
			} 
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				try{
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				}
				catch(SQLException e){
				}
			}
			return views;
		}
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
	<h3>카테고리별 판매 목록</h3>
	
	<table border="1">
    	<tr>
    		<td>카테고리명</td>
    		<td>판매 액수</td>
    		<td>판매 갯수</td>
    	</tr>
    <%
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
        Statement stmt=con.createStatement();

        String query = "SELECT " +
	        			   "CATEGORY.NAME as NAME, "+
        			   	   "SUM (PAYMENT_HISTORY.ORDER_PRICE) as PRICE, " +
	        			   "SUM (PAYMENT_HISTORY.ORDER_COUNT) as COUNT " +
        			   "FROM " +
	        		   "CATEGORY, PAYMENT_HISTORY, PRODUCT "+
        			   "WHERE PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.ID and " +
	        		   "PRODUCT.CATEGORY_ID = CATEGORY.ID " +
					   "GROUP BY " +
        			   "CATEGORY.NAME ";
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
            %>
            	<tr>
            		<td> <%=rs.getString("NAME") %> </td>
            		<td> <%=rs.getInt("PRICE") %> </td>
            		<td> <%=rs.getInt("COUNT") %> </td>
            	</tr>
            <%
        }
        con.close();
    }
    catch(Exception e)
    { 
        System.out.println(e);
    }
%></table>

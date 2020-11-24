	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <h3>상품 목록</h3>
    
    <table border="1">
    	<tr>
    		<td>ID</td>
    		<td>주문일</td>
    		<td>주문 상태</td>
    		<td>주문 개수</td>
    		<td>주문 가격</td>
    		<td>상품명</td>
    		<td>유저명</td>
    	</tr>
    <%
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
        Statement stmt=con.createStatement();

        String query = "SELECT " +
	        			   "PAYMENT_HISTORY.ID as ID, " +
        				   "PAYMENT_HISTORY.ORDER_DATE as ORDER_DATE, " +
	        			   "PAYMENT_HISTORY.ORDER_STATUS as ORDER_STATUS, " + 
	        			   "PAYMENT_HISTORY.ORDER_COUNT as ORDER_COUNT, " +
	        			   "PAYMENT_HISTORY.ORDER_PRICE as ORDER_PRICE, " +
	        			   "PRODUCT.NAME as NAME, " + 
	        			   "MEMBER.NAME as USER_NAME " + 
        			   "FROM PRODUCT, MEMBER, PAYMENT_HISTORY " +
        			   "WHERE PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.ID and " +
        			   "PAYMENT_HISTORY.MEMBER_ID = MEMBER.ID ";
						
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()) {
            %>
            	<tr>
            		<td> <%=rs.getInt("ID") %> </td>
            		<td> <%=rs.getString("ORDER_DATE") %> </td>
            		<td> <%=rs.getString("ORDER_STATUS") %> </td>
            		<td> <%=rs.getInt("ORDER_COUNT") %> </td>
            		<td> <%=rs.getInt("ORDER_PRICE") %> </td>
            		<td> <%=rs.getString("NAME") %> </td>
            		<td> <%=rs.getString("USER_NAME") %> </td>
            		
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
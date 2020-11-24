<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
	Statement stmt=con.createStatement(); 
	
	%>
<h3>판매 등록</h3>
<table border="1">
	<form action="action/payment_insert.jsp">
		<tr>
			<td>
				<p>프로덕트 ID</p>
			</td>
			<td>
				<select name="product_id">
					 
					<%
						String product_query = "SELECT ID, NAME FROM PRODUCT";
						
						ResultSet product_rs=stmt.executeQuery(product_query);  
						while(product_rs.next()) {
							%><option value="<%=product_rs.getInt(1) %>"><%=product_rs.getString(2) %></option><%
						}

					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<p>맴버 ID</p>
			</td>
			<td>
				<select name="member_id">
					 
					<%
						String member_query = "SELECT ID, NAME FROM MEMBER";
						
						ResultSet member_rs=stmt.executeQuery(member_query);  
						while(member_rs.next()) {
							%><option value="<%=member_rs.getInt(1) %>"><%=member_rs.getString(2) %></option><%
						}

					%>
				</select>
			</td>
		</tr>
		<tr>
			<td><p>이름</p></td> 
			<td><input type="text" name="name"></td> 
		</tr>
		<tr>
			<td><p>가격</p></td> 
			<td><input type="number" name="price"></td> 
		</tr>
		<tr>
			<td><p>재고</p></td> 
			<td><input type="number" name="stock"></td> 
		</tr>
		<tr>
			<td><p>설명</p></td> 
			<td><input type="text" name="description"></td> 
		</tr>
		<tr>
			<td><p>원산지</p></td> 
			<td><input type="text" name="origin"></td> 
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="제출">
				<input type="button" value="다시쓰기">
			</td>
		</tr>
	</form>
</table>

<%
	con.close();  
}
catch(Exception e)
{ 
	System.out.println(e);
}  

%>
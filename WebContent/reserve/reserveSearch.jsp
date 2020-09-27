<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>
<table>
<%
	String sql = "select carno, carname, brand, carnumber, storeno_carinfo, sizeclass, price, oiltype, fueleff, residualoil "
		+" from carinfo";
	String s_data = request.getParameter("s_data");
	if( s_data != null ) {
		sql += " where " + s_data;
	}
	System.out.println(sql);
	
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) {
		String carno = rs.getString("carno");
		String carname = rs.getString("carname");
		String brand = rs.getString("brand");
		String carnumber = rs.getString("carnumber");
		String storeno_carinfo = rs.getString("storeno_carinfo");
		String sizeclass = rs.getString("sizeclass");
		String price = rs.getString("price");
		String oiltype = rs.getString("oiltype");
		String fueleff = rs.getString("fueleff");
	String residualoil = rs.getString("residualoil");
		
		%>
		<tr>
			<td><%=carno %></td>
			<td><%=carname %></td>
			<td><%=carnumber %></td>
			<td><%=brand %>
			<td><%=storeno_carinfo %></td>
			<td><%=sizeclass %></td>
			<td><%=price %></td>
			<td><%=oiltype %></td>
			<td><%=fueleff %></td>
			<td><%=residualoil %></td>
		</tr>
		<%
	}
	%>
</table>
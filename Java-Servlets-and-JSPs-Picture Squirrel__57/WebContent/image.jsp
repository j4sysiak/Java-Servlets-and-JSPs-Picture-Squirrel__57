<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="header.jsp" >
	<c:param name="title" value="Picture Squirrel - View Image"></c:param>
</c:import>

<center>

<sql:setDataSource var="ds" dataSource="jdbc/webshop" />

<sql:query dataSource="${ds}" sql="select * from images where id=?" var="results" >
	<sql:param>${param.image}</sql:param>
</sql:query>

  <c:set scope="page" var="image" value="${results.rows[0]}"></c:set>
  <c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set>
  
 	<H2>
		<c:out value="${fn:toUpperCase(fn:substring(image.stem, 0, 1))}${fn:toLowerCase(fn:substring(image.stem, 1, -1))}" />
	</H2>
  
  <table style="border: none;">
	<tr>
	<td>
		<br style="margin-bottom: 1px;"> 
		<span class="attribution">Image by <a class="attribution" target="_blank" href="${image.attribution_url}">${image.attribution_name}</a>
		</span>
		<br>
  	<img src="${pageContext.request.contextPath}/pics/${imgname}" />
    </td>
    
    
    
    
    
    
    <td>
    		<form action='<c:url value="/gallery" />' method="post">
    		
					<input  type="hidden" name="action" value="rate" /> 
					<input 	type="hidden" name="image" value="${image.id}" />

					<table style="padding: 20px; border: none;">
						<tr>
							<td><h3>
									<i>Rate It!</i>
								</h3></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="5">5
								- Amazing</input></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="4">4
								- Good</input></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="3"
								checked="checked">3 - Average</input></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="2">2
								- Bad</input></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="1">1
								- Horrendous</input></td>
						</tr>
						<tr>
							<td align="left"><input type="submit" name="submit"
								value="OK"></input></td>
						</tr>
					</table>
			</form>
    </td>
    
    
    </tr>
  </table>
  </center>
  
  <c:import url="footer.jsp" />































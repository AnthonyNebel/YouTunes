<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="youtunes.Artist"%>

<jsp:useBean id="artistDao" scope="application" class="youtunes.JdbcArtistDao" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>BSYouTunes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="../assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>
	<jsp:include page="../TopNav.jsp" flush="true"/>
	<div class="py-5 container width-50"><h4 class="text-center">Artists</h4>
        <p class="text-center">
        	<a class="btn btn-outline-secondary text-center w-50" href="youtunes?action=newArtist">Add Artist</a></p>
		<table class="table">
    		<thead>
        		<tr>
		            <th>Artist ID</th>
		            <th>First Name</th>
		            <th>Last Name</th>
		            <th>Actions</th>
        		</tr>
    		</thead>
    		<%
				List<Artist> artists = artistDao.list(); 
				Iterator<Artist> iterator = artists.iterator();
				while (iterator.hasNext()) {
					
					Artist artist = (Artist)iterator.next();
			%>
    		
    		
    		<tbody>
        		<tr>
		            <td><%=artist.getArtistId()%></td>
					<td><%=artist.getFirstName()%></td>
					<td><%=artist.getLastName()%></td>
					<td>
						<a href="youtunes?action=artistDetails&artistId=<%=artist.getArtistId()%>" class="link">Edit</a>
						<a href="youtunes?action=deleteArtist&artistId=<%=artist.getArtistId() %>" class="link">Delete</a>
					</td>
        		</tr>
       		<% } %>
    		</tbody>
		</table>
    </div>
    <jsp:include page="../Footer.jsp" flush="true"/>
    <jsp:include page="../ScriptFooter.jsp" flush="true"/>
</body>
</html>
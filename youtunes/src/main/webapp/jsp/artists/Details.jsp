<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	<div class="container py-5 width-50">
		<h4>Artist Details</h4>
	<% 
		try {
			
			String artistId = request.getParameter("artistId");
			Artist artist = artistDao.find(Long.parseLong(artistId)); 
			
			if (artist != null) {
	%>
        <form>
        	<input class="form-control" type="hidden" value="updateArtist">
        	<input class="form-control" type="hidden" name="artistId" value="<%=artist.getArtistId() %>">
            <div class="mb-3">
            	<label class="form-label" for="firstName">First Name</label>
            	<input class="form-control" type="text" id="firstName" name="firstName" value="<%=artist.getFirstName() %>">
           	</div>
            <div class="mb-3">
            	<label class="form-label" for="lastName">Last Name</label>
            	<input class="form-control" type="text" id="lastName" name="lastName" value="<%=artist.getLastName() %>">
           	</div>
           	<button class="btn btn-primary" type="submit">Submit</button>
        </form>
	<%
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>
    	<a href="store?action=showArtists">Artists</a>
    </div>
	
	<jsp:include page="../Footer.jsp" flush="true"/>
    <jsp:include page="../ScriptFooter.jsp" flush="true"/>
</body>
</html>
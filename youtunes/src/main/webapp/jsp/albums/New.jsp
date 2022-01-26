<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="youtunes.Artist"%>
<jsp:useBean id="artistDao" scope="application" class="youtunes.JdbcArtistDao"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>New Album</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
	<jsp:include page="../TopNav.jsp" flush="true"/>
	<div class="container py-5 width-50"><h4>Create New Album</h4>
        <form id="albumForm">
        	<input class="form-control" type="hidden" name="action" value="createAlbum">
            <div class="mb-3">
            	<label class="form-label" for="title">Album Title</label>
            	<input class="form-control" type="text" id="title" name="title">
           	</div>
            <div class="mb-3">
            	<label class="form-label" for="price">Price</label>
            	<input class="form-control" type="text" id="price" name="price">
           	</div>
            <div class="mb-3">
            	<label class="form-label" for="img">Image Url</label>
            	<input class="form-control" type="text" id="img_url" name="img_url">
           	</div>
            <div class="mb-3">
            	<label class="form-label" for="genre">Genre</label>
            	<select id="genre" class="form-select" name="genre">
    				<option value="0" selected>Select</option>
    				<option value="Pop">Pop</option>
    				<option value="Rock">Rock</option>
				</select>
			</div>
            <div class="mb-3">
            	<label class="form-label" for="artist">Artist</label>
            	<select class="form-select" id="artist" name="artist">
    				<option value="0" selected>Select</option>
	    				<%
							List<Artist> artists = artistDao.list();
							Iterator<Artist> iterator = artists.iterator();
							while (iterator.hasNext()) {
								
								Artist artist = (Artist)iterator.next();
						
						%>
    				<option value="<%=artist.getArtistId()%>"><%=artist.getFirstName()%>, <%=artist.getLastName()%></option>
    						<% } %>
				</select></div>
			<button class="btn btn-primary float-end" id="btnSubmit" type="submit">Submit</button>
        </form>
    </div>
    <jsp:include page="../Footer.jsp" flush="true"/>
    <jsp:include page="../ScriptFooter.jsp" flush="true"/>
    <%System.out.println("AlbumNewPage"); %>
</body>
</html>
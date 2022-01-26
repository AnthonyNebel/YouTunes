<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="youtunes.Artist"%>
<%@page import="youtunes.Album"%>

<jsp:useBean id="albumDao" scope="application" class="youtunes.JdbcAlbumDao" />
<jsp:useBean id="artistDao" scope="application" class="youtunes.JdbcArtistDao" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Album Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="../assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>
	<jsp:include page="../TopNav.jsp" flush="true"/>
    <div class="container py-5 width-50">
    	<% 
			try {
				
				String albumId = request.getParameter("albumId");
				Album album = albumDao.find(Long.parseLong(albumId));
				
				if (album != null) {
		%>
    	
        <form id="albumForm">
        	<input class="form-control" type="hidden" name="action" value="updateAlbum">
        	<input class="form-control" type="hidden" name="albumId" value="<%=album.getAlbumId()%>">
            <div class="mb-3">
            	<label class="form-label" for="title">Album Title</label>
            	<input class="form-control" type="text" id="title" name="title" value="<%=album.getTitle() %>">
           	</div>
            <div class="mb-3">
            	<label class="form-label" for="price">Price</label>
            	<input class="form-control" type="text" id="price" name="price" value="<%=album.getPrice() %>">
           	</div>
            <div class="mb-3">
            	<label class="form-label" for="url">Image url</label>
           		<input class="form-control" type="text" id="img_url" name="img_url" value="<%=album.getImgUrl()%>">
       		</div>
            <div class="mb-3">
            	<label class="form-label" for="genre">Genre</label>
            	<select class="form-select" id="genre" name="genre">
    				<option value="0" selected>Select</option>
    				<option value="Pop" <% if (album.getGenre().equals("Pop")) { %> selected <% } %>>Pop</option>
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
    				<option value="<%=artist.getArtistId()%>" <% if (album.getArtistId() == artist.getArtistId()) { %> selected <% } %>><%=artist.getLastName()%>, <%=artist.getFirstName()%></option>
    				<% } %>
				</select>
			</div>
			<button class="btn btn-primary float-end" id="btnSubmit" type="submit">Submit</button>
        </form>
        <a href="youtunes?action=../showAlbums">Albums</a>
        	<% 	
				}	
			}
			catch (Exception e) {
				//System.out.println(e.getMessage());
			}
		
			%>
    </div>
    <jsp:include page="../Footer.jsp" flush="true"/>
    <jsp:include page="../ScriptFooter.jsp" flush="true"/>
    <%System.out.println("albumDetailsPage"); %>
</body>
</html>
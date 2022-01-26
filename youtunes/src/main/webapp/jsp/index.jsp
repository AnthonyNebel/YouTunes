<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="youtunes.Album"%>
<jsp:useBean id="albumDao" scope="application" class="youtunes.JdbcAlbumDao" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>YouTunes</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer-basic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" type="text/css">
</head>

<body>
	<jsp:include page="TopNav.jsp" flush="true"/>
    <div class="container" id="index-welcome">
        <h1>Welcome to YouTunes!</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pretium eros erat, eu euismod erat
        feugiat nec. Pellentesque pulvinar enim vel nulla congue semper. Pellentesque volutpat sem ac lacus ullamcorper, 
        et sagittis magna egestas. Nam blandit eros purus, id dictum orci malesuada ac. Quisque aliquet pretium odio, ut 
        faucibus ipsum venenatis in. Sed laoreet massa sapien, vitae condimentum lacus eleifend vel. Curabitur vulputate 
        blandit risus in lacinia. Duis facilisis vitae mi id sodales. Quisque pulvinar eget ex at blandit.<br></p>
        <p>
        	<a href="youtunes?action=newAlbum" class="btn btn-primary my-2">Add New Album</a>
    </div>
    <div class="py-5 bg-light">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        	<%
				List<Album> albums = albumDao.list();
				Iterator<Album> iterator = albums.iterator();
				while (iterator.hasNext()) {
					Album album = (Album)iterator.next();
			%>
            <div class="col">
                <div class="card shadow-sm"><img class="card-image-top" height="400" src="${pageContext.request.contextPath}/images/<%=album.getImgUrl()%>"></div>
                <div class="card-body">
                    <p class="card-text">
                        <span><%=album.getTitle()%></span>
                        <br />
                        <small class="text-muted"><em><%=album.getGenre()%></em></small>
                    </p>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                        	<a href="youtunes?action=albumDetails&albumId=<%=album.getAlbumId()%>" class="btn btn-sm btn-outline-secondary">Edit</a>
                        	<a href="youtunes?action=deleteAlbum&albumId=<%=album.getAlbumId()%>" class="btn btn-sm btn-outline-secondary">&emsp;Delete</a>
                       	</div>
                       	<small class="text-muted"><%=album.getPrice()%></small>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    <%System.out.println("index.jsp"); %>
    <jsp:include page="Footer.jsp" flush="true"/>
    <jsp:include page="ScriptFooter.jsp" flush="true"/>
</body>
</html>
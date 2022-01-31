<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="youtunes.Artist"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>New Artist</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="assets/css/footer-basic.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
	<jsp:include page="../TopNav.jsp" flush="true"/>
	<div class="py-5 container width-50"><h4>New Artist</h4>
        <form>
        	<input class="form-control" name="action" type="hidden" value="createArtist">
            <div class="mb-3">
            	<label class="form-label" for="firstName">First Name</label>
            	<input class="form-control" type="text" id="firstName" name="firstName">
           	</div>
            <div class="mb-3">
            	<label class="form-label" for="lastName">Last Name</label>
            	<input class="form-control" type="text" id="lastName" name="lastName">
           	</div>
           	<button class="btn btn-primary float-end" type="submit">Save</button>
        </form>
        <a href="youtunes?action=artistsList">Artist</a>
    </div>
    <jsp:include page="../Footer.jsp" flush="true"/>
    <jsp:include page="../ScriptFooter.jsp" flush="true"/>
    <%System.out.println("artistNewPage"); %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>About YouTunes!</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer-basic.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css" type="text/css">
</head>

<body>
	<jsp:include page="TopNav.jsp" flush="true"/>
    <div class="container py-5 width-50">
        <div class="row">
            <div class="col-12"><h4>About YouTunes!</h4></div>
        </div>
        <div class="row">
            <div class="col-4">
            	<img src="${pageContext.request.contextPath}/images/AboutPic.jpeg"/>
           	</div>
            <div class="col-8">
                <p><br>We are dedicated to providing the world the newest hot music for everyone to discover and enjoy.
                YouTunes began with a mission to give artists the freedom to release their own music on their terms. The
                result? A multi-platform web application that delivers artist's owned music to their fans without the
                drama of record contracts or ownership disputes. Our service lets artists deliver their music directly
                to you. Discover your favorite music. Thank you for your support!<br><br></p>
            </div>
        </div>
    </div>
    <%System.out.println("aboutPage");%>
    <jsp:include page="Footer.jsp" flush="true"/>
    <jsp:include page="ScriptFooter.jsp" flush="true"/>
</body>
</html>
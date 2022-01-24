<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Contact Us YouTunes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
</head>

<body>
	<jsp:include page="TopNav.jsp" flush="true"/>
    <div class="container py-5 width-50">
        <div class="row">
            <div class="col-12 text-center"><h4>Heading</h4></div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="row text-center">
                    <div class="col-12">
                        <h1>Address&nbsp;<i class="fas fa-map-marked-alt"></i></h1>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-12">
                        <ul class="list-group">
                            <li class="list-group-item border-0">1000 Galvin Road South</li>
                            <li class="list-group-item border-0">Bellevue Nebraska</li>
                            <li class="list-group-item border-0">68005</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="row text-center">
                    <div class="col-12">
                        <h1>Heading&nbsp;<i class="fas fa-phone-volume"></i></h1>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-12">
                        <ul>
                            <li class="list-group-item border-0">Phone: 1-402-293-2000</li>
                            <li class="list-group-item border-0">Phone (Toll Free): 1-800-756-7920</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="Footer.jsp" flush="true"/>
    <jsp:include page="ScriptFooter.jsp" flush="true"/>
</body>
</html>
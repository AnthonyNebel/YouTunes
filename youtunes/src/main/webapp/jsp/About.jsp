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
    <link rel="stylesheet" href="/youtunes/assets/css/footer-basic.css">
    <link rel="stylesheet" href="/youtunes/assets/css/styles.css">
</head>

<body>
	<jsp:include page="TopNav.jsp" flush="true"/>
    <div class="container py-5 width-50">
        <div class="row">
            <div class="col-12"><h4>About YouTunes!</h4></div>
        </div>
        <div class="row">
            <div class="col-4">
            	<img src="/youtunes/images/test.jpeg">
           	</div>
            <div class="col-8">
                <p><br>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet blandit eros.
                Vestibulum hendrerit aliquet odio sit amet ornare. Praesent commodo velit magna. Quisque volutpat
                sapien vitae purus ullamcorper euismod. Vivamus quis leo non neque sagittis fringilla. Proin feugiat,
                ante eu tincidunt dapibus, felis lorem feugiat est, vitae vestibulum ligula velit in velit. In hac
                habitasse platea dictumst. Aenean iaculis mattis molestie. Etiam viverra, metus tristique sodales
                mattis, dui arcu eleifend dolor, id volutpat eros mauris ut urna. Ut et diam in nunc tristique dictum
                eget auctor dolor. Maecenas sodales augue leo, id tristique magna viverra ut.<br><br></p>
            </div>
        </div>
    </div>
    <jsp:include page="Footer.jsp" flush="true"/>
    <jsp:include page="ScriptFooter.jsp" flush="true"/>
</body>
</html>
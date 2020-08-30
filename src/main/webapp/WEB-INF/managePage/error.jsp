<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>404</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/errorPage/css/style-freedom.css">
  <link href="https://fonts.googleapis.com/css?family=Quicksand:400,700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,700&display=swap" rel="stylesheet">                                 
</head>
<body>
<section class="w3l-errorpage">
    <div class="error404">
	      <div class="wrapper">
        <div class="logo-brand">
            <h1><a class="brand-logo-text" href="">Candy <div class="position-head"><span class="">E</span>rror
                </div>Page</a></h1>

            <!-- if logo is image enable this   
            <a class="brand-logo" href="#error.jsp">
                <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
            </a> -->
        </div>
		     </div>
        <div class="wrapper">
            <div class="midle-page">
			        <section class="error-container">
                    <span><span>4</span></span>
                    <span>0</span>
                    <span><span>4</span></span>
                </section>
                <h1>Page Not Found</h1>
                <p class="zoom-area para">对不起，页面丢失了，请返回首页或者联系我们哦 </p>
 
                <div class="link-container">
                    <a href="${pageContext.request.contextPath}/managerMain" class="more-link">返回首页</a>
                    
                </div>
            </div>
            <div class="columns-copy ">
                <p class="copy-footer">Copyright &copy; 404.life All rights reserved.</p>
            </div>
        </div>
    </div>
</section>
	</body>
	</html>
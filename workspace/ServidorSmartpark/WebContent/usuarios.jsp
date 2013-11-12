<!DOCTYPE html>
<%@page import="br.feevale.smartpark.sessao.GerenciadorDeSessao"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>Smartpark</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="css/starter-template.css" rel="stylesheet">
  </head>

  <body>
  
  <%
if( !GerenciadorDeSessao.isSessaoValida( request ) ) {
	response.sendRedirect( "login.jsp" );
}

%>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">SmartPark</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="areas.jsp">Áreas</a></li>
            <li><a href="vagas.jsp">Vagas</a></li>
            <li class="active"><a href="usuarios.jsp">Usuarios</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="container" id="areas">
	
      <div class="starter-template">
      </div>

    </div>
    
    
    


    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  </body>
</html>

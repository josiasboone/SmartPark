<%@page import="br.feevale.smartpark.sessao.GerenciadorDeSessao"%>

<html lang="en" id="principal">
  <head >
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>Smartpark</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="css/starter-template.css" rel="stylesheet">
    <script type="text/javascript">
	function abrirMenu( pagina ){
		var iframePagina = document.getElementById("iframePagina");

		iframePagina.src = pagina;
		iframePagina.submit;
		
	} 

    </script>
  </head>

  <body>
  
<%
if( !GerenciadorDeSessao.isSessaoValida( request ) ) {
%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
	
    <div class="navbar navbar-fixed-top" role="navigation">
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
            <li><a href="javascript:abrirMenu('areas.jsp');">Áreas</a></li>
            <li><a href="javascript:abrirMenu('vagas.jsp');">Vagas</a></li>
            <li><a href="javascript:abrirMenu('usuarios.jsp');">Usuarios</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
	       	<li><a id="sair" href="sair.jsp">Sair</a></li>
	      </ul>
        </div>
        
        
        
      </div>
    </div>
	
	<div style="width: 100%;height:100%;">
		<iframe src="branco.jsp" style="width: 100%;height:100%;" id="iframePagina" >
			
		</iframe>
	</div>
    
    
    


    <script src="bootstrap/js/jquery-2.0.3.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/smartpark.js"></script>
  </body>
</html>


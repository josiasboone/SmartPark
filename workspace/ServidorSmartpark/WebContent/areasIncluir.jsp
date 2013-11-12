<!DOCTYPE html>
<%@page import="br.feevale.smartpark.persistencia.tabelas.Area"%>
<%@page import="java.util.List"%>
<%@page import="br.feevale.smartpark.apresentacao.MntAreas"%>
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
    <link href="css/estilo.css" rel="stylesheet" />
  </head>

  <body>
  
  <%
if( !GerenciadorDeSessao.isSessaoValida( request ) ) {
	response.sendRedirect( "login.jsp" );
}
 MntAreas mnt = GerenciadorDeSessao.getMntAreas(request);

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
            <li class="active"><a href="areas.jsp">Áreas</a></li>
            <li><a href="vagas.jsp">Vagas</a></li>
            <li><a href="usuarios.jsp">Usuarios</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="container " id="areas">
	
      <div class="starter-template">
      
      	<div id="DivCorpoWeb">
       	<div id="ConteinerEdit" style="width: 40%; text-align: left;">
       		<div class="col-sm-offset-2 col-sm-10">
		    	<label >Incluindo Nova Áreas</label>
             </div>
			<form action="areas.jsp" method="get" name="area">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Descrição</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="descricao" name="descricao" >
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox" id="desativar" name="desativar">  Desativar Área
				        </label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <input type="submit" style="width:100px" value="Salvar" class="btn btn-default">
	                  <input onclick="window.history.back()" type="button" style="width:100px" value="Cancelar" class="btn btn-default">
				    </div>
				  </div>
				  
				  <input type="hidden" name="acao" value="incluir" />
	            
	            
	            
            </form>            
        </div>
    
    </div>
      
      </div>

    </div>
    
    
    


    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  </body>
</html>

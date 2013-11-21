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

   <body style="padding-top: 5px;">
  
  <%
if( !GerenciadorDeSessao.isSessaoValida( request ) ) {
	response.sendRedirect( "login.jsp" );
}
 MntAreas mnt = GerenciadorDeSessao.getMntAreas(request);

%>

      <div>
      
      	<div id="DivCorpoWeb">
       	<div id="ConteinerEdit" style="width: 40%; text-align: left;">
       		<div class="col-sm-offset-2 col-sm-10">
		    	<label >Incluindo Novo Usuario</label>
             </div>
			<form action="areas.jsp" method="get" name="area">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Usuario</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="descricao" name="descricao" >
				    </div>
				  </div>

					<div class="form-group">&nbsp;</div>
					
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Senha</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="senha" name="senha" >
				    </div>
				  </div>
				  
				  <div>&nbsp;</div>
				  
				   <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">&nbsp;</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="senha" name="senha" >
				    </div>
				  </div>
				  
				  <div>&nbsp;</div>
				  
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

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  </body>
</html>

<!DOCTYPE html>
<%@page import="br.feevale.smartpark.apresentacao.MntUsuario"%>
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
 MntUsuario mnt = GerenciadorDeSessao.getMntUsuario(request);
	
%>

      <div>
      
      	<div id="DivCorpoWeb">
       	<div id="ConteinerEdit" style="width: 40%; text-align: left;">
       		<div class="col-sm-offset-2 col-sm-10">
		    	<label >Incluindo Novo Usuario</label>
             </div>
			<form action="usuarios.jsp" method="post" name="usuarios">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Usuario</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="dsUsuario" name="dsUsuario" >
				    </div>
				  </div>

					<div class="form-group">&nbsp;</div>
					
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Senha</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="dsSenha" name="dsSenha" >
				    </div>
				  </div>
				  
				  <div>&nbsp;</div>
				  
				   <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">&nbsp;</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="dsSenhaConfirma" name="dsSenhaConfirma" >
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

    
    <script src="bootstrap/js/jquery-2.0.3.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/smartpark.js"></script>

  </body>
</html>

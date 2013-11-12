<!DOCTYPE html>
<%@page import="br.feevale.smartpark.sessao.GerenciadorDeSessao"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>SmartPark</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery.js"></script>
</head>
<body>
<%
if( !GerenciadorDeSessao.isSessaoValida( request ) ) {
	response.sendRedirect( "login.jsp" );
}

%>	
	
	
	<fieldset class="titled_box">
			<h2><span>SMART PARK</span></h2>
			<div class="form_content clearfix">
				<div class="form-group">
					<label for="email">Usuario</label>
					<input type="email" id="email" name="email" value="" class="account_input form-control">
				</div>
				<div class="form-group">
					<label for="passwd">Senha</label>
					<input type="password" id="passwd" name="passwd" value="" class="account_input form-control">
				</div>
				<p class="submit">
					<input type="hidden" class="hidden" name="back" value="my-account">					
					<input type="submit" id="SubmitLogin" name="SubmitLogin" class="button btn btn-default" value="Entrar">
				</p>
                				
			</div>
		</fieldset>


</body>
</html>
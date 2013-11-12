<!DOCTYPE html>
<%@page import="br.feevale.smartpark.sessao.GerenciadorDeSessao"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMART PARK Login</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/signin.css">
    <script type="text/javascript" src="js/smartpark.js" ></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
  
    
  <%
if( GerenciadorDeSessao.isSessaoValida( request ) ) {
	response.sendRedirect( "index.jsp" );
}

%>
  	<script src="https://code.jquery.com/jquery.js"></script>
	
	
    <div class="container">
      <form id="frmLogin" class="form-signin" method="post" action="efetuaLogin.jsp">
        <h2 class="form-signin-heading">LOGIN</h2>
        <input type="text" class="form-control" placeholder="Usuario" required autofocus name="nmLogin">
        <input type="password" class="form-control" placeholder="Senha" required name="nmSenha">
        <label class="checkbox"><input type="checkbox" value="salvar">Salvar</label>
        <div id="msgErro" >
     	</div>
        
        <button  class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
      </form>
    </div>
  </body>
  <script type="text/javascript">
  
  var erro = getURLParameter( window.location.href, 'erro' );
  var msgErro = document.getElementById("msgErro");
  if( erro != null ){
	  msgErro.setAttribute("class", "alert alert-warning fade in");
	  msgErro.innerHTML = 'Usuario ou Senha Invalida!';
  }
  </script>
</html>
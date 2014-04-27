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
    <script src="bootstrap/js/jquery-2.0.3.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/smartpark.js"></script>
  </head>
  <body>
	
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

  if( top.location !=  location){
	  top.location.href = 'index.jsp';  
  }
  
  
  </script>
</html>
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
 String msg = mnt.executaAcao(request);
 
 if( msg != null ){
	%>
		<script>
		alert('<%=msg%>');
		</script>
 <%}%>

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

    <div class="container" id="areas">
	
      <div class="starter-template">
      
      	<div id="DivCorpoWeb">
       	<div id="Conteiner">
            <table id="TbListaArea" border="1" cellspacing="0" cellpadding="0">
           <tr>
            	<td>
                    <div class="SubTituloDescricao">Descrição</div>
                </td>
                <td colspan="2">
                	<div class="SubTituloDescricao">&nbsp;</div>
                </td>
            </tr>
           
            
         <%
         	List<Area> lista = mnt.getLista();
         	for( Area area : lista ){%>
         	 <tr>	
                <td>
                    <div class="SubTituloArea"><%=area.getDsArea()%></div>
                </td>
                <td>
                    <a href="#">Alterar</a>
                </td>
                <td>
                    <a href="#">Excluir</a>
                </td>
            </tr>
         <%}%>   
            
            
           
            
            </table>
            </div>
    
        <div id="areIncluir"><a href="areasIncluir.jsp">Incluir </a></div>
    </div>
      
      </div>

    </div>
    
    
    


    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  </body>
</html>

<%@page import="br.feevale.smartpark.sessao.GerenciadorDeSessao"%>
<html>
<script type="text/javascript">

	
<%
if( GerenciadorDeSessao.gravaUsuarioNaSessao(request) ) {
	response.sendRedirect( "index.jsp" );
} else {
  	response.sendRedirect( "index.jsp?erro='ERRO'" ); 
}%>



</script>
</html>
<%@page import="br.feevale.smartpark.sessao.GerenciadorDeSessao"%>
<%
if( !GerenciadorDeSessao.isSessaoValida( request ) ) {
%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%
} else {
%>
	<jsp:forward page="principal.jsp"></jsp:forward>
<%
}
%>
<html>
<script src="bootstrap/js/jquery-2.0.3.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<%@page import="br.feevale.smartpark.sessao.GerenciadorDeSessao"%>

<%
if( !GerenciadorDeSessao.isSessaoValida( request ) ) {
	response.sendRedirect("login.jsp");
} else {
	response.sendRedirect("principal.jsp");
}
%>
 </html>

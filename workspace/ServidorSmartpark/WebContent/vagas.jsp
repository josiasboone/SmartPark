<!DOCTYPE html>
<%@page import="br.feevale.smartpark.persistencia.tabelas.Area"%>
<%@page import="br.feevale.smartpark.persistencia.tabelas.Vaga"%>
<%@page import="java.util.List"%>
<%@page import="br.feevale.smartpark.apresentacao.MntVagas"%>
<%@page import="br.feevale.smartpark.sessao.GerenciadorDeSessao"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/signin.css">
	<link href="css/starter-template.css" rel="stylesheet">
	<link href="css/estilo.css" rel="stylesheet" />
	
	<script src="bootstrap/js/jquery-2.0.3.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/smartpark.js"></script>
	<title>Smartpark</title>
  </head>

  <body style="padding-top: 5px;">
   <%

	MntVagas mnt = GerenciadorDeSessao.getMntVagas(request);
	 
	String msg = null;
	if( mnt != null) {
		msg = mnt.executaAcao(request);
	}
	 
	if( msg != null ){
		%>
			<script>
			alert('<%=msg%>');
			</script>
	 <%}%>
		<script>
		debugger;
			var selecao = 0;

			try{
				selecao = <%=request.getParameter("selecione")%>;
			} catch (e) {
				selecao = 0;
			}

		
			function excluir( dsVaga, idVaga ){
				if( confirm("Você gostaria de Excluir a Vaga " + dsVaga )){
					var frmEx = document.getElementById("excluir");
					
					frmEx.idVaga.value = idVaga;
					frmEx.submit();
				}
			}

			function selecionaArea() {
				var selectArea = document.getElementById("selectArea");
				 
				var valorArea = selectArea.options[selectArea.selectedIndex].value;

				location.href = "vagas.jsp?area=" + valorArea + "&selecione=" + selectArea.selectedIndex;
				
			}
		</script>
  
    <div >      
      	<div id="DivCorpoWeb">
       	
			<div id="Conteiner">       	          
		       	<br>
		       	<div id="TbListaArea">
					<div class="SubTituloArea">Area:
						<select id="selectArea" onchange="selecionaArea()" name="selectArea" class="span3" style="width:200px;"> 
							<option value="X" >-- Selecione --</option>
							
							<% if(mnt !=null){
								List<Area> lista = mnt.getListaAreas();
								
								for( Area area : lista ){
							%>
							<option value="<%=area.getIdArea()%>" ><%=area.getDsArea()%></option>
							<%		
								}
							%> 
						</select>
					</div>			
				</div>
				<br>
		        <table id="TbListaArea" border="1" cellspacing="0" >
		        <tr>
		         	<td>
		                 <div class="SubTituloDescricao">Descrição</div>
		             </td>
		             
		             <td>
		                 <div class="SubTituloDescricao">Estado</div>
		             </td>
		             
		             <td>
		                 <div class="SubTituloDescricao">Tipo</div>
		             </td>
		             
		             <td colspan="2">
		             	<div class="SubTituloDescricao">&nbsp;</div>
		             </td>
		             
		         </tr>
		        
         <%
         	
         	List<Vaga> listaVagas = mnt.getLista( request );
         	for( Vaga vaga : listaVagas ){
         %>
		      	 <tr>	
		             <td>
		                 <div class="SubTituloArea"><%=vaga.getDsVaga()%></div>
		             </td>
		             
		             <td>
		                 <div class="SubTituloArea"><%=vaga.getTpEstado()%></div>
		             </td>
		             
		             <td>
		                 <div class="SubTituloArea"><%=vaga.getTpVaga()%></div>
		             </td>
		             
		             <td>
		                 <a href="#">Alterar</a>
		             </td>
		             
		             <td>
		                 <a href="javascript:excluir('','')">Excluir</a>
		             </td>
		         </tr>
		 <%}
         }%> 
		              
		         </table>
			</div>
		    
		    
			<div id="areIncluir" >
				<a href="vagasIncluir.jsp">Incluir </a></div>
		    </div>
      
      </div>

	<form name="excluir" id="excluir" method="GET" action="areas.jsp">
		<input type="hidden" name="acao" value="excluir" />
		<input type="hidden" name="idArea" value="0" />
	</form>     
    
    
    <script src="bootstrap/js/jquery-2.0.3.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/smartpark.js"></script>
   
  </body>
<script>
var areIncluir = document.getElementById("areIncluir");
areIncluir.style.visibility="hidden";
if( selecao != 0 && selecao != null ){
	var selectArea = document.getElementById("selectArea");
	selectArea.selectedIndex = selecao;
	areIncluir.style.visibility="visible";
}
</script>
</html>
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

  MntAreas mnt = GerenciadorDeSessao.getMntAreas(request);
 
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
		function excluir( dsArea, idArea ){
			if( confirm("Você gostaria de Excluir a Area " + dsArea )){
				var frmEx = document.getElementById("excluir");
				
				frmEx.idArea.value = idArea;
				frmEx.submit();
			}
		}
	</script>
      <div >
      
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
         	if(mnt !=null){
         	List<Area> lista = mnt.getLista();
         	for( Area area : lista ){%>
         	 <tr>	
                <td>
                    <div class="SubTituloArea"><%=area.getDsArea()%></div>
                </td>
                <td>
                    <a href="areasAlterar.jsp?idArea=<%=area.getIdArea()%>">Alterar</a>
                </td>
                <td>
                    <a href="javascript:excluir('<%=area.getDsArea()%>','<%=area.getIdArea()%>')">Excluir</a>
                </td>
            </tr>
         <%}
         }%>   
            
            </table>
            </div>
    	
        <div id="areIncluir"><a href="areasIncluir.jsp">Incluir </a></div>
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

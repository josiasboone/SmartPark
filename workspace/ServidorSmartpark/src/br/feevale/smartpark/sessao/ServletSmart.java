package br.feevale.smartpark.sessao;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class ServletSmart implements javax.servlet.Filter {
	
	
	private FilterConfig filterConfig;
	
	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		
		if( request instanceof HttpServletRequest ){
			HttpServletRequest httpServletRequest = (HttpServletRequest) request;
			String uri = httpServletRequest.getRequestURI();
			
			if( !GerenciadorDeSessao.isSessaoValida(httpServletRequest)){
				
				if( !uri.contains("index.jsp") && !uri.contains("login.jsp") && !uri.contains("sair.jsp") && !uri.contains("efetuaLogin.jsp") ){
					
					OutputStream out = response.getOutputStream();
					GenericResponseWrapper wrapper = new GenericResponseWrapper((HttpServletResponse) response); 
					
					filterChain.doFilter(request,wrapper);
					wrapper.sendRedirect("sair.jsp");
					out.close();
					return;
				}
			} else {
				if( uri.contains("login.jsp") ){
					OutputStream out = response.getOutputStream();
					GenericResponseWrapper wrapper = new GenericResponseWrapper((HttpServletResponse) response); 
					
					filterChain.doFilter(request,wrapper);
					wrapper.sendRedirect("index.jsp");
					out.close();
					return;
				}
			}
		}
		
		filterChain.doFilter(request, response);
		
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}
}
package com.kh.semi.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.kh.semi.wrapper.LoginWrapper;


/**
 * Servlet Filter implementation class EncryptFilter
 */
@WebFilter("*.me")
public class EncryptFilter implements Filter {


    public EncryptFilter() {
        System.out.println("나도 객체 생성");
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest hRequest = (HttpServletRequest)request;
		
		
		LoginWrapper lw = new LoginWrapper(hRequest);
		System.out.println(lw);
		
		chain.doFilter(lw, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}




















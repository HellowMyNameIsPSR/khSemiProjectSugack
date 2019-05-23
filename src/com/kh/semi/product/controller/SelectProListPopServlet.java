package com.kh.semi.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.semi.funding.model.vo.WorkPic;
import com.kh.semi.product.model.service.ProService;
import com.kh.semi.product.model.vo.Product;

/**
 * Servlet implementation class SelectProListPopServlet
 */
@WebServlet("/selectProListPop.pro")
public class SelectProListPopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProListPopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*ArrayList<HashMap<String,Object>> list = new ProService().selectProductListPop();
		
		System.out.println("popServlet : "+ list);
		
		JSONArray result = new JSONArray();
		
		JSONObject prolist = null;

		   for(int i=0; i<list.size();i++) {
			   prolist = new JSONObject();
			   HashMap<String, Object> hlist = list.get(i);

			  
			   prolist.put("wconent", hlist.getWorkContent());
			   prolist.put("changeName", hlist.getChangeName());
			   prolist.put("filePath", hlist.getFilePath());
		   
			   result.add(prolist);
		   }
		response.setContentType("application/json");
	    new Gson().toJson(result, response.getWriter());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

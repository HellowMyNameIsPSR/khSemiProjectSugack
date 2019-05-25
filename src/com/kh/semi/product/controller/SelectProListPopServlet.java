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
		
		String cid = request.getParameter("cid");
		ArrayList<HashMap<String,Object>> list = null;
		
		if(cid == null) {
			list = new ProService().selectProductListPop();			
		}else {
			list = new ProService().selectProductListPop(cid);
		}
		
		
		System.out.println("popServlet : "+ list);
		
		if(list != null && cid == null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/product/products.jsp").forward(request, response);
		}else if (list != null && cid != null){
			request.setAttribute("list", list);
			request.setAttribute("cid", Integer.parseInt(cid));
			request.getRequestDispatcher("views/product/categoryProduct.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "알수없는 오류");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		/*JSONArray result = new JSONArray();
		
		JSONObject prolist = null;

		   for(int i=0; i<list.size();i++) {
			   prolist = new JSONObject();
			   HashMap<String, Object> hlist = list.get(i);

			  
			   prolist.put("workContent", hlist.get("workContent"));
			   prolist.put("workName", hlist.get("workName"));
			   prolist.put("price", hlist.get("price"));
			   prolist.put("category", hlist.get("category"));
			   prolist.put("filePath", hlist.get("filePath"));
			   prolist.put("changeName", hlist.get("changeName"));
			   
			  
		   
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

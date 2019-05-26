package com.kh.semi.author.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.semi.author.model.service.AuthorService;

/**
 * Servlet implementation class SelectSalesForMain
 */
@WebServlet("/selectSalesForMain.at")
public class SelectSalesForMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSalesForMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mid = Integer.parseInt(request.getParameter("mid"));
		
		ArrayList<HashMap<String, Object>> list = new AuthorService().selectSalesForMain(mid);
		
		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();
		JSONObject ajaxObjCols2= new JSONObject();
		JSONArray ajaxArrayCols = new JSONArray();
		JSONArray ajaxArrayRows = new JSONArray();

		ajaxObjCols1.put("id", "day");
		ajaxObjCols1.put("label", "day");
		ajaxObjCols1.put("type", "string");
		ajaxObjCols2.put("id", "won");
		ajaxObjCols2.put("label", "won");
		ajaxObjCols2.put("type", "number");
		ajaxArrayCols.add(ajaxObjCols1);
		ajaxArrayCols.add(ajaxObjCols2);
		
		for(int i = 0; i < list.size(); i++) {
			JSONObject legend = new JSONObject();
			legend.put("v", list.get(i).get("day"));
			legend.put("f", null);
			
			JSONObject value = new JSONObject();
			value.put("v", list.get(i).get("sales"));
			value.put("f", null);
			
			JSONArray cValueArray = new JSONArray();
			cValueArray.add(legend);
			cValueArray.add(value);
			
			JSONObject cValueObj = new JSONObject();
			cValueObj.put("c", cValueArray);
			
			ajaxArrayRows.add(cValueObj);
		}
		data.put("cols", ajaxArrayCols);
		data.put("rows", ajaxArrayRows);
		
		response.setContentType("application/json");
		response.getWriter().print(data.toJSONString());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

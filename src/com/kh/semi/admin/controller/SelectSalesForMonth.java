package com.kh.semi.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.semi.admin.model.service.adminService;

/**
 * Servlet implementation class SelectSalesForMonth
 */
@WebServlet("/selectSalesForMonth.ad")
public class SelectSalesForMonth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSalesForMonth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String choice = "sales";
		
		System.out.println(startDate);
		System.out.println(endDate);
		
		Date sDate = Date.valueOf(startDate);
		Date eDate = Date.valueOf(endDate);
		
		ArrayList<Integer> list = new adminService().selectForMonth(sDate, eDate, choice);
		ArrayList<String> list2 = new adminService().getMonth(sDate, eDate, choice);
		
		System.out.println(list);
		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();
		JSONObject ajaxObjCols2= new JSONObject();
		JSONArray ajaxArrayCols = new JSONArray();
		JSONArray ajaxArrayRows = new JSONArray();

		ajaxObjCols1.put("id", "month");
		ajaxObjCols1.put("label", "Month");
		ajaxObjCols1.put("type", "string");
		ajaxObjCols2.put("id", "won");
		ajaxObjCols2.put("label", "won");
		ajaxObjCols2.put("type", "number");
		ajaxArrayCols.add(ajaxObjCols1);
		ajaxArrayCols.add(ajaxObjCols2);
		
		for(int i = 0; i < list.size(); i++) {
			JSONObject legend = new JSONObject();
			legend.put("v", list2.get(i));
			legend.put("f", null);
			
			JSONObject value = new JSONObject();
			value.put("v", list.get(i));
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

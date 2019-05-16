package com.kh.semi.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.semi.admin.model.service.adminService;

/**
 * Servlet implementation class SelectMemberForWeek
 */
@WebServlet("/selectMemberForWeek.ad")
public class SelectMemberForWeek extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectMemberForWeek() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String choice = "member";
		String gender = request.getParameter("gender");
		String date = request.getParameter("date");
		
		if(gender == null) {
			gender = "all";
		}
		
		System.out.println(gender);
		
		System.out.println(startDate);
		System.out.println(endDate);
		
		Date sDate = Date.valueOf(startDate);
		Date eDate = Date.valueOf(endDate);
		
		Map<String, ArrayList> hmap = new adminService().selectMemberForWeek(sDate, eDate, date);
		ArrayList<String> list2 = new adminService().getWeek(sDate, eDate, choice);

		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();
		JSONObject ajaxObjCols2 = new JSONObject();
		JSONObject ajaxObjCols3 = new JSONObject();
		JSONArray ajaxArrayCols = new JSONArray();
		JSONArray ajaxArrayRows = new JSONArray();
//		JSONArray ajaxArray = new JSONArray();
		
		ajaxObjCols1.put("type", "string");
		ajaxObjCols1.put("id", "week");
		ajaxObjCols1.put("label", "week");
		
		ajaxObjCols2.put("type", "number");
		ajaxObjCols2.put("id", "male");
		ajaxObjCols2.put("label", "male");
		
		ajaxObjCols3.put("type", "number");
		ajaxObjCols3.put("id", "female");
		ajaxObjCols3.put("label", "female");
		
		ajaxArrayCols.add(ajaxObjCols1);
		ajaxArrayCols.add(ajaxObjCols2);
		ajaxArrayCols.add(ajaxObjCols3);
		
		
		for(int i = 0; i < hmap.get("maleList").size(); i++) {
			JSONObject legend = new JSONObject();
			legend.put("v", list2.get(i));
			legend.put("f", null);
			
			JSONObject value = new JSONObject();
			if(!gender.equals("F")) {
				value.put("v", hmap.get("maleList").get(i));
				value.put("f", null);	
			}
			JSONObject value2 = new JSONObject();
			if(!gender.equals("M")) {
				value2.put("v", hmap.get("femaleList").get(i));
				value2.put("f", null);	
			}
			
			JSONArray cValueArray = new JSONArray();
			cValueArray.add(legend);
			cValueArray.add(value);
			cValueArray.add(value2);	
			
			JSONObject cValueObj = new JSONObject();
			cValueObj.put("c", cValueArray);

			
			ajaxArrayRows.add(cValueObj);
		}
		data.put("cols", ajaxArrayCols);
		data.put("rows", ajaxArrayRows);
		
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

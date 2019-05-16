$(function(){
	$(".table tbody td").mouseenter(function(){
		$(this).parent().css({
			"background" : "#3366ff",
			"color" : "white"
		});
	}).mouseout(function(){
		$(this).parent().css({
			"background" : "white",
			"color" : "#333333"
		});
	}).click(function(){
		$("#myModal").modal();
	});
	
	$("#application2").mouseenter(function(){
		$(this).css({
			"background" : "#3366ff",
			"color" : "white"
		});
	}).mouseout(function(){
		$(this).css({
			"background" : "white",
			"color" : "#333333"
		});
	}).click(function(){
		location.href="application2.jsp";
	});
});
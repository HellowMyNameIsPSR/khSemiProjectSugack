$(function(){
	$("#fundOptionTable").children().children().mouseenter(function(){
		$(this).css({
			"border" : "2px solid #3366ff"
		});
	}).mouseout(function(){
		$(this).css({
			"border" : "1px solid #ddd"
		});
	}).click(function(){
		console.log("클릭");
	});
});
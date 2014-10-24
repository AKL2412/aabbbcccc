jQuery(document).ready(function($) {
	$.each($('button.modifier-block'), function(index, val) {
		 var btn = $(val);
		 btn.click(function(event) {
		 	var btn = $(this);
		 	var type = btn.attr('type');
		 	var id = 0;
		 	try{
		 		id = btn.attr('objectId');
		 	}catch(e){id = 0;}
		 	var slug = $('#presente-scte').attr('slug');
		 	var main = boxAlert();
		 	var url = '/GestPaie/societe/'+slug+'/gerer-salaries/modifier/'+type+'/'+id;
		 	
		 	$.ajax({
		 		url: url,
		 		type: 'GET',
		 		dataType: 'html',
		 		data: {},
		 	})
		 	.done(function(data) {
		 		main.html(data);
		 	})
		 	.fail(function() {
		 		console.log("error");
		 	}).always(function() {console.log("complete");});
		 	
		 	
		 });
	});
});
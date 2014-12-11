jQuery(document).ready(function($) {
	
	$('.unJour').click(function(event) {
		/* Act on the event */
		var j = $(this);
		var etat = j.attr('etat');
		if(etat == 'vide'){
			j.addClass('success');
 			j.attr('etat', 'check');
		}else{
			j.removeClass('success');
			j.attr('etat', 'vide');
		}
	});
	
	$('#voir-jours').click(function(e){
		var btn = $(this);
		var nbre = 0;
		if(btn.attr('voir') == 'ferier'){
			$.each($('.unJour'),function(i,v){
				if($(v).attr('etat') == 'vide')
					$(v).hide();
				else
					nbre ++;
			});
			btn.attr('voir','tous');
			btn.text('Rétablir | '+nbre+' Jour(s) férier(s)');
		}else{
			$('.unJour').show();
			btn.text('Voir les jours cochés');
			btn.attr('voir','ferier');
		}
		
	});
	
	
$('#terminer').click(function(event) {
	/* Act on the event */
	
	//$(this).insertAfter(img);
	var elt = $(this);
	var type = $(this).attr('object');
	var id = $(this).attr('objectId');
	var action = $(this).attr('action');
	var chaine = "";
	$.each($('.unJour'),function(i,v){
		if($(v).attr('etat') != 'vide')
			chaine += $(v).attr('date')+'##';
		
	});
	if(type.length > 0 && id.length > 0 && action.length > 0){
		var datas = {
			action :action,
			type : type,
			id : id,
			chaine:chaine
		};
		
			
		deleteUpdate(datas,elt, true);
		
		
		
	}else{
		notifier("Erreur des données !!! ",false);
	}
	
	
});

});
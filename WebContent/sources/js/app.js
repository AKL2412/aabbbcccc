jQuery(document).ready(function($) {
	
	
	//alert(getRacine());
	//notifier("verificaion");

	/*
		Suppression des objets
	*/
	$('.supprimer-object').click(function(event) {
		/* Act on the event */
		
		//$(this).insertAfter(img);
		var elt = $(this);
		var type = $(this).attr('object');
		var id = $(this).attr('objectId');
		var action = $(this).attr('action');
		
		if(type.length > 0 && id.length > 0 && action.length > 0){
			var datas = {
				action :action,
				type : type,
				id : id
			}
			//notifier("Type : "+type+" Identifiant : "+id,true);

			deleteUpdate(datas,elt,action == "delete" ? true:false);
			
		}else{
			notifier("Erreur des données !!! ",false);
		}
		
		
	});

	

});
	
	function deleteUpdate(datas,elt,etat){

		$('<img src="/GestPaie/sources/img/loaderf.gif" >').insertAfter(elt);
		$.post(getRacine()+'/supprimer-update', datas, function(data, textStatus, xhr) {
			/*optional stuff to do after success */
			notifier(data,etat);
			elt.next('img').remove();
		});
	}

	function getRacine(){
		var URL = window.location.href.toString().split(window.location.host)[1];
	var URLs = URL.split('/');
	var racine = URLs[1];
	return "/"+racine;
	}
	function notifier(message,relaod){
		var temps = 10;
		var box = notifocationBox(message,temps);
		$('body').append(box);
		actualiser(box.find('.compteur'),temps,relaod);
	}
	function actualiser(elt,tps,relaod){
		var t = setInterval(function(){
			if(tps > 1 ){
				tps --;
				elt.text(tps);
			}else{
				clearInterval(t);
				elt.parent().remove();
				if(relaod)
					location.reload();
			}
		},1000);
	}

	function notifocationBox(message,temps){
		return $('<div id="notification">'+message+'<div class="compteur badge">'+temps+'</div></div>');
	}
	function createAlertBox(){
		var box = $('<div id="alert-box"><div class="bg"><i class="glyphicon glyphicon-remove"></i></div></div>');
		var main = $('<div class="alert-main"></div>');
		main.append($('<div class="msg">chargement...</div>'))
		box.append(main);
		box.find('i').click(function(event) {
			hideBoxAlert();
		});
		box.find('.bg').click(function(event) {
			hideBoxAlert();
		});
		return {
			box:box,
			main:main
		};
	}
	function hideBoxAlert(){
		$("body").css('overflow', 'auto');
		$('#alert-box').remove();
	}
	function boxAlert(){
		var b = $('#alert-box');
		if(b.length > 0){

			return b.find('.alert-main');
		}else{

			var p = createAlertBox();
			$('body').append(p.box);

			$("body").css('overflow', 'hidden');
			return p.main;

		}
		
	}
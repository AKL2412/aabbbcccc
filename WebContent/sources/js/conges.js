jQuery(document).ready(function($) {
	$('#dateDedebut').datepicker( );
	$('#dateDefin').datepicker();
	$('#btn-valider').attr('disabled', 'disabled');

	var total = $('#dateDedebut').attr('total');

	$('#dateDedebut').change(function(event) {
		/* Act on the event */
		var dateD = $(this).attr('dateDebut');
		var DateS = $(this).val();
		if(Date.parse(dateD) > Date.parse(DateS) ){

			notifier("La date de debut de congé doit supérieure ou égale à  : "+dateD,false);
			 $(this).val("");
		}
	});

	$('#dateDefin').change(function(event) {
		/* Act on the event */
		var dateD = $(this).attr('dateDebut');
		var DateS = $(this).val();
		if($('#dateDedebut').val() ==""){
			notifier("Veuillez renseigner la date de debut de congé",false);
			 $(this).val("");
		}
		else{
			if(Date.parse($('#dateDedebut').val()) > Date.parse($(this).val()) ){

			notifier("La date de debut de congé doit inférieure ou égale à  la date de fin de congé ",false);
			
			}else{
				var ddF = new Date($('#dateDedebut').val());
				var ddFs = ddF.getFullYear()+'-'+parseInt(ddF.getMonth()+1)+'-'+ddF.getDate();

				var dfF = new Date($(this).val());
				var dfFs = dfF.getFullYear()+'-'+parseInt(dfF.getMonth()+1)+'-'+dfF.getDate();

				nbreDejour(ddFs,dfFs,total);
			}
		}
			
	});
});

function nbreDejour(debut,fin,total){
	var d = {
		debut:debut,
		fin:fin
	};
	$.post(getRacine()+'/nombre-de-jour', d, function(data, textStatus, xhr) {
		
		if(isNaN(data))
			notifier(data,false);
		else{
			var jour = parseInt(data);
			if(jour <= total){
				$('#jourtotal').val(jour);
			$('#btn-valider').removeAttr('disabled');
			}else{
				notifier("Ce salarié ne dispose que de "+total+" jour(s) de congé ! Vous avez sélectionné "+jour+" jour(s) de congé")
			}
			

		}
			
	});	
		
}
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

			notifier("La date de debut de cong� doit sup�rieure ou �gale � : "+dateD,false);
			 $(this).val("");
		}
	});

	$('#dateDefin').change(function(event) {
		/* Act on the event */
		var dateD = $(this).attr('dateDebut');
		var DateS = $(this).val();
		if($('#dateDedebut').val() ==""){
			notifier("Veuillez renseigner la date de debut de cong�",false);
			 $(this).val("");
		}
		else{
			if(Date.parse($('#dateDedebut').val()) > Date.parse($(this).val()) ){

			notifier("La date de debut de cong� doit inf�rieure ou �gale � la date de fin de cong� ",false);
			
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
				notifier("Ce salari� ne dispose que de "+total+" jour(s) de cong� ! Vous avez s�lectionn� "+jour+" jour(s) de cong�")
			}
			

		}
			
	});	
		
}
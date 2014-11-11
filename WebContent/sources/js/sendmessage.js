jQuery(document).ready(function($) {
	$('.contenuMessage').hide();

	$('#select-type').change(function(event) {
		/* Act on the event */
		if($(this).val() == 0 ){

			$('#box-contenu').html($('#unMessage'));
		}else if($(this).val() == 1 ){
			$('#box-contenu').html($('#unBareme'));
		}else{

		}
	});
});
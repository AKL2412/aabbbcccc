$(document).ready(function(){
	
	$("#inputFile").change(function(){
		
		var ext = $(this).val().split(".").pop().toLowerCase();
		var iSize = ($(this)[0].files[0].size / 1024);
		iSize = (Math.round((iSize / 1024) * 100) / 100);
		console.log($(this)[0].files[0]);
		if(iSize > 1){
			alert("Fichier trop lourd :"+iSize+ " Mb");
			$(this).val("");
		}
		else if($.inArray(ext, ["txt","pdf","docx","xlsx","csv","rtf"]) == -1) {
		alert("Upload un fichier d'extension : txt,pdf,docx");
		$(this).val("");
		
		} 
		
		
	});
});
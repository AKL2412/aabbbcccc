jQuery(document).ready(function($) {

	$(document).scroll(function(event) {
		/* Act on the event */
		if($('body').offset().top < 80 ){
			$('.gp-menu-right').addClass('gp-menu-right-box-shadow');
		}else{
			$('.gp-menu-right').removeClass('gp-menu-right-box-shadow');
		}
		
	});
	$('.message i').click(function(e){
		$(this).parent().hide();
	});
// Small menu
var smallMenu = $("#body .gp-menu-top .gp-widget .top-menu").hide();
var smallActiveMenu = $("#body .gp-menu-top .sous-menu-top");

var rightMenu = $('#body .gp-menu-right-main-content .gp-menu-right');
	$('#voir').click(function(event) {
		/* Act on the event */
		alert($('.gp-menu-right').text())
	});

	//Show menu
	$('#body .gp-menu-top .gp-widget i').click(function(event) {
		event.stopPropagation();
		smallMenu.html(rightMenu.html()).toggle();
	});

	/*________________________

	*/
	smallMenu.click(function(event) {
		/* Act on the event */
		event.stopPropagation();
	});
	$('html').click(function() {
		smallMenu.hide();
	});
	var ul = $('<ul></ul>');
	var liS = rightMenu.find('ul li.active');
	var dlis = liS.clone(true, true);
	$('#link-selected').html(dlis.find('a:first'));
	ul.append(liS.find('ul').html());
	smallActiveMenu.html(ul);


	

});

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
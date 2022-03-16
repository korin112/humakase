$(function() {
	let url = window.location.pathname;
	console.log(url);
//	let str_idAttr = url.split('/');
//	let idAttr = '';
//	for(i = 0; i < str_idAttr.length; i++){
//		console.log(str_idAttr[str_idAttr.length - 1]);
//	}
//	console.log(idAttr);
	$('.adm_header .nav li').each(function() {
		console.log($(this).children('a').attr('href'));
		if($(this).children('a').attr('href') == url) {
			$('.adm_header .nav li a').removeClass('active');
			$('.adm_header .nav li a').attr('aria-current','');
			$(this).children('a').addClass('active');
			$(this).children('a').attr('aria-current','page');
		}
	})


});



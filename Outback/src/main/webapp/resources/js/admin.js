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
		console.log($('.nav-link').attr('href'));
		if($(this, '.nav-link').attr('href') == url) {
//			$(this).removeClass('active');
			$(this,'.nav-link').addClass('active');
		}
	});
});
